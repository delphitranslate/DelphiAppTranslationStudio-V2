unit DAT.Core.TranslationWorkspace;

interface

uses
  DAT.Core.Types;

type
  TTranslationWorkspace = class
  private
    class function SafeFilePart(const AValue: string): string; static;
  public
    class function RootDirectory(const AProfile: TProjectProfile): string; static;
    class function DevelopmentDirectory(
      const AProfile: TProjectProfile): string; static;
    class function LanguagesDirectory(
      const AProfile: TProjectProfile): string; static;
    class function SourceLanguagesDirectory(const AProfile: TProjectProfile;
      const ASourceLanguageCode: string): string; static;
    class function DevelopmentCatalogFileName(const AProfile: TProjectProfile;
      const ALanguageCode: string;
      const ASourceLanguageCode: string = 'en-US'): string; static;
    class function RuntimePackFileName(const AProfile: TProjectProfile;
      const ALanguageCode: string;
      const ASourceLanguageCode: string = ''): string; static;
    class function GlossariesDirectory(
      const AProfile: TProjectProfile): string; static;
    class function GlossaryFileName(const AProfile: TProjectProfile;
      const ALanguageCode: string;
      const ASourceLanguageCode: string = 'en-US'): string; static;
    class function DeploymentDirectory(
      const AProfile: TProjectProfile): string; static;
    class function DeploymentDestinationsFileName(
      const AProfile: TProjectProfile): string; static;
  end;

implementation

uses
  System.Hash,
  System.IOUtils,
  System.JSON,
  System.StrUtils,
  System.SysUtils;

function SavedProjectMatches(const ASavedFileName,
  ACurrentFileName: string): Boolean;
begin
  Result := False;
  if ASavedFileName = '' then
    Exit;
  try
    Result := SameText(TPath.GetFullPath(ASavedFileName),
      TPath.GetFullPath(ACurrentFileName)) or
      (SameText(TPath.GetExtension(ASavedFileName), '.dpr') and
       SameText(TPath.GetExtension(ACurrentFileName), '.dproj') and
       SameText(TPath.ChangeExtension(TPath.GetFullPath(ASavedFileName),
         '.dproj'), TPath.GetFullPath(ACurrentFileName)));
  except
    Result := False;
  end;
end;

function LegacyCatalogBelongsToProject(const ADevelopmentDirectory,
  AProjectDirectory: string): Boolean;
var
  CatalogFileName: string;
  Entry: TJSONValue;
  Entries: TJSONValue;
  Parsed: TJSONValue;
  SourceFile: TJSONValue;
begin
  Result := False;
  if not TDirectory.Exists(ADevelopmentDirectory) then
    Exit;
  for CatalogFileName in TDirectory.GetFiles(ADevelopmentDirectory,
    '*.translation-project.json', TSearchOption.soTopDirectoryOnly) do
  begin
    Parsed := nil;
    try
      try
        Parsed := TJSONObject.ParseJSONValue(TFile.ReadAllText(
          CatalogFileName, TEncoding.UTF8));
        if not (Parsed is TJSONObject) then
          Continue;
        Entries := TJSONObject(Parsed).GetValue('entries');
        if not (Entries is TJSONArray) then
          Continue;
        for Entry in TJSONArray(Entries) do
          if Entry is TJSONObject then
          begin
            SourceFile := TJSONObject(Entry).GetValue('sourceFileName');
            if (SourceFile <> nil) and (SourceFile.Value <> '') and
               StartsText(IncludeTrailingPathDelimiter(AProjectDirectory),
                 TPath.GetFullPath(SourceFile.Value)) then
              Exit(True);
          end;
      except
        { An unreadable catalog cannot establish ownership of a workspace. }
      end;
    finally
      Parsed.Free;
    end;
  end;
end;

class function TTranslationWorkspace.SafeFilePart(
  const AValue: string): string;
var
  CharacterIndex: Integer;
begin
  Result := Trim(AValue);
  for CharacterIndex := 1 to Length(Result) do
    if not CharInSet(Result[CharacterIndex],
      ['A'..'Z', 'a'..'z', '0'..'9', '-', '_', '.']) then
      Result[CharacterIndex] := '_';
  if Result = '' then
    Result := 'language';
end;

class function TTranslationWorkspace.RootDirectory(
  const AProfile: TProjectProfile): string;
var
  LocalAppData: string;
  LegacyDirectory: string;
  Parsed: TJSONValue;
  SavedProject: TJSONValue;
  SessionFileName: string;
  SessionNamesAnotherProject: Boolean;
  WorkspaceRoot: string;
begin
  if AProfile.ProjectFileName = '' then
    raise EArgumentException.Create('A Delphi project must be open.');
  LocalAppData := GetEnvironmentVariable('LOCALAPPDATA');
  if LocalAppData = '' then
    LocalAppData := TPath.GetHomePath;
  WorkspaceRoot := TPath.Combine(LocalAppData,
    'DelphiAppTranslationStudio\Workspaces');
  LegacyDirectory := TPath.Combine(WorkspaceRoot,
    SafeFilePart(AProfile.ProjectName));
  Result := TPath.Combine(WorkspaceRoot, SafeFilePart(AProfile.ProjectName) +
    '-' + Copy(THashSHA2.GetHashString(LowerCase(
      AProfile.ProjectFileName)), 1, 12));
  if not TDirectory.Exists(LegacyDirectory) then
    Exit;
  SessionFileName := TPath.Combine(LegacyDirectory,
    'Deployment\batch-session.json');
  SessionNamesAnotherProject := False;
  if TFile.Exists(SessionFileName) then
  begin
    Parsed := nil;
    try
      try
        Parsed := TJSONObject.ParseJSONValue(TFile.ReadAllText(
          SessionFileName, TEncoding.UTF8));
        if Parsed is TJSONObject then
        begin
          SavedProject := TJSONObject(Parsed).GetValue('projectFileName');
          if SavedProject <> nil then
          begin
            if SavedProjectMatches(SavedProject.Value,
              AProfile.ProjectFileName) then
              Exit(LegacyDirectory);
            SessionNamesAnotherProject := True;
          end;
        end;
      except
        { A damaged identity record must not attach another project. }
      end;
    finally
      Parsed.Free;
    end;
  end;
  if not SessionNamesAnotherProject and
     LegacyCatalogBelongsToProject(TPath.Combine(LegacyDirectory,
    'Development'), TPath.GetDirectoryName(AProfile.ProjectFileName)) then
    Exit(LegacyDirectory);
end;

class function TTranslationWorkspace.DevelopmentDirectory(
  const AProfile: TProjectProfile): string;
begin
  Result := TPath.Combine(RootDirectory(AProfile), 'Development');
end;

class function TTranslationWorkspace.LanguagesDirectory(
  const AProfile: TProjectProfile): string;
begin
  Result := TPath.Combine(RootDirectory(AProfile), 'Languages');
end;

class function TTranslationWorkspace.SourceLanguagesDirectory(
  const AProfile: TProjectProfile;
  const ASourceLanguageCode: string): string;
begin
  if Trim(ASourceLanguageCode) = '' then
    raise EArgumentException.Create('Choose the saved project source language first.');
  Result := TPath.Combine(LanguagesDirectory(AProfile),
    SafeFilePart(ASourceLanguageCode));
end;

class function TTranslationWorkspace.GlossariesDirectory(
  const AProfile: TProjectProfile): string;
begin
  Result := TPath.Combine(RootDirectory(AProfile), 'Glossaries');
end;

class function TTranslationWorkspace.GlossaryFileName(
  const AProfile: TProjectProfile; const ALanguageCode,
  ASourceLanguageCode: string): string;
begin
  if SameText(ASourceLanguageCode, 'en-US') then
    Result := TPath.Combine(GlossariesDirectory(AProfile),
      SafeFilePart(AProfile.ProjectName) + '.' +
      SafeFilePart(ALanguageCode) + '.glossary.json')
  else
    Result := TPath.Combine(GlossariesDirectory(AProfile),
      SafeFilePart(AProfile.ProjectName) + '.' +
      SafeFilePart(ASourceLanguageCode) + '.' +
      SafeFilePart(ALanguageCode) + '.glossary.json');
end;

class function TTranslationWorkspace.DeploymentDirectory(
  const AProfile: TProjectProfile): string;
begin
  Result := TPath.Combine(RootDirectory(AProfile), 'Deployment');
end;

class function TTranslationWorkspace.DeploymentDestinationsFileName(
  const AProfile: TProjectProfile): string;
begin
  Result := TPath.Combine(DeploymentDirectory(AProfile),
    'deployment-destinations.json');
end;

class function TTranslationWorkspace.DevelopmentCatalogFileName(
  const AProfile: TProjectProfile; const ALanguageCode,
  ASourceLanguageCode: string): string;
begin
  if SameText(ASourceLanguageCode, 'en-US') then
    Result := TPath.Combine(DevelopmentDirectory(AProfile),
      SafeFilePart(AProfile.ProjectName) + '.' +
      SafeFilePart(ALanguageCode) + '.translation-project.json')
  else
    Result := TPath.Combine(DevelopmentDirectory(AProfile),
      SafeFilePart(AProfile.ProjectName) + '.' +
      SafeFilePart(ASourceLanguageCode) + '.' +
      SafeFilePart(ALanguageCode) + '.translation-project.json');
end;

class function TTranslationWorkspace.RuntimePackFileName(
  const AProfile: TProjectProfile; const ALanguageCode,
  ASourceLanguageCode: string): string;
begin
  if ASourceLanguageCode = '' then
    Result := TPath.Combine(LanguagesDirectory(AProfile),
      SafeFilePart(ALanguageCode) + '.json')
  else
    Result := TPath.Combine(SourceLanguagesDirectory(AProfile,
      ASourceLanguageCode), SafeFilePart(ALanguageCode) + '.json');
end;

end.
