unit DAT.Provider.Placeholders;

{ Keeping format specifiers alive across a translation service.

  A string like

    %.2f GB used / %.2f GB free of %.2f GB (%.1f%%)

  is half sentence and half instruction. The words are for the translator; the
  specifiers are for Format, and they must come back byte for byte or the
  application prints its own source code at the user.

  Sent to Arabic, they did not come back. Every % became a 0:

    ... 0.2f ... 0.2f ... (0.1f%)

  German and Spanish returned all six unharmed through the same code on the
  same day, so this is the engine and the target language rather than anything
  here. That is precisely why it cannot be left to the engine: it worked twice
  and then quietly stopped working, and the only reason it was noticed is that
  the catalog validator refuses a pack whose placeholders do not match.

  So the specifiers are taken out before the text is sent and put back after.
  What the engine sees in their place is a short token of capital letters and
  a digit - ZQPH0ZQPH - which no translator has any reason to alter, and which
  carries its own index so that a token the engine has moved still comes back
  as the right specifier. Right-to-left languages move things.

  A string that is nothing but specifiers is not sent at all. "%.2d/%.2d" is a
  date format with no words in it; there is nothing to translate, the engine
  can only damage it, and asking costs money. }

interface

type
  TPlaceholderProtection = record
  public
    { True when the text has no words for a translator - only specifiers,
      punctuation and spacing. Such a string is returned unchanged rather than
      sent. }
    class function IsOnlyPlaceholders(const AText: string): Boolean; static;
    { The text with each format specifier replaced by a token, and the
      specifiers themselves in the order they were found. }
    class function Protect(const AText: string;
      out ASpecifiers: TArray<string>): string; static;
    { The tokens replaced by the specifiers they stand for. Tokens the engine
      has moved, spaced or changed the case of are still recognised; a token it
      has destroyed outright is left alone, and the catalog validator remains
      the backstop for that. }
    class function Restore(const AText: string;
      const ASpecifiers: TArray<string>): string; static;
    { Repair only a saved two-argument translation whose distinct, simple
      specifiers were exchanged. Repeated same-type arguments are ambiguous. }
    class function TryRepairSimpleReorder(const ASource,
      ATranslated: string; out ARepaired: string): Boolean; static;
    { Whether a round trip kept every specifier. Used to decide whether to
      trust a translation or fall back to the source text. }
    class function Matches(const ASource, ATranslated: string): Boolean; static;
  end;

implementation

uses
  System.Character,
  System.Classes,
  System.SysUtils;

const
  { Deliberately ugly and deliberately ASCII. A run of capitals with no vowel
    pattern is left alone by every engine tried, and being ASCII it cannot be
    damaged by an encoding round trip the way an exotic character could. }
  TokenPrefix = 'ZQPH';
  TokenSuffix = 'ZQPH';

{ Every Delphi format specifier in a string, in order.

  Delphi's grammar is "%" [index ":"] ["-"] [width] ["." precision] type,
  where width and precision may each be "*". The type letters are the ones
  Format accepts. "%%" is a literal percent and is protected too: an engine
  that halves it changes what the user reads. }
function FindSpecifiers(const AText: string): TArray<string>;
var
  Found: TStringList;
  Index: Integer;
  Start: Integer;
  Length_: Integer;

  function AtType(const APosition: Integer): Boolean;
  begin
    Result := (APosition <= System.Length(AText)) and
      CharInSet(AText[APosition],
        ['d', 'D', 'u', 'U', 'e', 'E', 'f', 'F', 'g', 'G', 'n', 'N',
         'm', 'M', 'p', 'P', 's', 'S', 'x', 'X']);
  end;

begin
  Found := TStringList.Create;
  try
    Index := 1;
    Length_ := System.Length(AText);
    while Index <= Length_ do
    begin
      if AText[Index] <> '%' then
      begin
        Inc(Index);
        Continue;
      end;
      Start := Index;
      Inc(Index);
      if (Index <= Length_) and (AText[Index] = '%') then
      begin
        { A literal percent. }
        Inc(Index);
        Found.Add(Copy(AText, Start, Index - Start));
        Continue;
      end;
      { index, flags, width and precision, in whatever combination }
      while (Index <= Length_) and
        (AText[Index].IsDigit or CharInSet(AText[Index],
          [':', '-', '.', '*'])) do
        Inc(Index);
      if AtType(Index) then
      begin
        Inc(Index);
        Found.Add(Copy(AText, Start, Index - Start));
      end;
      { A lone % that begins nothing is left where it is: it is not a
        specifier, and inventing one would be worse than ignoring it. }
    end;
    Result := Found.ToStringArray;
  finally
    Found.Free;
  end;
end;

function TokenFor(const AIndex: Integer): string;
begin
  Result := TokenPrefix + IntToStr(AIndex) + TokenSuffix;
end;

class function TPlaceholderProtection.IsOnlyPlaceholders(
  const AText: string): Boolean;
var
  Remaining: string;
  Specifier: string;
  Character: Char;
begin
  Result := False;
  if Trim(AText) = '' then
    Exit;
  Remaining := AText;
  for Specifier in FindSpecifiers(AText) do
    Remaining := StringReplace(Remaining, Specifier, '', []);
  { Whatever is left has to be free of letters and digits before the string
    counts as wordless. A separator, a bracket or a space is not a word. }
  for Character in Remaining do
    if Character.IsLetter or Character.IsDigit then
      Exit;
  Result := Length(FindSpecifiers(AText)) > 0;
end;

class function TPlaceholderProtection.Protect(const AText: string;
  out ASpecifiers: TArray<string>): string;
var
  Specifier: string;
  Index: Integer;
  At: Integer;
  Taken: Integer;
begin
  ASpecifiers := FindSpecifiers(AText);
  { Built in one pass rather than by replacement. Two identical specifiers -
    and "%.2f GB used / %.2f GB free" has three - must become two different
    tokens, which a search-and-replace cannot do. }
  Result := '';
  Index := 1;
  Taken := 0;
  while Index <= Length(AText) do
  begin
    if (AText[Index] = '%') and (Taken <= High(ASpecifiers)) then
    begin
      Specifier := ASpecifiers[Taken];
      At := Length(Specifier);
      if Copy(AText, Index, At) = Specifier then
      begin
        Result := Result + TokenFor(Taken);
        Inc(Taken);
        Inc(Index, At);
        Continue;
      end;
    end;
    Result := Result + AText[Index];
    Inc(Index);
  end;
end;

class function TPlaceholderProtection.Restore(const AText: string;
  const ASpecifiers: TArray<string>): string;
var
  ArgumentIndex: Integer;
  CanIndex: Boolean;
  Index: Integer;
  LowerText: string;
  Position: Integer;
  PreviousPosition: Integer;
  Reordered: Boolean;
  Replacement: string;
  Token: string;
begin
  CanIndex := True;
  Reordered := False;
  PreviousPosition := 0;
  LowerText := LowerCase(AText);
  for Index := 0 to High(ASpecifiers) do
  begin
    if (ASpecifiers[Index] <> '%%') and
       ((Length(ASpecifiers[Index]) <> 2) or
        (ASpecifiers[Index][1] <> '%')) then
      CanIndex := False;
    Position := Pos(LowerCase(TokenFor(Index)), LowerText);
    if Position = 0 then
      CanIndex := False
    else if Position <= PreviousPosition then
      Reordered := True;
    PreviousPosition := Position;
  end;
  Result := AText;
  ArgumentIndex := 0;
  for Index := 0 to High(ASpecifiers) do
  begin
    Token := TokenFor(Index);
    Replacement := ASpecifiers[Index];
    if Replacement <> '%%' then
    begin
      if CanIndex and Reordered then
        Replacement := '%' + IntToStr(ArgumentIndex) + ':' +
          Copy(Replacement, 2, MaxInt);
      Inc(ArgumentIndex);
    end;
    Result := StringReplace(Result, Token, Replacement,
      [rfReplaceAll, rfIgnoreCase]);
  end;
end;

class function TPlaceholderProtection.TryRepairSimpleReorder(
  const ASource, ATranslated: string; out ARepaired: string): Boolean;
var
  SourceSpecifiers: TArray<string>;
  TranslatedSpecifiers: TArray<string>;
begin
  ARepaired := '';
  SourceSpecifiers := FindSpecifiers(ASource);
  TranslatedSpecifiers := FindSpecifiers(ATranslated);
  Result := (Length(SourceSpecifiers) = 2) and
    (Length(TranslatedSpecifiers) = 2);
  if not Result then
    Exit;
  Result := (Length(SourceSpecifiers[0]) = 2) and
    (Length(SourceSpecifiers[1]) = 2) and
    (SourceSpecifiers[0] <> '%%') and
    (SourceSpecifiers[1] <> '%%') and
    (SourceSpecifiers[0] <> SourceSpecifiers[1]) and
    (TranslatedSpecifiers[0] = SourceSpecifiers[1]) and
    (TranslatedSpecifiers[1] = SourceSpecifiers[0]);
  if not Result then
    Exit;
  ARepaired := StringReplace(ATranslated, TranslatedSpecifiers[0],
    '%1:' + Copy(TranslatedSpecifiers[0], 2, 1), [rfReplaceAll]);
  ARepaired := StringReplace(ARepaired, TranslatedSpecifiers[1],
    '%0:' + Copy(TranslatedSpecifiers[1], 2, 1), [rfReplaceAll]);
  Result := Matches(ASource, ARepaired);
  if not Result then
    ARepaired := '';
end;

class function TPlaceholderProtection.Matches(const ASource,
  ATranslated: string): Boolean;
var
  ArgumentIndex: Integer;
  ColonIndex: Integer;
  ExplicitIndex: Integer;
  HasIndexed: Boolean;
  Index: Integer;
  Left, Right: TArray<string>;
  LeftList, RightList: TStringList;
  SameOrder: Boolean;
begin
  Left := FindSpecifiers(ASource);
  Right := FindSpecifiers(ATranslated);
  if Length(Left) <> Length(Right) then
    Exit(False);
  SameOrder := True;
  for Index := 0 to High(Left) do
    if not SameText(Left[Index], Right[Index]) then
      SameOrder := False;
  if SameOrder then
    Exit(True);
  { Unnumbered format arguments must retain their order. If the provider
    reordered protected tokens, Restore numbered every argument instead. }
  HasIndexed := False;
  for Index := 0 to High(Right) do
    if Pos(':', Right[Index]) > 0 then
      HasIndexed := True;
  if not HasIndexed then
    Exit(False);
  LeftList := TStringList.Create;
  RightList := TStringList.Create;
  try
    ArgumentIndex := 0;
    for Index := 0 to High(Left) do
      if Left[Index] = '%%' then
        LeftList.Add('literal:%')
      else
      begin
        if Length(Left[Index]) <> 2 then
          Exit(False);
        LeftList.Add(Format('arg:%d=%s',
          [ArgumentIndex, LowerCase(Copy(Left[Index], 2, 1))]));
        Inc(ArgumentIndex);
      end;
    for Index := 0 to High(Right) do
      if Right[Index] = '%%' then
        RightList.Add('literal:%')
      else
      begin
        ColonIndex := Pos(':', Right[Index]);
        if (ColonIndex <= 2) or
           (Length(Right[Index]) <> ColonIndex + 1) or
           not TryStrToInt(Copy(Right[Index], 2, ColonIndex - 2),
             ExplicitIndex) then
          Exit(False);
        RightList.Add(Format('arg:%d=%s',
          [ExplicitIndex, LowerCase(Copy(Right[Index],
            ColonIndex + 1, 1))]));
      end;
    LeftList.Sort;
    RightList.Sort;
    Result := LeftList.Text = RightList.Text;
  finally
    RightList.Free;
    LeftList.Free;
  end;
end;

end.
