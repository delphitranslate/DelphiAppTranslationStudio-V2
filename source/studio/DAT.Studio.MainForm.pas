unit DAT.Studio.MainForm;

interface

uses
  System.Classes,
  FMX.Types,
  FMX.Controls,
  FMX.Forms,
  FMX.StdCtrls,
  FMX.Objects,
  FMX.Layouts,
  FMX.ListBox,
  FMX.Edit,
  FMX.Memo,
  FMX.Dialogs,
  FMX.Menus,
  FMX.TabControl,
  DAT.Core.Types,
  DAT.Core.Glossary,
  DAT.Provider.Settings,
  DAT.Provider.Types,
  DAT.Scan.Types,
  DAT.Validation.Catalog, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Controls.Presentation;

type
  TBatchValidationIssueInfo = record
    Severity: TValidationSeverity;
    EntryKey: string;
    MessageText: string;
    SourceText: string;
    TranslatedText: string;
  end;

  TfrmTranslationStudio = class(TForm)
    MainMenuBar: TMenuBar;
    mnuFile: TMenuItem;
    mnuFileExit: TMenuItem;
    mnuLanguage: TMenuItem;
    datLanguage_en_US: TMenuItem;
    RootLayout: TLayout;
    HeaderBackground: TRectangle;
    HeaderAccent: TRectangle;
    imgStudioBrand: TImage;
    lblStudioBrandName: TLabel;
    lblStudioBrandStudio: TLabel;
    lblApplicationTitle: TLabel;
    lblApplicationSubtitle: TLabel;
    BodyLayout: TLayout;
    NavigationCard: TRectangle;
    lblNavigationTitle: TLabel;
    NavigationSelection: TRectangle;
    lblNavigationProject: TLabel;
    lblNavigationScan: TLabel;
    lblNavigationLanguages: TLabel;
    lblNavigationGlossary: TLabel;
    lblNavigationValidation: TLabel;
    lblNavigationExport: TLabel;
    lblNavigationIntegration: TLabel;
    lblNavigationSettings: TLabel;
    AddLanguagesNavigationCard: TRectangle;
    btnSidebarAddLanguages: TButton;
    lblAddLanguagesNavigationHint: TLabel;
    ContentLayout: TLayout;
    IntroCard: TRectangle;
    lblIntroTitle: TLabel;
    lblIntroText: TLabel;
    btnIntroRunWizard: TButton;
    btnIntroMaintenance: TButton;
    btnIntroRecovery: TButton;
    btnIntroClose: TButton;
    RecoveryCard: TRectangle;
    lblRecoveryTitle: TLabel;
    lblRecoveryDescription: TLabel;
    edtRecoveryBackup: TEdit;
    btnChooseRecoveryBackup: TButton;
    memRecoveryPreview: TMemo;
    edtRecoveryDestination: TEdit;
    btnChooseRecoveryDestination: TButton;
    btnRestoreRecoveryBackup: TButton;
    btnRecoveryBack: TButton;
    dlgOpenSafetyBackup: TOpenDialog;
    ProjectCard: TRectangle;
    lblProjectCardTitle: TLabel;
    lblProjectCardDescription: TLabel;
    btnGuidedSetup: TButton;
    btnOpenProject: TButton;
    ProjectDetailsCard: TRectangle;
    lblProjectNameCaption: TLabel;
    lblProjectNameValue: TLabel;
    lblFrameworkCaption: TLabel;
    lblFrameworkValue: TLabel;
    lblPlatformsCaption: TLabel;
    lblPlatformsValue: TLabel;
    lblFormsCaption: TLabel;
    lblFormsValue: TLabel;
    lblSourcesCaption: TLabel;
    lblSourcesValue: TLabel;
    lblProjectSourceLanguage: TLabel;
    cboProjectSourceLanguage: TComboBox;
    btnContinueToLanguages: TButton;
    DetailsDivider: TRectangle;
    btnScanProject: TButton;
    lblScanSummaryTitle: TLabel;
    lblScanSummaryValue: TLabel;
    lblScanBreakdown: TLabel;
    lstScanResults: TListBox;
    StatusCard: TRectangle;
    StatusTextPanel: TRectangle;
    StatusAccent: TRectangle;
    lblStatus: TLabel;
    btnWorkflowBack: TButton;
    btnWorkflowNext: TButton;
    LanguagePageCard: TRectangle;
    lblLanguagePageTitle: TLabel;
    lblBatchReviewProgress: TLabel;
    lblCatalogState: TLabel;
    btnCatalogTools: TButton;
    lblSourceLanguage: TLabel;
    cboSourceLanguage: TComboBox;
    lblTargetLanguageCode: TLabel;
    cboTargetLanguage: TComboBox;
    lblNativeLanguageName: TLabel;
    edtNativeLanguageName: TEdit;
    lblTextDirection: TLabel;
    cboTextDirection: TComboBox;
    btnOpenCatalog: TButton;
    btnSaveCatalog: TButton;
    edtShortDateFormat: TEdit;
    edtLongDateFormat: TEdit;
    edtShortTimeFormat: TEdit;
    edtLongTimeFormat: TEdit;
    edtDecimalSeparator: TEdit;
    edtThousandSeparator: TEdit;
    edtCurrencySymbol: TEdit;
    lblCatalogPathValue: TLabel;
    btnExportCatalogCsv: TButton;
    btnImportCatalogCsv: TButton;
    lblCatalogReadiness: TLabel;
    lstCatalogEntries: TListBox;
    btnMarkTranslationReviewed: TButton;
    btnApproveTranslation: TButton;
    btnReviewAllTranslations: TButton;
    btnApproveAllReviewed: TButton;
    lblSourceTextEditor: TLabel;
    lblRuntimeApplicationValue: TLabel;
    lblTranslationContextValue: TLabel;
    memSourceText: TMemo;
    chkRuntimeWiringConfirmed: TCheckBox;
    lblTranslationSuggestion: TLabel;
    cboTranslationSuggestions: TComboBox;
    btnAcceptSuggestion: TButton;
    lblTranslatedTextEditor: TLabel;
    memTranslatedText: TMemo;
    btnApplyTranslation: TButton;
    btnTranslateMissing: TButton;
    cboBatchReviewTarget: TComboBox;
    btnNextBatchLanguage: TButton;
    CatalogToolsCard: TRectangle;
    lblCatalogToolsTitle: TLabel;
    btnBackToReview: TButton;
    CatalogToolsTabs: TTabControl;
    tabLocaleSettings: TTabItem;
    tabEntryDetails: TTabItem;
    tabCatalogActions: TTabItem;
    lblProviderActionHelp: TLabel;
    BatchReviewCompleteCard: TRectangle;
    lblBatchReviewCompleteTitle: TLabel;
    lblBatchReviewCompleteSummary: TLabel;
    btnBatchAddMoreLanguages: TButton;
    btnBatchReviewAgain: TButton;
    btnBatchValidate: TButton;
    btnBatchFinishWithoutExport: TButton;
    AddLanguagesPageCard: TRectangle;
    lblAddLanguagesTitle: TLabel;
    lblAddLanguagesDescription: TLabel;
    lblAddLanguagesSource: TLabel;
    lstAddLanguageTargets: TListBox;
    lblAddLanguagesSelection: TLabel;
    btnAddLanguagesSelectAll: TButton;
    btnAddLanguagesClear: TButton;
    btnAddLanguageProviderSettings: TButton;
    btnRunAddLanguages: TButton;
    btnReviewBatch: TButton;
    btnBackToLanguageEditor: TButton;
    lblAddLanguagesResults: TLabel;
    BatchProgressPanel: TRectangle;
    lblBatchProgress: TLabel;
    prgBatchProgress: TProgressBar;
    btnBatchCancel: TButton;
    lstAddLanguagesResults: TListBox;
    GlossaryPageCard: TRectangle;
    lblGlossaryPageTitle: TLabel;
    lblGlossaryPageDescription: TLabel;
    lblGlossaryLanguage: TLabel;
    cboGlossaryLanguage: TComboBox;
    lblGlossaryFileCaption: TLabel;
    lblGlossaryFileValue: TLabel;
    lblGlossaryTerms: TLabel;
    lstGlossaryTerms: TListBox;
    lblGlossarySourceTerm: TLabel;
    edtGlossarySourceTerm: TEdit;
    lblGlossaryTargetTerm: TLabel;
    edtGlossaryTargetTerm: TEdit;
    lblGlossaryConcept: TLabel;
    edtGlossaryConcept: TEdit;
    lblGlossaryDeveloperNote: TLabel;
    edtGlossaryDeveloperNote: TEdit;
    chkGlossaryCaseSensitive: TCheckBox;
    chkGlossaryApproved: TCheckBox;
    btnGlossaryNew: TButton;
    btnGlossaryAddUpdate: TButton;
    btnGlossaryDelete: TButton;
    btnGlossaryCancelChanges: TButton;
    btnGlossarySave: TButton;
    btnGlossaryApply: TButton;
    lblGlossarySummary: TLabel;
    ValidationPageCard: TRectangle;
    lblValidationPageTitle: TLabel;
    lblValidationDescription: TLabel;
    btnValidateCatalog: TButton;
    btnExportValidatedLanguages: TButton;
    btnValidationReviewLanguages: TButton;
    btnValidationFinishWithoutExport: TButton;
    lblValidationSummary: TLabel;
    lstValidationLanguages: TListBox;
    lstValidationIssues: TListBox;
    memValidationIssueDetail: TMemo;
    ExportPageCard: TRectangle;
    lblExportPageTitle: TLabel;
    lblExportDescription: TLabel;
    ExportAccentCard: TRectangle;
    lblExportSummary: TLabel;
    lblExportPathValue: TLabel;
    memDeploymentPreview: TMemo;
    ExportActionRow: TRectangle;
    btnExportRuntimePack: TButton;
    btnExportBatch: TButton;
    IntegrationPageCard: TRectangle;
    lblIntegrationPageTitle: TLabel;
    lblIntegrationDescription: TLabel;
    lblIntegrationMode: TLabel;
    cboIntegrationMode: TComboBox;
    lblLanguageMenuName: TLabel;
    edtLanguageMenuName: TEdit;
    btnBuildIntegrationPlan: TButton;
    lstIntegrationPlan: TListBox;
    ManualSetupExpander: TExpander;
    memIntegrationDiff: TMemo;
    chkIntegrationReviewConfirmed: TCheckBox;
    lblIntegrationSummary: TLabel;
    btnGenerateIntegrationPackage: TButton;
    lblIntegrationOutput: TLabel;
    btnApplyIntegration: TButton;
    btnRestoreIntegration: TButton;
    btnCompleteReset: TButton;
    btnOpenDesignPackageLocation: TButton;
    btnOpenComponentKitFolder: TButton;
    chkBuildAfterIntegration: TCheckBox;
    cboBuildPlatform: TComboBox;
    cboBuildConfiguration: TComboBox;
    SettingsPageCard: TRectangle;
    lblSettingsPageTitle: TLabel;
    lblSettingsDescription: TLabel;
    lblProviderName: TLabel;
    cboTranslationProvider: TComboBox;
    lblDeepLPlan: TLabel;
    cboDeepLPlan: TComboBox;
    lblProviderApiKey: TLabel;
    edtProviderApiKey: TEdit;
    chkRememberCredential: TCheckBox;
    lblCredentialExplanation: TLabel;
    btnSaveProviderKey: TButton;
    btnTestProviderConnection: TButton;
    btnRemoveProviderKey: TButton;
    lblCredentialStatus: TLabel;
    lblRequestTimeout: TLabel;
    edtRequestTimeout: TEdit;
    lblBatchSize: TLabel;
    edtProviderBatchSize: TEdit;
    btnSettingsContinueLanguages: TButton;
    dlgOpenProject: TOpenDialog;
    dlgOpenCatalog: TOpenDialog;
    dlgImportCatalogCsv: TOpenDialog;
    dlgExportCatalogCsv: TSaveDialog;
    rectWizardBackdrop: TRectangle;
    OperationCard: TRectangle;
    lblOperationTitle: TLabel;
    lblOperationProgress: TLabel;
    prgOperation: TProgressBar;
    btnOperationCancel: TButton;
    btnMaintenanceCancel: TButton;
    procedure btnOpenProjectClick(Sender: TObject);
    procedure btnGuidedSetupClick(Sender: TObject);
    procedure btnIntroMaintenanceClick(Sender: TObject);
    procedure btnIntroCloseClick(Sender: TObject);
    procedure btnIntroRecoveryClick(Sender: TObject);
    procedure btnChooseRecoveryBackupClick(Sender: TObject);
    procedure btnChooseRecoveryDestinationClick(Sender: TObject);
    procedure btnRestoreRecoveryBackupClick(Sender: TObject);
    procedure btnRecoveryBackClick(Sender: TObject);
    procedure btnScanProjectClick(Sender: TObject);
    procedure cboProjectSourceLanguageChange(Sender: TObject);
    procedure btnContinueToLanguagesClick(Sender: TObject);
    procedure lblNavigationProjectClick(Sender: TObject);
    procedure lblNavigationScanClick(Sender: TObject);
    procedure lblNavigationLanguagesClick(Sender: TObject);
    procedure lblNavigationGlossaryClick(Sender: TObject);
    procedure lblNavigationValidationClick(Sender: TObject);
    procedure lblNavigationExportClick(Sender: TObject);
    procedure btnOpenCatalogClick(Sender: TObject);
    procedure btnSaveCatalogClick(Sender: TObject);
    procedure lstCatalogEntriesChange(Sender: TObject);
    procedure memTranslatedTextChange(Sender: TObject);
    procedure btnApplyTranslationClick(Sender: TObject);
    procedure btnValidateCatalogClick(Sender: TObject);
    procedure btnExportRuntimePackClick(Sender: TObject);
    procedure lblNavigationIntegrationClick(Sender: TObject);
    procedure btnBuildIntegrationPlanClick(Sender: TObject);
    procedure btnGenerateIntegrationPackageClick(Sender: TObject);
    procedure btnApplyIntegrationClick(Sender: TObject);
    procedure btnRestoreIntegrationClick(Sender: TObject);
    procedure btnCompleteResetClick(Sender: TObject);
    procedure lstIntegrationPlanChange(Sender: TObject);
    procedure chkIntegrationReviewConfirmedChange(Sender: TObject);
    procedure cboIntegrationModeChange(Sender: TObject);
    procedure lblNavigationSettingsClick(Sender: TObject);
    procedure cboTranslationProviderChange(Sender: TObject);
    procedure btnSaveProviderKeyClick(Sender: TObject);
    procedure btnTestProviderConnectionClick(Sender: TObject);
    procedure btnRemoveProviderKeyClick(Sender: TObject);
    procedure btnTranslateMissingClick(Sender: TObject);
    procedure btnShowAddLanguagesClick(Sender: TObject);
    procedure btnBackToLanguageEditorClick(Sender: TObject);
    procedure btnAddLanguagesSelectAllClick(Sender: TObject);
    procedure btnAddLanguagesClearClick(Sender: TObject);
    procedure btnAddLanguageProviderSettingsClick(Sender: TObject);
    procedure btnSettingsContinueLanguagesClick(Sender: TObject);
    procedure lstAddLanguageTargetsChange(Sender: TObject);
    procedure btnRunAddLanguagesClick(Sender: TObject);
    procedure btnBatchCancelClick(Sender: TObject);
    procedure btnReviewBatchClick(Sender: TObject);
    procedure cboBatchReviewTargetChange(Sender: TObject);
    procedure btnNextBatchLanguageClick(Sender: TObject);
    procedure btnExportValidatedLanguagesClick(Sender: TObject);
    procedure btnExportBatchClick(Sender: TObject);
    procedure btnExportCatalogCsvClick(Sender: TObject);
    procedure btnImportCatalogCsvClick(Sender: TObject);
    procedure chkRuntimeWiringConfirmedChange(Sender: TObject);
    procedure btnAcceptSuggestionClick(Sender: TObject);
    procedure btnMarkTranslationReviewedClick(Sender: TObject);
    procedure btnApproveTranslationClick(Sender: TObject);
    procedure btnReviewAllTranslationsClick(Sender: TObject);
    procedure btnApproveAllReviewedClick(Sender: TObject);
    procedure lblCatalogPathValueClick(Sender: TObject);
    procedure lblExportPathValueClick(Sender: TObject);
    procedure lstValidationIssuesDblClick(Sender: TObject);
    procedure lstValidationIssuesChange(Sender: TObject);
    procedure lstValidationLanguagesChange(Sender: TObject);
    procedure btnOpenDesignPackageLocationClick(Sender: TObject);
    procedure btnOpenComponentKitFolderClick(Sender: TObject);
    procedure cboTargetLanguageChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure datLanguageMenuItemClick(Sender: TObject);
    procedure mnuFileExitClick(Sender: TObject);
    procedure btnOperationCancelClick(Sender: TObject);
    procedure btnMaintenanceCancelClick(Sender: TObject);
    procedure btnWorkflowNextClick(Sender: TObject);
    procedure btnWorkflowBackClick(Sender: TObject);
    procedure btnBatchFinishWithoutExportClick(Sender: TObject);
    procedure btnValidationReviewLanguagesClick(Sender: TObject);
    procedure btnBatchReviewAgainClick(Sender: TObject);
    procedure btnBatchAddMoreLanguagesClick(Sender: TObject);
    procedure btnBatchValidateClick(Sender: TObject);
    procedure btnCatalogToolsClick(Sender: TObject);
    procedure btnBackToReviewClick(Sender: TObject);
    procedure cboGlossaryLanguageChange(Sender: TObject);
    procedure lstGlossaryTermsChange(Sender: TObject);
    procedure btnGlossaryNewClick(Sender: TObject);
    procedure btnGlossaryAddUpdateClick(Sender: TObject);
    procedure btnGlossaryDeleteClick(Sender: TObject);
    procedure btnGlossaryCancelChangesClick(Sender: TObject);
    procedure btnGlossarySaveClick(Sender: TObject);
    procedure btnGlossaryApplyClick(Sender: TObject);
  private
    FProjectProfile: TProjectProfile;
    FScanResult: TProjectScanResult;
    FTranslationCatalog: TTranslationCatalog;
    FValidationResult: TCatalogValidationResult;
    FIntegrationPackageDirectory: string;
    FIntegrationBuildError: string;
    FLastIntegrationBackupDirectory: string;
    FCatalogFileName: string;
    FProviderSettings: TProviderSettings;
    FSessionApiKeys: array[TTranslationProvider] of string;
    FUpdatingEntryControls: Boolean;
    FDisplayedEntryIndex: Integer;
    FTranslationEditorDirty: Boolean;
    FIntroScreen: Boolean;
    FRecoveryScreen: Boolean;
    FRecoveryInProgress: Boolean;
    FOpenAddLanguagesAfterWizardScan: Boolean;
    FLastScanCompletedAt: TDateTime;
    FScanInProgress: Boolean;
    FScanCancelRequested: Integer;
    FCloseAfterScan: Boolean;
    FProviderOperationInProgress: Boolean;
    FExportInProgress: Boolean;
    FProviderCancelRequested: Integer;
    FCloseAfterProviderOperation: Boolean;
    FUpdatingTargetLanguage: Boolean;
    FProjectGlossary: TProjectGlossary;
    FGlossaryFileName: string;
    FGlossaryDirty: Boolean;
    FUpdatingGlossaryLanguage: Boolean;
    FAddLanguagesPageVisible: Boolean;
    FBatchTargets: TArray<string>;
    FBatchExportedTargets: TArray<string>;
    FBatchReviewIndex: Integer;
    FBatchReady: Boolean;
    FBatchValidated: Boolean;
    FBatchReadyToExport: Boolean;
    FBatchReviewComplete: Boolean;
    FBatchValidationIssues: TArray<TArray<TBatchValidationIssueInfo>>;
    FBatchValidationErrors: TArray<Integer>;
    FBatchValidationWarnings: TArray<Integer>;
    FBatchValidationOrder: TArray<Integer>;
    FEditingValidationIssue: Boolean;
    FCatalogToolsPageVisible: Boolean;
    FProjectSourceUpdating: Boolean;
    FWorkflowStep: Integer;
    procedure ClearProjectSummary;
    procedure ClearScanSummary;
    procedure ResetCatalog;
    procedure DisplayProjectSummary(const AProfile: TProjectProfile);
    procedure DisplayScanResult(const AResult: TProjectScanResult;
      const ARawScanCount, ARecoveredSemanticCount,
      ADuplicateOccurrenceCount: Integer);
    procedure DisplayCatalogEntries;
    procedure DisplayCatalogLanguage;
    procedure DisplayValidationResult;
    procedure InvalidateValidation;
    procedure SetWorkflowStep(const AStep: Integer);
    procedure UpdateCatalogFromLanguageEditors;
    procedure SaveCatalog;
    procedure RunCatalogValidation;
    function SelectedProvider: TTranslationProvider;
    function EffectiveApiKey(
      const AProvider: TTranslationProvider): string;
    procedure LoadProviderSettings;
    procedure SaveProviderSettings;
    procedure UpdateCredentialStatus;
    procedure UpdateCatalogReadiness;
    procedure UpdateTranslationSuggestions(
      const AEntry: TTranslationEntry);
    procedure DisplaySelectedIntegrationChange;
    procedure UpdateIntegrationApplyState;
    procedure UpdateIntegrationModeUI;
    function IsComponentIntegrationMode: Boolean;
    function SelectedLanguageCode(AComboBox: TComboBox): string;
    procedure SelectLanguageCode(AComboBox: TComboBox;
      const ALanguageCode: string);
    procedure ApplyTargetLanguageDefaults;
    procedure ShowOperation(const ATitle, AStatus: string;
      const ACanCancel: Boolean);
    procedure HideOperation;
    procedure ClearGlossary;
    procedure ClearGlossaryEditor;
    procedure LoadSelectedGlossary;
    procedure RefreshGlossary;
    procedure UpdateGlossaryActions;
    function SaveProjectGlossary: Boolean;
    function ConfirmGlossaryChanges: Boolean;
    procedure UpdateAddLanguagesSelection;
    procedure OpenBatchCatalog(const AIndex: Integer);
    procedure UpdateBatchReviewControls;
    procedure UpdateDeploymentPreview;
    procedure CommitDisplayedTranslation;
    procedure ValidateBatchCatalogs;
    procedure DisplayBatchValidationIssues;
    procedure SaveBatchSession;
    procedure RestoreBatchSession;
    procedure ProcessSelectedLanguages(const AProfile: TProjectProfile;
      const ATargets: TArray<string>;
      const ASourceLanguage, AApiKey: string;
      const AProvider: TTranslationProvider;
      const ASettings: TProviderSettings);
  public
    destructor Destroy; override;
  end;

var
  frmTranslationStudio: TfrmTranslationStudio;

implementation

uses
  DAT.Core.BuildInfo,
  DAT.Core.AtomicFile,
  System.Generics.Collections,
  System.IOUtils,
  System.JSON,
  System.Math,
  System.Rtti,
  System.SyncObjs,
  System.StrUtils,
  System.SysUtils,
  System.UITypes,
  System.Zip,
  Winapi.ShellAPI,
  Winapi.Windows,
  FMX.DialogService.Sync,
  DAT.Core.CatalogJson,
  DAT.Core.LocaleFacts,
  DAT.Core.SharedDictionary,
  DAT.Core.TranslationMemory,
  DAT.Core.ProjectDetection,
  DAT.Core.RuntimePack,
  DAT.Core.Terminology,
  DAT.Core.TranslationWorkspace,
  DAT.Integration.Package,
  DAT.Integration.BuildDeploy,
  DAT.Integration.ComponentPackage,
  DAT.Provider.Client,
  DAT.Provider.Placeholders,
  DAT.Provider.LanguageCodes,
  DAT.Provider.CredentialStore,
  DAT.Runtime.LanguagePack,
  DAT.Studio.SetupWizard,
  DAT.Studio.Translation,
  DAT.Scan.CatalogMerge,
  DAT.Scan.Project;

{$R *.fmx}

function FindStudioProjectRoot: string; forward;

procedure TfrmTranslationStudio.btnGuidedSetupClick(Sender: TObject);
var
  SetupWizard: TfrmSetupWizard;
  CompletedProjectFileName: string;
  CompletedSourceLanguage: string;
  WizardResult: TModalResult;
begin
  CompletedProjectFileName := '';
  CompletedSourceLanguage := '';
  OperationCard.Visible := False;
  rectWizardBackdrop.Visible := True;
  rectWizardBackdrop.BringToFront;
  rectWizardBackdrop.Repaint;
  SetupWizard := TfrmSetupWizard.Create(Self);
  try
    WizardResult := SetupWizard.ShowModal;
    if WizardResult in [mrOk, mrRetry, mrYes] then
    begin
      CompletedProjectFileName := SetupWizard.CompletedProjectFileName;
      CompletedSourceLanguage := SetupWizard.CompletedSourceLanguage;
    end;
  finally
    SetupWizard.Free;
    rectWizardBackdrop.Visible := False;
  end;
  if WizardResult = mrCancel then
  begin
    FIntroScreen := True;
    lblStatus.Text := 'Setup Wizard canceled. Choose a workflow to continue.';
  end
  else if WizardResult = mrOk then
  begin
    FIntroScreen := True;
    SetWorkflowStep(1);
    lblStatus.Text := 'Setup Wizard completed. Your language pack was exported and deployed.';
    Exit;
  end
  else
  begin
    FIntroScreen := False;
    if CompletedProjectFileName <> '' then
    begin
      DisplayProjectSummary(TProjectDetector.Detect(CompletedProjectFileName));
      if CompletedSourceLanguage <> '' then
      begin
        FProjectSourceUpdating := True;
        try
          SelectLanguageCode(cboProjectSourceLanguage,
            CompletedSourceLanguage);
          SelectLanguageCode(cboSourceLanguage, CompletedSourceLanguage);
        finally
          FProjectSourceUpdating := False;
        end;
        FOpenAddLanguagesAfterWizardScan := WizardResult = mrRetry;
        btnScanProjectClick(Sender);
      end
      else
        lblStatus.Text :=
          'Wizard project opened in Studio. Choose the original app language ' +
          'and scan to continue.';
      Exit;
    end;
    lblStatus.Text := 'Setup Wizard closed. Open a project to continue.';
  end;
  SetWorkflowStep(1);
end;

procedure TfrmTranslationStudio.FormCreate(Sender: TObject);
var
  BaseCaption: string;
  BaseSubtitle: string;
begin
  FIntroScreen := True;
  FRecoveryScreen := False;
  FRecoveryInProgress := False;
  FOpenAddLanguagesAfterWizardScan := False;
  FDisplayedEntryIndex := -1;
  ApplyStudioTranslation(Self);
  BaseCaption := Trim(Caption);
  if BaseCaption = '' then
    BaseCaption := 'Delphi App Translation Studio';
  Caption := BaseCaption + ' - ' + StudioBuildDescription;
  BaseSubtitle := Trim(lblApplicationSubtitle.Text);
  if BaseSubtitle = '' then
    BaseSubtitle :=
      'Offline language packs for Delphi VCL and FireMonkey applications';
  lblApplicationSubtitle.Text := BaseSubtitle + ' - ' + StudioBuildDescription;
  cboProjectSourceLanguage.ItemIndex := -1;
  cboSourceLanguage.ItemIndex := -1;
  cboSourceLanguage.Enabled := False;
  FBatchReviewIndex := -1;
  cboTextDirection.ItemIndex := 0;
  cboBuildPlatform.ItemIndex := 0;
  cboBuildConfiguration.ItemIndex := 0;
  cboIntegrationMode.ItemIndex := 0;
  cboGlossaryLanguage.ItemIndex := -1;
  UpdateIntegrationModeUI;
  LoadProviderSettings;
  ClearGlossary;
  UpdateAddLanguagesSelection;
  SetWorkflowStep(1);
end;

procedure TfrmTranslationStudio.ShowOperation(const ATitle,
  AStatus: string; const ACanCancel: Boolean);
begin
  lblOperationTitle.Text := ATitle;
  lblOperationProgress.Text := AStatus;
  prgOperation.Value := 0;
  btnOperationCancel.Enabled := ACanCancel;
  btnOperationCancel.Visible := ACanCancel;
  rectWizardBackdrop.Visible := True;
  rectWizardBackdrop.BringToFront;
  OperationCard.Visible := True;
  OperationCard.BringToFront;
  OperationCard.Repaint;
end;

procedure TfrmTranslationStudio.HideOperation;
begin
  OperationCard.Visible := False;
  rectWizardBackdrop.Visible := False;
end;

procedure TfrmTranslationStudio.btnOperationCancelClick(Sender: TObject);
begin
  if FScanInProgress then
    TInterlocked.Exchange(FScanCancelRequested, 1);
  if FProviderOperationInProgress then
    TInterlocked.Exchange(FProviderCancelRequested, 1);
  btnOperationCancel.Enabled := False;
  lblOperationProgress.Text := 'Cancelling safely...';
end;

procedure TfrmTranslationStudio.btnBatchCancelClick(Sender: TObject);
begin
  if not FProviderOperationInProgress then
    Exit;
  TInterlocked.Exchange(FProviderCancelRequested, 1);
  btnBatchCancel.Enabled := False;
  lblBatchProgress.Text :=
    'Cancelling after the current request. Saved drafts will be kept.';
end;

procedure TfrmTranslationStudio.btnMaintenanceCancelClick(Sender: TObject);
begin
  if not ConfirmGlossaryChanges then
    Exit;
  try
    if (FTranslationCatalog <> nil) and (FCatalogFileName <> '') and
       (SelectedLanguageCode(cboTargetLanguage) <> '') then
      SaveCatalog;
    FIntroScreen := True;
    SetWorkflowStep(1);
  except
    on E: Exception do
      lblStatus.Text := 'Unable to leave the workflow: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.btnWorkflowBackClick(Sender: TObject);
begin
  try
    if (FWorkflowStep = 3) and FEditingValidationIssue then
    begin
      SaveCatalog;
      FEditingValidationIssue := False;
      FCatalogToolsPageVisible := False;
      ValidateBatchCatalogs;
      Exit;
    end;
    case FWorkflowStep of
      1: btnMaintenanceCancelClick(Sender);
      2: SetWorkflowStep(1);
      3:
        if FCatalogToolsPageVisible then
          btnBackToReviewClick(Sender)
        else if FBatchReviewComplete then
          OpenBatchCatalog(High(FBatchTargets))
        else if FAddLanguagesPageVisible then
        begin
          FAddLanguagesPageVisible := False;
          if FBatchReady then
            SetWorkflowStep(3)
          else
            SetWorkflowStep(2);
        end
        else if FBatchReady and (FBatchReviewIndex > 0) then
          OpenBatchCatalog(FBatchReviewIndex - 1)
        else if FBatchReady then
        begin
          FAddLanguagesPageVisible := True;
          SetWorkflowStep(3);
        end
        else
          SetWorkflowStep(2);
      4: SetWorkflowStep(3);
      5: SetWorkflowStep(3);
      6: SetWorkflowStep(5);
      7: SetWorkflowStep(6);
      8:
        if FAddLanguagesPageVisible then
          SetWorkflowStep(3)
        else
          SetWorkflowStep(1);
    end;
  except
    on E: Exception do
      lblStatus.Text := 'Unable to go back: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.btnBatchFinishWithoutExportClick(
  Sender: TObject);
begin
  btnMaintenanceCancelClick(Sender);
end;

procedure TfrmTranslationStudio.btnValidationReviewLanguagesClick(
  Sender: TObject);
begin
  try
    if FBatchReady then
    begin
      if lstValidationLanguages.ItemIndex < 0 then
        lstValidationLanguages.ItemIndex := 0;
      if lstValidationIssues.ItemIndex < 0 then
        lstValidationIssues.ItemIndex := 0;
      if lstValidationIssues.ItemIndex >= 0 then
        lstValidationIssuesDblClick(Sender)
      else if (lstValidationLanguages.ItemIndex >= 0) and
        (lstValidationLanguages.ItemIndex < Length(FBatchValidationOrder)) then
      begin
        OpenBatchCatalog(FBatchValidationOrder[lstValidationLanguages.ItemIndex]);
        FEditingValidationIssue := True;
        SetWorkflowStep(3);
      end;
    end
    else
      SetWorkflowStep(3);
  except
    on E: Exception do
      lblStatus.Text := 'Unable to open translation review: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.btnWorkflowNextClick(Sender: TObject);
begin
  if not btnWorkflowNext.Enabled then
    Exit;
  try
    case FWorkflowStep of
      1: SetWorkflowStep(2);
      2: btnContinueToLanguagesClick(Sender);
      3:
        if FEditingValidationIssue then
        begin
          SaveCatalog;
          FEditingValidationIssue := False;
          FCatalogToolsPageVisible := False;
          ValidateBatchCatalogs;
        end
        else if FCatalogToolsPageVisible then
          btnBackToReviewClick(Sender)
        else if FAddLanguagesPageVisible then
          btnReviewBatchClick(Sender)
        else if FBatchReviewComplete then
          Exit
        else if FBatchReady then
          btnNextBatchLanguageClick(Sender)
        else
        begin
          SaveCatalog;
          SetWorkflowStep(5);
        end;
      4:
        if ConfirmGlossaryChanges then
          SetWorkflowStep(5);
      5: btnValidateCatalogClick(Sender);
      6: SetWorkflowStep(7);
      7: btnMaintenanceCancelClick(Sender);
      8:
        begin
          SaveProviderSettings;
          if FAddLanguagesPageVisible then
            SetWorkflowStep(3)
          else
          begin
            if not ConfirmGlossaryChanges then
              Exit;
            FIntroScreen := True;
            SetWorkflowStep(1);
          end;
        end;
    end;
  except
    on E: Exception do
      lblStatus.Text := 'Unable to continue: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.btnBatchReviewAgainClick(Sender: TObject);
begin
  try
    OpenBatchCatalog(0);
  except
    on E: Exception do
      lblStatus.Text := 'Unable to reopen language review: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.btnBatchAddMoreLanguagesClick(Sender: TObject);
begin
  btnShowAddLanguagesClick(Sender);
end;

procedure TfrmTranslationStudio.btnBatchValidateClick(Sender: TObject);
begin
  SetWorkflowStep(5);
  lblStatus.Text :=
    'Validation is optional until you choose to export. Run checks when ready.';
end;

procedure TfrmTranslationStudio.btnCatalogToolsClick(Sender: TObject);
begin
  FCatalogToolsPageVisible := True;
  CatalogToolsTabs.TabIndex := 0;
  SetWorkflowStep(3);
end;

procedure TfrmTranslationStudio.btnBackToReviewClick(Sender: TObject);
begin
  try
    if (FTranslationCatalog <> nil) and
       (SelectedLanguageCode(cboTargetLanguage) <> '') then
      SaveCatalog;
    FCatalogToolsPageVisible := False;
    SetWorkflowStep(3);
    if FTranslationCatalog <> nil then
      lblStatus.Text := 'Catalog settings saved. Continue reviewing translations.'
    else
      lblStatus.Text := 'Returned to review. Open or scan a catalog to begin.';
  except
    on E: Exception do
      lblStatus.Text := 'Unable to save catalog settings: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.mnuFileExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTranslationStudio.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if FRecoveryInProgress then
  begin
    CanClose := False;
    lblStatus.Text := 'Recovery is still running. Please wait for it to finish.';
    Exit;
  end;
  if FExportInProgress then
  begin
    CanClose := False;
    lblStatus.Text :=
      'Export and deployment are in progress. Please wait for completion.';
    Exit;
  end;
  if FTranslationEditorDirty and
     (SelectedLanguageCode(cboTargetLanguage) <> '') then
    try
      SaveCatalog;
    except
      on E: Exception do
      begin
        CanClose := False;
        lblStatus.Text := 'Unable to save the edited translation: ' + E.Message;
        Exit;
      end;
    end;
  if not FScanInProgress and not FProviderOperationInProgress then
  begin
    CanClose := ConfirmGlossaryChanges;
    Exit;
  end;
  if FScanInProgress then
  begin
    TInterlocked.Exchange(FScanCancelRequested, 1);
    FCloseAfterScan := True;
  end;
  if FProviderOperationInProgress then
  begin
    TInterlocked.Exchange(FProviderCancelRequested, 1);
    FCloseAfterProviderOperation := True;
  end;
  CanClose := False;
  lblStatus.Text := 'Cancelling the active operation before closing...';
end;

procedure TfrmTranslationStudio.btnIntroMaintenanceClick(Sender: TObject);
begin
  FIntroScreen := False;
  if (FScanResult <> nil) and FBatchReady then
  begin
    FBatchReviewComplete := True;
    FAddLanguagesPageVisible := False;
    SetWorkflowStep(3);
    lblStatus.Text :=
      'Saved language work is open. Add languages, review, or validate and deploy.';
  end
  else
  begin
    SetWorkflowStep(1);
    lblStatus.Text := 'Open a project to continue.';
  end;
end;

procedure TfrmTranslationStudio.btnIntroCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmTranslationStudio.btnIntroRecoveryClick(Sender: TObject);
begin
  FRecoveryScreen := True;
  SetWorkflowStep(1);
end;

procedure TfrmTranslationStudio.btnRecoveryBackClick(Sender: TObject);
begin
  if FRecoveryInProgress then
    Exit;
  FRecoveryScreen := False;
  SetWorkflowStep(1);
end;

procedure TfrmTranslationStudio.btnChooseRecoveryBackupClick(Sender: TObject);
var
  Archive: TZipFile;
  EntryName: string;
  FileIndex: Integer;
  ProjectCount: Integer;
  PreviewCount: Integer;
begin
  if not dlgOpenSafetyBackup.Execute then
    Exit;
  edtRecoveryBackup.Text := '';
  memRecoveryPreview.Lines.Clear;
  btnRestoreRecoveryBackup.Enabled := False;
  Archive := TZipFile.Create;
  try
    Archive.Open(dlgOpenSafetyBackup.FileName, zmRead);
    ProjectCount := 0;
    PreviewCount := 0;
    for FileIndex := 0 to Archive.FileCount - 1 do
    begin
      EntryName := StringReplace(Archive.FileNames[FileIndex], '\', '/',
        [rfReplaceAll]);
      if (EntryName = '') or (EntryName[1] = '/') or
         (Pos(':', EntryName) > 0) or
         (Pos('//', EntryName) > 0) or
         (Pos('/../', '/' + EntryName + '/') > 0) or
         (Pos('/./', '/' + EntryName + '/') > 0) then
        raise EInvalidOpException.Create(
          'This archive contains an unsafe file path and cannot be restored.');
      if (Pos('/', EntryName) = 0) and
         (EndsText('.dproj', EntryName) or EndsText('.dpr', EntryName)) then
        Inc(ProjectCount);
      if (PreviewCount < 12) and (not EntryName.EndsWith('/')) then
      begin
        memRecoveryPreview.Lines.Add(EntryName);
        Inc(PreviewCount);
      end;
    end;
    if (Archive.FileCount = 0) or (ProjectCount = 0) then
      raise EInvalidOpException.Create(
        'The ZIP does not contain a Delphi project at its root. Choose a Studio safety backup.');
    memRecoveryPreview.Lines.Insert(0, Format(
      '%d archived items; %d Delphi project file(s). First files:',
      [Archive.FileCount, ProjectCount]));
    edtRecoveryBackup.Text := dlgOpenSafetyBackup.FileName;
    btnRestoreRecoveryBackup.Enabled :=
      Trim(edtRecoveryDestination.Text) <> '';
    lblStatus.Text := 'Backup inspected. Choose an empty folder for recovery.';
  except
    on E: Exception do
    begin
      memRecoveryPreview.Lines.Text := 'Cannot use this backup: ' + E.Message;
      lblStatus.Text := 'Backup inspection failed.';
    end;
  end;
  Archive.Free;
end;

procedure TfrmTranslationStudio.btnChooseRecoveryDestinationClick(
  Sender: TObject);
var
  DirectoryName: string;
begin
  DirectoryName := '';
  if not SelectDirectory('Choose an empty folder for the recovered project',
    '', DirectoryName) then
    Exit;
  DirectoryName := TPath.GetFullPath(DirectoryName);
  if Length(TDirectory.GetFileSystemEntries(DirectoryName)) <> 0 then
  begin
    lblStatus.Text := 'Choose an empty folder. Recovery never overwrites existing files.';
    Exit;
  end;
  edtRecoveryDestination.Text := DirectoryName;
  btnRestoreRecoveryBackup.Enabled := edtRecoveryBackup.Text <> '';
  lblStatus.Text := 'Empty recovery folder selected. Inspect the backup, then restore.';
end;

procedure TfrmTranslationStudio.btnRestoreRecoveryBackupClick(Sender: TObject);
var
  Archive: TZipFile;
  BackupName: string;
  DestinationName: string;
  EntryName: string;
  FileIndex: Integer;
  ResolvedName: string;
  Response: Integer;
begin
  BackupName := Trim(edtRecoveryBackup.Text);
  DestinationName := Trim(edtRecoveryDestination.Text);
  if (BackupName = '') or not TFile.Exists(BackupName) or
     (DestinationName = '') or not TDirectory.Exists(DestinationName) then
  begin
    lblStatus.Text := 'Choose an existing Studio backup and an empty recovery folder.';
    Exit;
  end;
  if Length(TDirectory.GetFileSystemEntries(DestinationName)) <> 0 then
  begin
    lblStatus.Text := 'The recovery folder is no longer empty. Choose another folder.';
    Exit;
  end;
  Archive := TZipFile.Create;
  try
    Archive.Open(BackupName, zmRead);
    for FileIndex := 0 to Archive.FileCount - 1 do
    begin
      EntryName := StringReplace(Archive.FileNames[FileIndex], '/', '\',
        [rfReplaceAll]);
      if (EntryName = '') or (EntryName[1] = '\') or
         (Pos(':', EntryName) > 0) or
         (Pos('..\', EntryName) > 0) then
        raise EInvalidOpException.Create('The backup has an unsafe file path.');
      ResolvedName := TPath.GetFullPath(TPath.Combine(
        DestinationName, EntryName));
      if not StartsText(IncludeTrailingPathDelimiter(DestinationName),
        ResolvedName) then
        raise EInvalidOpException.Create('The backup contains a path outside the recovery folder.');
    end;
  finally
    Archive.Free;
  end;
  Response := TDialogServiceSync.MessageDialog(
    'Restore the selected ZIP into this empty folder?' + sLineBreak +
    DestinationName + sLineBreak + sLineBreak +
    'The original project will not be changed.',
    TMsgDlgType.mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
    TMsgDlgBtn.mbNo, 0);
  if Response <> mrYes then
    Exit;
  FRecoveryInProgress := True;
  btnChooseRecoveryBackup.Enabled := False;
  btnChooseRecoveryDestination.Enabled := False;
  btnRestoreRecoveryBackup.Enabled := False;
  btnRecoveryBack.Enabled := False;
  lblStatus.Text := 'Restoring backup. Please wait; larger projects may take several minutes.';
  TThread.CreateAnonymousThread(
    procedure
    var
      ErrorText: string;
      WorkerArchive: TZipFile;
    begin
      ErrorText := '';
      try
        if Length(TDirectory.GetFileSystemEntries(DestinationName)) <> 0 then
          raise EInvalidOpException.Create(
            'The destination became nonempty before recovery started.');
        WorkerArchive := TZipFile.Create;
        try
          WorkerArchive.Open(BackupName, zmRead);
          WorkerArchive.ExtractAll(DestinationName);
        finally
          WorkerArchive.Free;
        end;
      except
        on E: Exception do
          ErrorText := E.Message;
      end;
      TThread.Queue(nil,
        procedure
        begin
          FRecoveryInProgress := False;
          btnChooseRecoveryBackup.Enabled := True;
          btnChooseRecoveryDestination.Enabled := True;
          btnRecoveryBack.Enabled := True;
          if ErrorText = '' then
          begin
            memRecoveryPreview.Lines.Add('Recovery complete: ' + DestinationName);
            lblStatus.Text := 'Recovery complete. Open the restored Delphi project from its new folder.';
          end
          else
          begin
            memRecoveryPreview.Lines.Add('Recovery stopped: ' + ErrorText);
            lblStatus.Text := 'Recovery stopped. Inspect the destination for partial files; nothing was deleted.';
          end;
        end);
    end).Start;
end;

function TfrmTranslationStudio.IsComponentIntegrationMode: Boolean;
begin
  Result := True;
end;

procedure TfrmTranslationStudio.UpdateIntegrationModeUI;
begin
  lblLanguageMenuName.Enabled := False;
  edtLanguageMenuName.Enabled := False;
  chkBuildAfterIntegration.Visible := False;
  cboBuildPlatform.Visible := False;
  cboBuildConfiguration.Visible := False;
  chkIntegrationReviewConfirmed.Visible := False;
  btnApplyIntegration.Visible := False;
  btnRestoreIntegration.Visible := False;
  btnCompleteReset.Visible := False;
  btnOpenDesignPackageLocation.Visible := True;
  btnOpenComponentKitFolder.Visible := True;
  btnOpenDesignPackageLocation.Enabled := False;
  btnOpenComponentKitFolder.Enabled := False;
  chkIntegrationReviewConfirmed.IsChecked := False;
  btnApplyIntegration.Enabled := False;
  btnRestoreIntegration.Enabled := False;
  lstIntegrationPlan.Items.Clear;
  memIntegrationDiff.Text := 'Build the integration plan to begin.';
  btnGenerateIntegrationPackage.Enabled := False;
  if FProjectProfile.ProjectFileName <> '' then
    btnBuildIntegrationPlan.Enabled :=
      FProjectProfile.Framework <> tfUnknown;
end;

procedure TfrmTranslationStudio.cboIntegrationModeChange(Sender: TObject);
begin
  UpdateIntegrationModeUI;
  lblStatus.Text :=
    'Component Integration selected. Target source will not be modified.';
end;

procedure TfrmTranslationStudio.datLanguageMenuItemClick(Sender: TObject);
begin
  if SelectStudioLanguageMenuItem(TComponent(Sender).Name) then
    lblStatus.Text :=
      'Language preference saved. Restart the Studio to apply it.'
  else
    lblStatus.Text := 'Unable to select the requested language.';
end;

procedure TfrmTranslationStudio.ClearProjectSummary;
begin
  ClearGlossary;
  FProjectProfile := Default(TProjectProfile);
  lblProjectNameValue.Text := 'No project selected';
  lblFrameworkValue.Text := '-';
  lblPlatformsValue.Text := '-';
  lblFormsValue.Text := '-';
  lblSourcesValue.Text := '-';
  btnScanProject.Enabled := False;
  btnContinueToLanguages.Enabled := False;
  cboProjectSourceLanguage.Enabled := False;
  btnBuildIntegrationPlan.Enabled := False;
  btnGenerateIntegrationPackage.Enabled := False;
  btnApplyIntegration.Enabled := False;
  btnRestoreIntegration.Enabled := False;
  btnCompleteReset.Enabled := False;
  FIntegrationPackageDirectory := '';
  FLastIntegrationBackupDirectory := '';
  lstIntegrationPlan.Items.Clear;
  memIntegrationDiff.Text :=
    'Generate a preview, then optionally select any file to inspect its exact text.';
  chkIntegrationReviewConfirmed.IsChecked := False;
  chkIntegrationReviewConfirmed.Enabled := False;
  chkIntegrationReviewConfirmed.Text :=
    'I authorize the backed-up, transactional integration changes';
  btnApplyIntegration.Text := 'Apply';
  lblIntegrationSummary.Text := 'Open a Delphi project to build a plan.';
  lblIntegrationOutput.Text := 'Generated package path will appear here.';
  ClearScanSummary;
  ResetCatalog;
  FAddLanguagesPageVisible := False;
  FBatchReady := False;
  FBatchValidated := False;
  FBatchReadyToExport := False;
  SetLength(FBatchTargets, 0);
  FBatchReviewIndex := -1;
  cboBatchReviewTarget.Items.Clear;
  UpdateBatchReviewControls;
  lstAddLanguagesResults.Items.Clear;
  SetWorkflowStep(1);
end;

procedure TfrmTranslationStudio.ClearScanSummary;
begin
  FreeAndNil(FScanResult);
  FLastScanCompletedAt := 0;
  lblScanSummaryValue.Text := 'No scan has been run';
  lblScanBreakdown.Text :=
    'Open a project, then scan its forms and resourcestrings.';
  lstScanResults.Items.Clear;
end;

destructor TfrmTranslationStudio.Destroy;
begin
  FProjectGlossary.Free;
  FProviderSettings.Free;
  FValidationResult.Free;
  FTranslationCatalog.Free;
  FScanResult.Free;
  inherited Destroy;
end;

function TfrmTranslationStudio.SelectedLanguageCode(
  AComboBox: TComboBox): string;
var
  ClosingBracket: Integer;
  DisplayText: string;
  OpeningBracket: Integer;
begin
  Result := '';
  if (AComboBox = nil) or (AComboBox.ItemIndex < 0) then
    Exit;
  DisplayText := AComboBox.Items[AComboBox.ItemIndex];
  OpeningBracket := DisplayText.LastIndexOf('[');
  ClosingBracket := DisplayText.LastIndexOf(']');
  if (OpeningBracket >= 0) and (ClosingBracket > OpeningBracket) then
    Result := Copy(DisplayText, OpeningBracket + 2,
      ClosingBracket - OpeningBracket - 1);
end;

procedure TfrmTranslationStudio.SelectLanguageCode(AComboBox: TComboBox;
  const ALanguageCode: string);
var
  ClosingBracket: Integer;
  CodeText: string;
  Index: Integer;
  OpeningBracket: Integer;
begin
  AComboBox.ItemIndex := -1;
  for Index := 0 to AComboBox.Items.Count - 1 do
  begin
    OpeningBracket := AComboBox.Items[Index].LastIndexOf('[');
    ClosingBracket := AComboBox.Items[Index].LastIndexOf(']');
    if (OpeningBracket >= 0) and (ClosingBracket > OpeningBracket) then
    begin
      CodeText := Copy(AComboBox.Items[Index], OpeningBracket + 2,
        ClosingBracket - OpeningBracket - 1);
      if SameText(CodeText, ALanguageCode) then
      begin
        AComboBox.ItemIndex := Index;
        Break;
      end;
    end;
  end;
end;

procedure TfrmTranslationStudio.ClearGlossaryEditor;
begin
  lstGlossaryTerms.ItemIndex := -1;
  edtGlossarySourceTerm.Text := '';
  edtGlossaryTargetTerm.Text := '';
  edtGlossaryConcept.Text := '';
  edtGlossaryDeveloperNote.Text := '';
  chkGlossaryCaseSensitive.IsChecked := False;
  chkGlossaryApproved.IsChecked := True;
end;

procedure TfrmTranslationStudio.ClearGlossary;
begin
  FreeAndNil(FProjectGlossary);
  FGlossaryFileName := '';
  FGlossaryDirty := False;
  FUpdatingGlossaryLanguage := True;
  try
    cboGlossaryLanguage.ItemIndex := -1;
  finally
    FUpdatingGlossaryLanguage := False;
  end;
  lstGlossaryTerms.Items.Clear;
  ClearGlossaryEditor;
  lblGlossaryFileValue.Text := 'Open a project and select a target language.';
  lblGlossaryFileValue.Hint := '';
  lblGlossarySummary.Text := 'No project glossary is loaded.';
  UpdateGlossaryActions;
end;

procedure TfrmTranslationStudio.UpdateGlossaryActions;
var
  GlossaryLoaded: Boolean;
begin
  GlossaryLoaded := FProjectGlossary <> nil;
  btnGlossaryNew.Enabled := GlossaryLoaded;
  btnGlossaryAddUpdate.Enabled := GlossaryLoaded;
  btnGlossaryDelete.Enabled := GlossaryLoaded and
    (lstGlossaryTerms.ItemIndex >= 0);
  btnGlossaryCancelChanges.Enabled := GlossaryLoaded and FGlossaryDirty;
  btnGlossarySave.Enabled := GlossaryLoaded;
  btnGlossaryApply.Enabled := GlossaryLoaded;
end;

procedure TfrmTranslationStudio.RefreshGlossary;
var
  Term: TProjectGlossaryTerm;
begin
  lstGlossaryTerms.Items.BeginUpdate;
  try
    lstGlossaryTerms.Items.Clear;
    if FProjectGlossary <> nil then
      for Term in FProjectGlossary.Terms do
        lstGlossaryTerms.Items.Add(Term.SourceText + '  ->  ' +
          Term.TargetText);
  finally
    lstGlossaryTerms.Items.EndUpdate;
  end;
  if FProjectGlossary = nil then
    lblGlossarySummary.Text := 'No project glossary is loaded.'
  else if FGlossaryDirty then
    lblGlossarySummary.Text := Format(
      '%d term(s). Unsaved changes are waiting.',
      [FProjectGlossary.Terms.Count])
  else if TFile.Exists(FGlossaryFileName) then
    lblGlossarySummary.Text := Format('%d saved project term(s).',
      [FProjectGlossary.Terms.Count])
  else
    lblGlossarySummary.Text :=
      'This glossary is new. Add terms, then choose Save Glossary.';
  UpdateGlossaryActions;
end;

procedure TfrmTranslationStudio.LoadSelectedGlossary;
var
  LanguageCode: string;
  SourceLanguage: string;
begin
  FreeAndNil(FProjectGlossary);
  FGlossaryFileName := '';
  FGlossaryDirty := False;
  lstGlossaryTerms.Items.Clear;
  ClearGlossaryEditor;
  LanguageCode := SelectedLanguageCode(cboGlossaryLanguage);
  if Trim(FProjectProfile.ProjectName) = '' then
  begin
    lblGlossaryFileValue.Text := 'Open a Delphi project first.';
    lblGlossarySummary.Text :=
      'A project is required because every glossary belongs to one application.';
    UpdateGlossaryActions;
    Exit;
  end;
  if LanguageCode = '' then
  begin
    lblGlossaryFileValue.Text := 'Select a target language.';
    lblGlossarySummary.Text :=
      'Choose the language whose preferred terminology you want to maintain.';
    UpdateGlossaryActions;
    Exit;
  end;
  try
    SourceLanguage := SelectedLanguageCode(cboProjectSourceLanguage);
    if SourceLanguage = '' then
      raise EInvalidOpException.Create(
        'Choose the original app language on the Project page before opening a glossary.');
    if SameText(SourceLanguage, LanguageCode) then
      raise EInvalidOpException.Create(
        'Choose different source and glossary target languages.');
    FGlossaryFileName := TTranslationWorkspace.GlossaryFileName(
      FProjectProfile, LanguageCode, SourceLanguage);
    FProjectGlossary := TProjectGlossary.LoadFromFile(FGlossaryFileName);
    if (Trim(FProjectGlossary.SourceLanguage) <> '') and
      not SameText(FProjectGlossary.SourceLanguage, SourceLanguage) then
      raise EInvalidOpException.Create(
        'The saved glossary belongs to a different source language.');
    FProjectGlossary.ApplicationId := FProjectProfile.ProjectName;
    FProjectGlossary.SourceLanguage := SourceLanguage;
    FProjectGlossary.TargetLanguage := LanguageCode;
    lblGlossaryFileValue.Text := FGlossaryFileName;
    lblGlossaryFileValue.Hint := FGlossaryFileName;
    RefreshGlossary;
    if TFile.Exists(FGlossaryFileName) then
      lblStatus.Text := 'Project glossary loaded for ' + LanguageCode + '.'
    else
      lblStatus.Text :=
        'New project glossary ready for ' + LanguageCode +
        '. No Wizard run is required.';
  except
    on E: Exception do
    begin
      FreeAndNil(FProjectGlossary);
      lblGlossarySummary.Text := 'The glossary could not be loaded safely.';
      lblStatus.Text := E.Message;
      UpdateGlossaryActions;
    end;
  end;
end;

function TfrmTranslationStudio.SaveProjectGlossary: Boolean;
var
  SourceLanguage: string;
begin
  Result := False;
  if (FProjectGlossary = nil) or (FGlossaryFileName = '') then
  begin
    lblStatus.Text := 'Open a project and select a glossary language first.';
    Exit;
  end;
  SourceLanguage := SelectedLanguageCode(cboProjectSourceLanguage);
  if SourceLanguage = '' then
  begin
    lblStatus.Text :=
      'Choose the original app language on the Project page before saving a glossary.';
    Exit;
  end;
  if not SameText(FGlossaryFileName,
    TTranslationWorkspace.GlossaryFileName(FProjectProfile,
      SelectedLanguageCode(cboGlossaryLanguage), SourceLanguage)) then
  begin
    lblStatus.Text := 'The source or target language changed. Reload the matching glossary before saving.';
    Exit;
  end;
  FProjectGlossary.ApplicationId := FProjectProfile.ProjectName;
  FProjectGlossary.SourceLanguage := SourceLanguage;
  FProjectGlossary.TargetLanguage :=
    SelectedLanguageCode(cboGlossaryLanguage);
  try
    FProjectGlossary.SaveToFile(FGlossaryFileName);
    FGlossaryDirty := False;
    RefreshGlossary;
    lblStatus.Text := 'Project glossary saved: ' + FGlossaryFileName;
    Result := True;
  except
    on E: Exception do
      lblStatus.Text := 'The glossary was not saved: ' + E.Message;
  end;
end;

function TfrmTranslationStudio.ConfirmGlossaryChanges: Boolean;
var
  Response: Integer;
begin
  Result := True;
  if not FGlossaryDirty then
    Exit;
  Response := TDialogServiceSync.MessageDialog(
    'The project glossary has unsaved changes. Save them before continuing?',
    TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo, TMsgDlgBtn.mbCancel],
    TMsgDlgBtn.mbCancel, 0);
  case Response of
    mrYes:
      Result := SaveProjectGlossary;
    mrNo:
      begin
        FGlossaryDirty := False;
        Result := True;
      end;
  else
    Result := False;
  end;
end;

procedure TfrmTranslationStudio.cboGlossaryLanguageChange(Sender: TObject);
var
  PreviousLanguage: string;
begin
  if FUpdatingGlossaryLanguage then
    Exit;
  PreviousLanguage := '';
  if FProjectGlossary <> nil then
    PreviousLanguage := FProjectGlossary.TargetLanguage;
  if not ConfirmGlossaryChanges then
  begin
    FUpdatingGlossaryLanguage := True;
    try
      SelectLanguageCode(cboGlossaryLanguage, PreviousLanguage);
    finally
      FUpdatingGlossaryLanguage := False;
    end;
    Exit;
  end;
  LoadSelectedGlossary;
end;

procedure TfrmTranslationStudio.lstGlossaryTermsChange(Sender: TObject);
var
  Term: TProjectGlossaryTerm;
begin
  if (FProjectGlossary = nil) or
     (lstGlossaryTerms.ItemIndex < 0) or
     (lstGlossaryTerms.ItemIndex >= FProjectGlossary.Terms.Count) then
  begin
    UpdateGlossaryActions;
    Exit;
  end;
  Term := FProjectGlossary.Terms[lstGlossaryTerms.ItemIndex];
  edtGlossarySourceTerm.Text := Term.SourceText;
  edtGlossaryTargetTerm.Text := Term.TargetText;
  edtGlossaryConcept.Text := Term.SemanticConcept;
  edtGlossaryDeveloperNote.Text := Term.DeveloperNote;
  chkGlossaryCaseSensitive.IsChecked := Term.CaseSensitive;
  chkGlossaryApproved.IsChecked := Term.Approved;
  UpdateGlossaryActions;
end;

procedure TfrmTranslationStudio.btnGlossaryNewClick(Sender: TObject);
begin
  ClearGlossaryEditor;
  edtGlossarySourceTerm.SetFocus;
  UpdateGlossaryActions;
end;

procedure TfrmTranslationStudio.btnGlossaryAddUpdateClick(Sender: TObject);
var
  SelectedIndex: Integer;
  Term: TProjectGlossaryTerm;
begin
  if FProjectGlossary = nil then
    Exit;
  if (Trim(edtGlossarySourceTerm.Text) = '') or
     (Trim(edtGlossaryTargetTerm.Text) = '') then
  begin
    lblStatus.Text :=
      'Enter both the source term and its preferred translation.';
    Exit;
  end;
  SelectedIndex := lstGlossaryTerms.ItemIndex;
  if (SelectedIndex >= 0) and
     (SelectedIndex < FProjectGlossary.Terms.Count) then
    Term := FProjectGlossary.Terms[SelectedIndex]
  else
  begin
    Term := TProjectGlossaryTerm.Create;
    FProjectGlossary.Terms.Add(Term);
    SelectedIndex := FProjectGlossary.Terms.Count - 1;
  end;
  Term.SourceText := Trim(edtGlossarySourceTerm.Text);
  Term.TargetText := Trim(edtGlossaryTargetTerm.Text);
  Term.SemanticConcept := Trim(edtGlossaryConcept.Text);
  Term.DeveloperNote := Trim(edtGlossaryDeveloperNote.Text);
  Term.CaseSensitive := chkGlossaryCaseSensitive.IsChecked;
  Term.Approved := chkGlossaryApproved.IsChecked;
  FGlossaryDirty := True;
  RefreshGlossary;
  lstGlossaryTerms.ItemIndex := SelectedIndex;
  lstGlossaryTermsChange(lstGlossaryTerms);
  lblStatus.Text :=
    'Glossary term updated. Choose Save Glossary to keep this change.';
end;

procedure TfrmTranslationStudio.btnGlossaryDeleteClick(Sender: TObject);
var
  Response: Integer;
begin
  if (FProjectGlossary = nil) or
     (lstGlossaryTerms.ItemIndex < 0) or
     (lstGlossaryTerms.ItemIndex >= FProjectGlossary.Terms.Count) then
    Exit;
  Response := TDialogServiceSync.MessageDialog(
    'Delete the selected glossary term?', TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], TMsgDlgBtn.mbNo, 0);
  if Response <> mrYes then
    Exit;
  FProjectGlossary.Terms.Delete(lstGlossaryTerms.ItemIndex);
  FGlossaryDirty := True;
  ClearGlossaryEditor;
  RefreshGlossary;
  lblStatus.Text :=
    'Glossary term deleted. Choose Save Glossary to keep this change.';
end;

procedure TfrmTranslationStudio.btnGlossaryCancelChangesClick(Sender: TObject);
var
  Response: Integer;
begin
  if not FGlossaryDirty then
    Exit;
  Response := TDialogServiceSync.MessageDialog(
    'Discard all unsaved changes to this glossary?',
    TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], TMsgDlgBtn.mbNo, 0);
  if Response = mrYes then
  begin
    LoadSelectedGlossary;
    lblStatus.Text := 'Unsaved glossary changes were canceled.';
  end;
end;

procedure TfrmTranslationStudio.btnGlossarySaveClick(Sender: TObject);
begin
  SaveProjectGlossary;
end;

procedure TfrmTranslationStudio.btnGlossaryApplyClick(Sender: TObject);
var
  LayoutProposalFileName: string;
  PublishResult: TGlossaryPublishResult;
begin
  if FProjectGlossary = nil then
    Exit;
  if FGlossaryDirty and not SaveProjectGlossary then
    Exit;
  PublishResult := nil;
  ShowOperation('Publishing glossary',
    'Validating the catalog and preparing runtime language packs...', False);
  try
    LayoutProposalFileName := TPath.Combine(FindStudioProjectRoot,
      TPath.Combine('export\localization-review',
        TPath.Combine(FProjectProfile.ProjectName,
          TPath.Combine(SelectedLanguageCode(cboGlossaryLanguage),
            'layout-proposal.json'))));
    PublishResult := TGlossaryPublisher.Publish(FProjectProfile,
      FGlossaryFileName, LayoutProposalFileName);
    if (FTranslationCatalog <> nil) and
      SameText(FTranslationCatalog.Locale.LanguageCode,
        SelectedLanguageCode(cboGlossaryLanguage)) then
    begin
      FreeAndNil(FTranslationCatalog);
      FTranslationCatalog := TCatalogJson.LoadFromFile(
        PublishResult.CatalogFileName);
      FCatalogFileName := PublishResult.CatalogFileName;
      lblCatalogPathValue.Text := FCatalogFileName;
      DisplayCatalogLanguage;
      DisplayCatalogEntries;
      InvalidateValidation;
      UpdateCatalogReadiness;
    end;
    lblGlossarySummary.Text := PublishResult.Summary;
    lblExportPathValue.Text := PublishResult.RuntimePackFileName;
    if PublishResult.FailedDestinationCount = 0 then
      lblStatus.Text := 'Glossary changes published without rebuilding the application.'
    else
      lblStatus.Text :=
        'Glossary and canonical packs were updated, but one or more deployment destinations need attention.';
    TDialogServiceSync.MessageDialog(PublishResult.Summary + sLineBreak +
      sLineBreak + PublishResult.Messages.Text, TMsgDlgType.mtInformation,
      [TMsgDlgBtn.mbOK], TMsgDlgBtn.mbOK, 0);
  except
    on E: Exception do
    begin
      lblGlossarySummary.Text := 'Glossary publishing did not complete.';
      lblStatus.Text := E.Message;
    end;
  end;
  PublishResult.Free;
  HideOperation;
  UpdateGlossaryActions;
end;

procedure TfrmTranslationStudio.ApplyTargetLanguageDefaults;
var
  DisplayText: string;
  LanguageCode: string;
  LocaleFacts: TLocaleFacts;
  LocaleSettings: TFormatSettings;
  OpeningBracket: Integer;
begin
  LanguageCode := SelectedLanguageCode(cboTargetLanguage);
  if LanguageCode = '' then
    Exit;
  DisplayText := cboTargetLanguage.Items[cboTargetLanguage.ItemIndex];
  OpeningBracket := DisplayText.LastIndexOf('[');
  if OpeningBracket > 0 then
    edtNativeLanguageName.Text := CanonicalNativeLanguageName(LanguageCode,
      Trim(Copy(DisplayText, 1, OpeningBracket)));
  LocaleFacts := TLocaleFactsReader.Read(LanguageCode);
  if SameText(LocaleFacts.TextDirection, 'rtl') then
    cboTextDirection.ItemIndex := 1
  else
    cboTextDirection.ItemIndex := 0;
  if TLocaleFactsReader.Known(LanguageCode) then
  begin
    edtShortDateFormat.Text := LocaleFacts.ShortDateFormat;
    edtLongDateFormat.Text := LocaleFacts.LongDateFormat;
    edtShortTimeFormat.Text := LocaleFacts.ShortTimeFormat;
    edtLongTimeFormat.Text := LocaleFacts.LongTimeFormat;
    edtDecimalSeparator.Text := LocaleFacts.DecimalSeparator;
    edtThousandSeparator.Text := LocaleFacts.ThousandSeparator;
    edtCurrencySymbol.Text := LocaleFacts.CurrencySymbol;
    Exit;
  end;
  try
    LocaleSettings := TFormatSettings.Create(LanguageCode);
    edtShortDateFormat.Text := LocaleSettings.ShortDateFormat;
    edtLongDateFormat.Text := LocaleSettings.LongDateFormat;
    edtShortTimeFormat.Text := LocaleSettings.ShortTimeFormat;
    edtLongTimeFormat.Text := LocaleSettings.LongTimeFormat;
    edtDecimalSeparator.Text := LocaleSettings.DecimalSeparator;
    edtThousandSeparator.Text := LocaleSettings.ThousandSeparator;
    edtCurrencySymbol.Text := LocaleSettings.CurrencyString;
  except
    edtShortDateFormat.Text := 'yyyy-MM-dd';
    edtLongDateFormat.Text := 'dddd, d MMMM yyyy';
    edtShortTimeFormat.Text := 'HH:mm';
    edtLongTimeFormat.Text := 'HH:mm:ss';
    edtDecimalSeparator.Text := '.';
    edtThousandSeparator.Text := ',';
    edtCurrencySymbol.Text := '';
  end;
end;

procedure TfrmTranslationStudio.DisplaySelectedIntegrationChange;
var
  ComponentFileName: string;
begin
  if (FIntegrationPackageDirectory = '') or
    (lstIntegrationPlan.ItemIndex < 0) then
  begin
    memIntegrationDiff.Text :=
      'Generate the component kit to inspect its files and instructions.';
    Exit;
  end;
  ComponentFileName := TPath.Combine(FIntegrationPackageDirectory,
    lstIntegrationPlan.Items[lstIntegrationPlan.ItemIndex]);
  if TFile.Exists(ComponentFileName) then
    memIntegrationDiff.Lines.LoadFromFile(ComponentFileName, TEncoding.UTF8)
  else
    memIntegrationDiff.Text := 'Generated file not found: ' +
      ComponentFileName;
  memIntegrationDiff.GoToTextBegin;
end;

procedure TfrmTranslationStudio.UpdateIntegrationApplyState;
begin
  btnApplyIntegration.Enabled := False;
  btnRestoreIntegration.Enabled := False;
  btnCompleteReset.Enabled := False;
  chkIntegrationReviewConfirmed.Enabled := False;
end;

function TfrmTranslationStudio.SelectedProvider: TTranslationProvider;
begin
  if cboTranslationProvider.ItemIndex = 1 then
    Result := tpGoogle
  else
    Result := tpDeepL;
end;

function TfrmTranslationStudio.EffectiveApiKey(
  const AProvider: TTranslationProvider): string;
begin
  Result := Trim(edtProviderApiKey.Text);
  if Result <> '' then
    Exit;
  Result := FSessionApiKeys[AProvider];
  if (Result = '') and TProviderCredentialStore.Exists(AProvider) then
    Result := TProviderCredentialStore.Read(AProvider);
end;

procedure TfrmTranslationStudio.LoadProviderSettings;
begin
  FreeAndNil(FProviderSettings);
  FProviderSettings := TProviderSettings.Load;
  cboTranslationProvider.ItemIndex := Ord(FProviderSettings.Provider);
  cboDeepLPlan.ItemIndex := Ord(FProviderSettings.DeepLPlan);
  chkRememberCredential.IsChecked :=
    FProviderSettings.RememberCredential;
  edtRequestTimeout.Text :=
    FProviderSettings.RequestTimeoutSeconds.ToString;
  edtProviderBatchSize.Text := FProviderSettings.BatchSize.ToString;
  edtProviderApiKey.Text := '';
  cboDeepLPlan.Enabled := SelectedProvider = tpDeepL;
  lblCredentialStatus.Text :=
    'Provider configuration has not been opened.';
end;

procedure TfrmTranslationStudio.SaveProviderSettings;
begin
  FProviderSettings.Provider := SelectedProvider;
  if cboDeepLPlan.ItemIndex = 1 then
    FProviderSettings.DeepLPlan := dpPro
  else
    FProviderSettings.DeepLPlan := dpFree;
  FProviderSettings.RememberCredential :=
    chkRememberCredential.IsChecked;
  FProviderSettings.RequestTimeoutSeconds :=
    StrToIntDef(edtRequestTimeout.Text, 30);
  FProviderSettings.BatchSize :=
    StrToIntDef(edtProviderBatchSize.Text, 40);
  if FProviderSettings.RequestTimeoutSeconds < 5 then
    FProviderSettings.RequestTimeoutSeconds := 5;
  if FProviderSettings.RequestTimeoutSeconds > 300 then
    FProviderSettings.RequestTimeoutSeconds := 300;
  if FProviderSettings.BatchSize < 1 then
    FProviderSettings.BatchSize := 1;
  if FProviderSettings.BatchSize > 50 then
    FProviderSettings.BatchSize := 50;
  edtRequestTimeout.Text :=
    FProviderSettings.RequestTimeoutSeconds.ToString;
  edtProviderBatchSize.Text :=
    FProviderSettings.BatchSize.ToString;
  FProviderSettings.Save;
end;

procedure TfrmTranslationStudio.UpdateCredentialStatus;
var
  Provider: TTranslationProvider;
begin
  Provider := SelectedProvider;
  if Trim(edtProviderApiKey.Text) <> '' then
    lblCredentialStatus.Text :=
      'A new masked key is ready to save or use for this session.'
  else if FSessionApiKeys[Provider] <> '' then
    lblCredentialStatus.Text :=
      'A session-only key is active. It will be forgotten when the Studio closes.'
  else if TProviderCredentialStore.Exists(Provider) then
    lblCredentialStatus.Text :=
      'A key is stored securely in Windows Credential Manager.'
  else
    lblCredentialStatus.Text :=
      'No API key is configured for this provider.';
end;

procedure TfrmTranslationStudio.cboTargetLanguageChange(Sender: TObject);
begin
  if FUpdatingTargetLanguage then
    Exit;
  ApplyTargetLanguageDefaults;
  InvalidateValidation;
  if (FWorkflowStep = 3) and not FBatchReady and
     not FAddLanguagesPageVisible then
    btnWorkflowNext.Enabled :=
      (FTranslationCatalog <> nil) and
      (SelectedLanguageCode(cboTargetLanguage) <> '');
end;

procedure TfrmTranslationStudio.cboProjectSourceLanguageChange(Sender: TObject);
begin
  if FProjectSourceUpdating or (FProjectProfile.ProjectFileName = '') then
    Exit;
  SelectLanguageCode(cboSourceLanguage,
    SelectedLanguageCode(cboProjectSourceLanguage));
  UpdateAddLanguagesSelection;
  if SelectedLanguageCode(cboProjectSourceLanguage) <> '' then
    lblStatus.Text := 'Source language confirmed. Choose Scan Project.';
end;

procedure TfrmTranslationStudio.btnContinueToLanguagesClick(Sender: TObject);
begin
  if FScanResult = nil then
  begin
    lblStatus.Text := 'Run the project scan before choosing target languages.';
    Exit;
  end;
  if FBatchReady then
  begin
    FBatchReviewComplete := True;
    FAddLanguagesPageVisible := False;
    SetWorkflowStep(3);
    Exit;
  end;
  FAddLanguagesPageVisible := True;
  FCatalogToolsPageVisible := False;
  SetWorkflowStep(3);
  lblStatus.Text := 'Select target languages, then choose Translate Selected.';
end;

procedure TfrmTranslationStudio.DisplayProjectSummary(
  const AProfile: TProjectProfile);
var
  Parsed: TJSONValue;
  SavedProject: TJSONValue;
  SavedSource: TJSONValue;
  SessionFileName: string;
begin
  ClearGlossary;
  FProjectProfile := AProfile;
  lblProjectNameValue.Text := AProfile.ProjectName;
  lblFrameworkValue.Text := TargetFrameworkToString(AProfile.Framework);
  lblPlatformsValue.Text := ProjectPlatformsDisplayName(AProfile);
  lblFormsValue.Text := AProfile.FormResourceCount.ToString;
  lblSourcesValue.Text := AProfile.SourceFileCount.ToString;
  ClearScanSummary;
  ResetCatalog;
  SessionFileName := TPath.Combine(
    TTranslationWorkspace.DeploymentDirectory(AProfile),
    'batch-session.json');
  if TFile.Exists(SessionFileName) then
  begin
    Parsed := nil;
    try
      Parsed := TJSONObject.ParseJSONValue(TFile.ReadAllText(SessionFileName,
        TEncoding.UTF8));
      if Parsed is TJSONObject then
      begin
        SavedProject := TJSONObject(Parsed).GetValue('projectFileName');
        SavedSource := TJSONObject(Parsed).GetValue('sourceLanguage');
        if (SavedProject <> nil) and (SavedSource <> nil) and
           SameText(TProjectDetector.Detect(
             SavedProject.Value).ProjectFileName, AProfile.ProjectFileName) then
        begin
          FProjectSourceUpdating := True;
          try
            SelectLanguageCode(cboProjectSourceLanguage, SavedSource.Value);
            SelectLanguageCode(cboSourceLanguage, SavedSource.Value);
          finally
            FProjectSourceUpdating := False;
          end;
        end;
      end;
    except
      { An unreadable session must not prevent a project from opening. }
    end;
    Parsed.Free;
  end;
  FIntegrationPackageDirectory := '';
  cboProjectSourceLanguage.Enabled := AProfile.Framework <> tfUnknown;
  btnScanProject.Enabled := AProfile.Framework <> tfUnknown;
  btnContinueToLanguages.Enabled := False;
  btnBuildIntegrationPlan.Enabled := AProfile.Framework <> tfUnknown;
  btnCompleteReset.Enabled := False;
  SetWorkflowStep(2);
  if SelectedLanguageCode(cboProjectSourceLanguage) <> '' then
    lblScanBreakdown.Text :=
      'Saved original app language restored. Confirm it, then click Scan Project.'
  else
    lblScanBreakdown.Text :=
      'Choose the language written in the saved forms and source, then click Scan Project.';

  if AProfile.Framework = tfUnknown then
    lblStatus.Text :=
      'Project opened, but its UI framework could not be identified.'
  else if SelectedLanguageCode(cboProjectSourceLanguage) <> '' then
    lblStatus.Text := Format(
      '%s project opened. Original app language restored as %s. ' +
      'Confirm it, then click Scan Project.',
      [TargetFrameworkToString(AProfile.Framework),
       SelectedLanguageCode(cboProjectSourceLanguage)])
  else
    lblStatus.Text := Format(
      '%s project opened. Choose its saved-text language, then click Scan Project.',
      [TargetFrameworkToString(AProfile.Framework)]);
end;

procedure TfrmTranslationStudio.DisplayScanResult(
  const AResult: TProjectScanResult;
  const ARawScanCount, ARecoveredSemanticCount,
  ADuplicateOccurrenceCount: Integer);
var
  DisplayText: string;
  ScanItem: TScanItem;
  DesignerCount, RuntimeCount, DataCount, SuspiciousCount, ExcludedCount: Integer;
  UniqueCatalogCount: Integer;
begin
  DesignerCount := 0;
  RuntimeCount := 0;
  DataCount := 0;
  SuspiciousCount := 0;
  ExcludedCount := 0;
  for ScanItem in AResult.Items do
    case ScanItem.TextOwnership of
      tokRuntimeWired, tokRuntimeUnwired: Inc(RuntimeCount);
      tokApplicationData: Inc(DataCount);
      tokSuspicious: Inc(SuspiciousCount);
      tokExcluded: Inc(ExcludedCount);
    else
      Inc(DesignerCount);
    end;
  UniqueCatalogCount := AResult.Items.Count - ADuplicateOccurrenceCount;
  lblScanSummaryValue.Text := Format(
    '%d unique catalog entries  |  scan: %d ms',
    [UniqueCatalogCount, AResult.ElapsedMilliseconds]);
  lblScanBreakdown.Text := Format(
    '%d raw scanned occurrences | %d recovered semantic contracts | %d duplicate occurrences collapsed' +
    sLineBreak + '%d form properties | %d resourcestrings | %d runtime assignments' +
    sLineBreak + '%d forms | %d source files | %d files total' + sLineBreak +
    'Ownership: %d designer | %d runtime | %d data | %d suspicious | %d excluded',
    [ARawScanCount, ARecoveredSemanticCount, ADuplicateOccurrenceCount,
     AResult.CountByKind(stkFormProperty),
     AResult.CountByKind(stkResourceString),
     AResult.CountByKind(stkRuntimeAssignment),
     AResult.FormFilesScanned, AResult.SourceFilesScanned,
     AResult.FilesScanned,
     DesignerCount, RuntimeCount, DataCount, SuspiciousCount, ExcludedCount]);

  lstScanResults.BeginUpdate;
  try
    lstScanResults.Items.Clear;
    for ScanItem in AResult.Items do
    begin
      DisplayText := ScanItem.SourceText.Replace(#13#10, ' / ')
        .Replace(#13, ' / ').Replace(#10, ' / ');
      lstScanResults.Items.Add(Format('[%s] %s  =  %s',
        [TextOwnershipDisplayName(ScanItem.TextOwnership), ScanItem.Key,
         DisplayText]));
    end;
  finally
    lstScanResults.EndUpdate;
  end;
end;

procedure TfrmTranslationStudio.DisplayCatalogEntries;
var
  Entry: TTranslationEntry;
begin
  FDisplayedEntryIndex := -1;
  FTranslationEditorDirty := False;
  FUpdatingEntryControls := True;
  lstCatalogEntries.BeginUpdate;
  try
    lstCatalogEntries.Items.Clear;
    if FTranslationCatalog <> nil then
      for Entry in FTranslationCatalog.Entries do
        lstCatalogEntries.Items.Add(Entry.Key + '  [' +
          TranslationStatusToString(Entry.Status) + ' / ' +
          TranslationOriginDisplayName(Entry.TranslationOrigin) + ']');
  finally
    lstCatalogEntries.EndUpdate;
    FUpdatingEntryControls := False;
  end;
  memSourceText.Text := '';
  memTranslatedText.Text := '';
  lblRuntimeApplicationValue.Text := 'Runtime: select an entry';
  lblTranslationContextValue.Text := 'Context: select an entry';
  lblTranslationContextValue.Hint :=
    'Select an entry to see its inferred translation context.';
  chkRuntimeWiringConfirmed.IsChecked := False;
  chkRuntimeWiringConfirmed.Enabled := False;
  chkRuntimeWiringConfirmed.Visible := False;
  cboTranslationSuggestions.Items.Clear;
  btnAcceptSuggestion.Enabled := False;
  lblTranslationSuggestion.Visible := False;
  cboTranslationSuggestions.Visible := False;
  btnAcceptSuggestion.Visible := False;
  btnMarkTranslationReviewed.Enabled := False;
  btnApproveTranslation.Enabled := False;
  UpdateCatalogReadiness;
  if lstCatalogEntries.Count > 0 then
    lstCatalogEntries.ItemIndex := 0;
end;

procedure TfrmTranslationStudio.UpdateCatalogReadiness;
var
  ActiveCount: Integer;
  ApprovedCount: Integer;
  AIDraftCount: Integer;
  AutomaticCount: Integer;
  Entry: TTranslationEntry;
  ManualConfirmedCount: Integer;
  ManualCount: Integer;
  ReviewedCount: Integer;
  TranslatedCount: Integer;
begin
  AIDraftCount := 0;
  ActiveCount := 0;
  ApprovedCount := 0;
  AutomaticCount := 0;
  ManualConfirmedCount := 0;
  ManualCount := 0;
  ReviewedCount := 0;
  TranslatedCount := 0;
  if FTranslationCatalog <> nil then
    for Entry in FTranslationCatalog.Entries do
      if RuntimeTextRoleRequiresTranslation(Entry.RuntimeTextRole) and
        not (Entry.Status in [tsExcluded, tsObsolete]) then
      begin
        Inc(ActiveCount);
        if Trim(Entry.TranslatedText) <> '' then
          Inc(TranslatedCount);
        if Entry.Status in [tsReviewed, tsApproved] then
          Inc(ReviewedCount);
        if Entry.Status = tsApproved then
          Inc(ApprovedCount);
        if Entry.Status = tsAIDraft then
          Inc(AIDraftCount);
        if Entry.RuntimeApplication = rakAutomatic then
          Inc(AutomaticCount)
        else
        begin
          Inc(ManualCount);
          if Entry.RuntimeWiringConfirmed then
            Inc(ManualConfirmedCount);
        end;
      end;
  if FTranslationCatalog = nil then
    lblCatalogReadiness.Text := 'Translation and runtime readiness: no catalog'
  else
    lblCatalogReadiness.Text := Format(
      'Text %d/%d  |  AI drafts %d  |  Reviewed+ %d  |  Approved %d' +
      sLineBreak +
      'Runtime automatic %d  |  Manual wiring %d/%d confirmed',
      [TranslatedCount, ActiveCount, AIDraftCount, ReviewedCount,
       ApprovedCount,
       AutomaticCount, ManualConfirmedCount, ManualCount]);
end;

procedure TfrmTranslationStudio.UpdateTranslationSuggestions(
  const AEntry: TTranslationEntry);
var
  Candidate: TTranslationEntry;
  CandidateIndex: Integer;
  CandidateSortText: string;
  Candidates: TStringList;
  Score: Integer;
begin
  cboTranslationSuggestions.Items.Clear;
  btnAcceptSuggestion.Enabled := False;
  lblTranslationSuggestion.Visible := False;
  cboTranslationSuggestions.Visible := False;
  btnAcceptSuggestion.Visible := False;
  if (FTranslationCatalog = nil) or (AEntry = nil) then
    Exit;

  Candidates := TStringList.Create;
  try
    Candidates.Sorted := True;
    Candidates.Duplicates := dupAccept;
    for Candidate in FTranslationCatalog.Entries do
      if (Candidate <> AEntry) and
         SameText(Candidate.SourceText, AEntry.SourceText) and
         (Candidate.Status in [tsReviewed, tsApproved]) and
         (Trim(Candidate.TranslatedText) <> '') then
      begin
        Score := 0;
        if (AEntry.SemanticConcept <> '') and
          SameText(Candidate.SemanticConcept, AEntry.SemanticConcept) then
          Inc(Score, 300)
        else if SameText(Candidate.ContextKind, AEntry.ContextKind) then
          Inc(Score, 80);
        if SameText(Candidate.FormName, AEntry.FormName) then
          Inc(Score, 100);
        if SameText(Candidate.ComponentClassName,
          AEntry.ComponentClassName) and
           SameText(Candidate.PropertyName, AEntry.PropertyName) then
          Inc(Score, 60)
        else if SameText(Candidate.PropertyName,
          AEntry.PropertyName) then
          Inc(Score, 20);
        if SameText(Candidate.SourceKind, AEntry.SourceKind) then
          Inc(Score, 10);
        CandidateSortText := Format('%.4d|%s|%s',
          [9999 - Score, Candidate.Key, Candidate.TranslatedText]);
        Candidates.AddObject(CandidateSortText, Candidate);
      end;

    for CandidateIndex := 0 to Candidates.Count - 1 do
    begin
      Candidate := TTranslationEntry(Candidates.Objects[CandidateIndex]);
      cboTranslationSuggestions.Items.AddObject(
        Candidate.TranslatedText + '  â€”  ' + Candidate.Key, Candidate);
    end;
  finally
    Candidates.Free;
  end;
  if cboTranslationSuggestions.Items.Count > 0 then
  begin
    cboTranslationSuggestions.ItemIndex := 0;
    btnAcceptSuggestion.Enabled := True;
    lblTranslationSuggestion.Visible := True;
    cboTranslationSuggestions.Visible := True;
    btnAcceptSuggestion.Visible := True;
  end;
end;

procedure TfrmTranslationStudio.DisplayCatalogLanguage;
begin
  if FTranslationCatalog = nil then
    Exit;
  FUpdatingTargetLanguage := True;
  try
    SelectLanguageCode(cboSourceLanguage,
      FTranslationCatalog.SourceLanguage);
    SelectLanguageCode(cboTargetLanguage,
      FTranslationCatalog.Locale.LanguageCode);
  finally
    FUpdatingTargetLanguage := False;
  end;
  edtNativeLanguageName.Text := CanonicalNativeLanguageName(
    FTranslationCatalog.Locale.LanguageCode,
    FTranslationCatalog.Locale.NativeLanguageName);
  if SameText(FTranslationCatalog.Locale.TextDirection, 'rtl') then
    cboTextDirection.ItemIndex := 1
  else
    cboTextDirection.ItemIndex := 0;
  edtShortDateFormat.Text := FTranslationCatalog.Locale.ShortDateFormat;
  edtLongDateFormat.Text := FTranslationCatalog.Locale.LongDateFormat;
  edtShortTimeFormat.Text := FTranslationCatalog.Locale.ShortTimeFormat;
  edtLongTimeFormat.Text := FTranslationCatalog.Locale.LongTimeFormat;
  edtDecimalSeparator.Text := FTranslationCatalog.Locale.DecimalSeparator;
  edtThousandSeparator.Text := FTranslationCatalog.Locale.ThousandSeparator;
  edtCurrencySymbol.Text := FTranslationCatalog.Locale.CurrencySymbol;
  UpdateGlossaryActions;
end;

procedure TfrmTranslationStudio.DisplayValidationResult;
var
  Entry: TTranslationEntry;
  Issue: TValidationIssue;
  RuntimeEntryCount: Integer;
begin
  if not FBatchReady then
  begin
    lstValidationLanguages.OnChange := nil;
    try
      lstValidationLanguages.Items.Clear;
      if (FValidationResult <> nil) and
         (SelectedLanguageCode(cboTargetLanguage) <> '') then
      begin
        lstValidationLanguages.Items.Add(Format('%s  |  %d errors',
          [SelectedLanguageCode(cboTargetLanguage),
           FValidationResult.CountBySeverity(vsError)]));
        lstValidationLanguages.ItemIndex := 0;
      end;
    finally
      lstValidationLanguages.OnChange := lstValidationLanguagesChange;
    end;
  end;
  lstValidationIssues.BeginUpdate;
  try
    lstValidationIssues.Items.Clear;
    if FValidationResult <> nil then
      for Issue in FValidationResult.Issues do
        lstValidationIssues.Items.Add(Format('[%s] %s  %s',
          [ValidationSeverityDisplayName(Issue.Severity),
           Issue.EntryKey, Issue.MessageText]));
  finally
    lstValidationIssues.EndUpdate;
  end;

  if FValidationResult = nil then
  begin
    lblValidationSummary.Text := 'Validation has not been run.';
    memValidationIssueDetail.Text := 'Run validation to see specific issues.';
    btnExportRuntimePack.Enabled := False;
    Exit;
  end;

  lblValidationSummary.Text := Format(
    '%d errors  |  %d warnings  |  %d information messages.  %s',
    [FValidationResult.CountBySeverity(vsError),
     FValidationResult.CountBySeverity(vsWarning),
     FValidationResult.CountBySeverity(vsInformation),
     IfThen(FValidationResult.HasErrors,
       'Fix errors before export; double-click an item to open it.',
       'Export may continue; double-click a warning to review it.')]);
  btnExportRuntimePack.Enabled := not FValidationResult.HasErrors;
  if lstValidationIssues.Count > 0 then
    lstValidationIssues.ItemIndex := 0
  else
    memValidationIssueDetail.Text := 'No issues were found.';
  if FValidationResult.HasErrors then
    lblExportSummary.Text := 'Export is blocked by validation errors.'
  else
  begin
    RuntimeEntryCount := 0;
    for Entry in FTranslationCatalog.Entries do
      if RuntimeTextRoleRequiresTranslation(Entry.RuntimeTextRole) and
         not (Entry.Status in [tsExcluded, tsObsolete]) then
        Inc(RuntimeEntryCount);
    lblExportSummary.Text := Format(
      '%d translated entries are ready for offline export.',
      [RuntimeEntryCount]);
  end;
end;

procedure TfrmTranslationStudio.lblCatalogPathValueClick(Sender: TObject);
var
  Arguments: string;
  CatalogDirectory: string;
begin
  if FCatalogFileName = '' then
  begin
    lblStatus.Text := 'Save or open a catalog before opening its folder.';
    Exit;
  end;
  CatalogDirectory := TPath.GetDirectoryName(FCatalogFileName);
  if TFile.Exists(FCatalogFileName) then
    Arguments := '/select,"' + FCatalogFileName + '"'
  else
    Arguments := '"' + CatalogDirectory + '"';
  if ShellExecute(0, 'open', 'explorer.exe', PChar(Arguments), nil,
    SW_SHOWNORMAL) <= 32 then
    lblStatus.Text := 'Unable to open the catalog folder.'
  else
    lblStatus.Text := 'Catalog selected in File Explorer.';
end;

procedure TfrmTranslationStudio.lblExportPathValueClick(Sender: TObject);
var
  Arguments: string;
  RuntimeFileName: string;
begin
  RuntimeFileName := Trim(lblExportPathValue.Text);
  if not TFile.Exists(RuntimeFileName) then
  begin
    lblStatus.Text := 'Export a runtime pack before opening its location.';
    Exit;
  end;
  Arguments := '/select,"' + RuntimeFileName + '"';
  if ShellExecute(0, 'open', 'explorer.exe', PChar(Arguments), nil,
    SW_SHOWNORMAL) <= 32 then
    lblStatus.Text := 'Unable to open the runtime-pack folder.'
  else
    lblStatus.Text := 'Runtime language pack selected in File Explorer.';
end;

procedure TfrmTranslationStudio.lstValidationIssuesDblClick(Sender: TObject);
var
  EntryIndex: Integer;
  Issue: TValidationIssue;
  BatchIssue: TBatchValidationIssueInfo;
  TargetIndex: Integer;
begin
  if FBatchReady then
  begin
    if (lstValidationLanguages.ItemIndex < 0) or
       (lstValidationLanguages.ItemIndex >= Length(FBatchValidationOrder)) then
      Exit;
    TargetIndex := FBatchValidationOrder[lstValidationLanguages.ItemIndex];
    if (lstValidationIssues.ItemIndex < 0) or
       (lstValidationIssues.ItemIndex >= Length(FBatchValidationIssues[TargetIndex])) then
      Exit;
    BatchIssue := FBatchValidationIssues[TargetIndex][lstValidationIssues.ItemIndex];
    try
      OpenBatchCatalog(TargetIndex);
      FEditingValidationIssue := True;
      if BatchIssue.EntryKey = '' then
      begin
        FCatalogToolsPageVisible := True;
        CatalogToolsTabs.TabIndex := 0;
      end;
      SetWorkflowStep(3);
      if BatchIssue.EntryKey <> '' then
        for EntryIndex := 0 to FTranslationCatalog.Entries.Count - 1 do
          if SameText(FTranslationCatalog.Entries[EntryIndex].Key,
            BatchIssue.EntryKey) then
          begin
            lstCatalogEntries.ItemIndex := EntryIndex;
            lstCatalogEntriesChange(Sender);
            Break;
          end;
      lblStatus.Text := BatchIssue.MessageText +
        '  Save the correction, then choose Back to validation.';
    except
      on E: Exception do
        lblStatus.Text := 'Unable to open language: ' + E.Message;
    end;
    Exit;
  end;
  if (FValidationResult = nil) or (FTranslationCatalog = nil) or
     (lstValidationIssues.ItemIndex < 0) or
     (lstValidationIssues.ItemIndex >= FValidationResult.Issues.Count) then
    Exit;
  Issue := FValidationResult.Issues[lstValidationIssues.ItemIndex];
  if Issue.EntryKey = '' then
  begin
    lblStatus.Text :=
      'This message concerns the catalog settings at the top of Translate.';
    SetWorkflowStep(3);
    Exit;
  end;
  for EntryIndex := 0 to FTranslationCatalog.Entries.Count - 1 do
    if SameText(FTranslationCatalog.Entries[EntryIndex].Key,
      Issue.EntryKey) then
    begin
      SetWorkflowStep(3);
      lstCatalogEntries.ItemIndex := EntryIndex;
      lblStatus.Text := 'Opened ' + Issue.EntryKey + ': ' + Issue.MessageText;
      Exit;
    end;
  lblStatus.Text := 'The referenced catalog entry is no longer present.';
end;

procedure TfrmTranslationStudio.lstValidationLanguagesChange(Sender: TObject);
begin
  if FBatchReady then
    DisplayBatchValidationIssues;
end;

procedure TfrmTranslationStudio.lstValidationIssuesChange(Sender: TObject);
var
  BatchIndex: Integer;
  IssueInfo: TBatchValidationIssueInfo;
  IssueIndex: Integer;
begin
  IssueIndex := lstValidationIssues.ItemIndex;
  if IssueIndex < 0 then
  begin
    memValidationIssueDetail.Text := 'Select an issue to see what needs correction.';
    Exit;
  end;
  if FBatchReady then
  begin
    if (lstValidationLanguages.ItemIndex < 0) or
       (lstValidationLanguages.ItemIndex >= Length(FBatchValidationOrder)) then
      Exit;
    BatchIndex := FBatchValidationOrder[lstValidationLanguages.ItemIndex];
    if IssueIndex < Length(FBatchValidationIssues[BatchIndex]) then
    begin
      IssueInfo := FBatchValidationIssues[BatchIndex][IssueIndex];
      memValidationIssueDetail.Text := IssueInfo.MessageText;
      if IssueInfo.SourceText <> '' then
        memValidationIssueDetail.Text := IssueInfo.MessageText + sLineBreak +
          'Original: ' + IssueInfo.SourceText + sLineBreak +
          'Translation: ' + IssueInfo.TranslatedText + sLineBreak +
          'The numbered markers must refer to the same runtime values as the original.';
    end;
  end
  else if (FValidationResult <> nil) and
          (IssueIndex < FValidationResult.Issues.Count) then
    memValidationIssueDetail.Text :=
      FValidationResult.Issues[IssueIndex].MessageText;
end;

procedure TfrmTranslationStudio.InvalidateValidation;
begin
  FBatchValidated := False;
  FBatchReadyToExport := False;
  FreeAndNil(FValidationResult);
  if not FBatchReady then
    DisplayValidationResult;
  lblExportPathValue.Text := 'Output path will appear here.';
end;

procedure TfrmTranslationStudio.ResetCatalog;
begin
  FDisplayedEntryIndex := -1;
  FTranslationEditorDirty := False;
  FreeAndNil(FValidationResult);
  FreeAndNil(FTranslationCatalog);
  FAddLanguagesPageVisible := False;
  FBatchReady := False;
  FBatchValidated := False;
  FBatchReadyToExport := False;
  FBatchReviewComplete := False;
  FEditingValidationIssue := False;
  SetLength(FBatchValidationIssues, 0);
  SetLength(FBatchValidationErrors, 0);
  SetLength(FBatchValidationWarnings, 0);
  SetLength(FBatchValidationOrder, 0);
  FCatalogToolsPageVisible := False;
  FBatchReviewIndex := -1;
  SetLength(FBatchTargets, 0);
  SetLength(FBatchExportedTargets, 0);
  FCatalogFileName := '';
  cboSourceLanguage.ItemIndex := -1;
  FProjectSourceUpdating := True;
  try
    cboProjectSourceLanguage.ItemIndex := -1;
  finally
    FProjectSourceUpdating := False;
  end;
  cboTargetLanguage.ItemIndex := -1;
  edtNativeLanguageName.Text := '';
  cboTextDirection.ItemIndex := 0;
  edtShortDateFormat.Text := '';
  edtLongDateFormat.Text := '';
  edtShortTimeFormat.Text := '';
  edtLongTimeFormat.Text := '';
  edtDecimalSeparator.Text := '';
  edtThousandSeparator.Text := '';
  edtCurrencySymbol.Text := '';
  lblCatalogPathValue.Text := 'Catalog has not been saved.';
  lblCatalogState.Text := 'Catalog has not been saved';
  lstCatalogEntries.Items.Clear;
  memSourceText.Text := '';
  memTranslatedText.Text := '';
  lblRuntimeApplicationValue.Text := 'Runtime: select an entry';
  lblTranslationContextValue.Text := 'Context: select an entry';
  lblTranslationContextValue.Hint :=
    'Select an entry to see its inferred translation context.';
  chkRuntimeWiringConfirmed.IsChecked := False;
  chkRuntimeWiringConfirmed.Enabled := False;
  chkRuntimeWiringConfirmed.Visible := False;
  cboTranslationSuggestions.Items.Clear;
  btnAcceptSuggestion.Enabled := False;
  lblTranslationSuggestion.Visible := False;
  cboTranslationSuggestions.Visible := False;
  btnAcceptSuggestion.Visible := False;
  btnMarkTranslationReviewed.Enabled := False;
  btnApproveTranslation.Enabled := False;
  UpdateCatalogReadiness;
  DisplayValidationResult;
  UpdateGlossaryActions;
end;

procedure TfrmTranslationStudio.SetWorkflowStep(const AStep: Integer);
const
  InactiveColor: TAlphaColor = $FFD7E8FF;
  ActiveColor: TAlphaColor = $FFFFFFFF;
var
  ReadyCount: Integer;
  TargetIndex: Integer;
begin
  if FIntroScreen then
  begin
    StatusCard.Height := 40;
    NavigationCard.Visible := False;
    IntroCard.Visible := not FRecoveryScreen;
    RecoveryCard.Visible := FRecoveryScreen;
    ProjectCard.Visible := False;
    ProjectDetailsCard.Visible := False;
    LanguagePageCard.Visible := False;
    CatalogToolsCard.Visible := False;
    AddLanguagesPageCard.Visible := False;
    BatchReviewCompleteCard.Visible := False;
    GlossaryPageCard.Visible := False;
    ValidationPageCard.Visible := False;
    ExportPageCard.Visible := False;
    IntegrationPageCard.Visible := False;
    SettingsPageCard.Visible := False;
    NavigationSelection.Visible := False;
    btnWorkflowBack.Visible := False;
    btnWorkflowNext.Visible := False;
    btnMaintenanceCancel.Visible := False;
    if FRecoveryScreen then
      lblStatus.Text := 'Choose a Studio safety backup and an empty folder to restore into.'
    else
      lblStatus.Text := 'Choose Setup Wizard for a new project or Maintenance Studio for existing work.';
    Exit;
  end;
  FWorkflowStep := AStep;
  StatusCard.Height := 90;
  NavigationCard.Visible := True;
  AddLanguagesNavigationCard.Visible := FBatchReady and
    (FScanResult <> nil) and not FAddLanguagesPageVisible;
  btnSidebarAddLanguages.Enabled :=
    AddLanguagesNavigationCard.Visible and
    (FScanResult <> nil) and not FProviderOperationInProgress;
  if btnSidebarAddLanguages.Enabled then
    lblAddLanguagesNavigationHint.Text := 'Keep adding and exporting languages'
  else
    lblAddLanguagesNavigationHint.Text := 'Scan a project first';
  IntroCard.Visible := False;
  RecoveryCard.Visible := False;
  NavigationSelection.Visible := True;
  btnWorkflowBack.Visible := True;
  btnWorkflowBack.Text := 'Back';
  btnWorkflowNext.Visible := True;
  btnMaintenanceCancel.Visible := True;
  lblNavigationProject.TextSettings.FontColor := InactiveColor;
  lblNavigationScan.TextSettings.FontColor := InactiveColor;
  lblNavigationLanguages.TextSettings.FontColor := InactiveColor;
  lblNavigationGlossary.TextSettings.FontColor := InactiveColor;
  lblNavigationValidation.TextSettings.FontColor := InactiveColor;
  lblNavigationExport.TextSettings.FontColor := InactiveColor;
  lblNavigationIntegration.TextSettings.FontColor := InactiveColor;
  lblNavigationSettings.TextSettings.FontColor := InactiveColor;

  ProjectCard.Visible := AStep in [1, 2];
  ProjectDetailsCard.Visible := AStep in [1, 2];
  btnScanProject.Visible := AStep = 2;
  btnContinueToLanguages.Visible := False;
  btnContinueToLanguages.Enabled := FScanResult <> nil;
  LanguagePageCard.Visible := (AStep = 3) and
    not FAddLanguagesPageVisible and not FBatchReviewComplete and
    not FCatalogToolsPageVisible;
  CatalogToolsCard.Visible := (AStep = 3) and
    not FAddLanguagesPageVisible and not FBatchReviewComplete and
    FCatalogToolsPageVisible;
  AddLanguagesPageCard.Visible := (AStep = 3) and
    FAddLanguagesPageVisible;
  BatchReviewCompleteCard.Visible := (AStep = 3) and
    not FAddLanguagesPageVisible and FBatchReviewComplete;
  lblBatchReviewProgress.Visible := LanguagePageCard.Visible;
  if FBatchReady and LanguagePageCard.Visible then
    lblLanguagePageTitle.Text := 'Review language translations'
  else
  begin
    lblLanguagePageTitle.Text := 'Languages and automatic translation';
    lblBatchReviewProgress.Text :=
      'Select an entry to review its translation. Optional settings are under Details & Tools.';
  end;
  GlossaryPageCard.Visible := AStep = 4;
  ValidationPageCard.Visible := AStep = 5;
  ExportPageCard.Visible := AStep = 6;
  IntegrationPageCard.Visible := AStep = 7;
  SettingsPageCard.Visible := AStep = 8;
  btnExportValidatedLanguages.Visible := True;
  btnValidationReviewLanguages.Visible := False;
  btnValidationFinishWithoutExport.Visible := False;
  btnValidateCatalog.Text := IfThen(FBatchReady,
    'Validate All Languages', 'Run Validation');
  UpdateBatchReviewControls;
  btnSettingsContinueLanguages.Visible := False;

  case AStep of
    1:
      begin
        NavigationSelection.Position.Y := 68;
        lblNavigationProject.TextSettings.FontColor := ActiveColor;
        lblProjectCardTitle.Text := 'Open a Delphi application';
        lblProjectCardDescription.Text :=
          'Select a .dproj or .dpr file. The Studio reads its project details without changing it.';
        lblStatus.Text :=
          'Project: open a Delphi project and confirm the language written in its saved files.';
      end;
    2:
      begin
        NavigationSelection.Position.Y := 113;
        lblNavigationScan.TextSettings.FontColor := ActiveColor;
        lblProjectCardTitle.Text := 'Scan the saved Delphi project';
        lblProjectCardDescription.Text :=
          'Choose the app''s current language, then click Scan Project. Choose languages to add after scanning.';
        lblStatus.Text :=
          'Scan: choose the saved-text language and scan; then continue to Languages.';
      end;
    3:
      begin
        NavigationSelection.Position.Y := 158;
        lblNavigationLanguages.TextSettings.FontColor := ActiveColor;
        if FAddLanguagesPageVisible then
        begin
          AddLanguagesPageCard.BringToFront;
          UpdateAddLanguagesSelection;
          lblStatus.Text :=
            'Add Languages: select several targets for one saved-project source language.';
        end
        else if FCatalogToolsPageVisible then
        begin
          CatalogToolsCard.BringToFront;
          lblStatus.Text :=
            'Catalog tools: locale formats, selected-entry details, provider actions, CSV, and bulk review.';
        end
        else if FBatchReviewComplete then
        begin
          BatchReviewCompleteCard.BringToFront;
          lblBatchReviewCompleteSummary.Text := Format(
            '%d language catalogs saved; %d included in the last successful export. ' +
            'Add more languages, review saved work, validate for export, or finish for now.',
            [Length(FBatchTargets), Length(FBatchExportedTargets)]);
          lblStatus.Text :=
            'Review complete. Your drafts are saved; export is optional.';
        end
        else
        begin
          LanguagePageCard.BringToFront;
          if (FCatalogFileName <> '') and TFile.Exists(FCatalogFileName) then
            lblCatalogState.Text := 'Catalog saved  -  Open folder'
          else
            lblCatalogState.Text := 'Catalog has not been saved';
          lblStatus.Text :=
            'Review each entry here. Open Details & Tools for optional settings and catalog actions.';
        end;
      end;
    4:
      begin
        NavigationSelection.Position.Y := 203;
        lblNavigationGlossary.TextSettings.FontColor := ActiveColor;
        GlossaryPageCard.BringToFront;
        if (Trim(FProjectProfile.ProjectName) <> '') and
           (SelectedLanguageCode(cboGlossaryLanguage) = '') and
           (SelectedLanguageCode(cboTargetLanguage) <> '') then
        begin
          FUpdatingGlossaryLanguage := True;
          try
            SelectLanguageCode(cboGlossaryLanguage,
              SelectedLanguageCode(cboTargetLanguage));
          finally
            FUpdatingGlossaryLanguage := False;
          end;
          LoadSelectedGlossary;
        end;
        if Trim(FProjectProfile.ProjectName) = '' then
          lblStatus.Text := 'Glossary: open a Delphi project first.'
        else if SelectedLanguageCode(cboGlossaryLanguage) = '' then
          lblStatus.Text :=
            'Glossary: select a target language to create or open its terms.'
        else
          lblStatus.Text :=
            'Glossary: create, correct, save, and apply project terminology without the Wizard.';
      end;
    5:
      begin
        NavigationSelection.Position.Y := 248;
        lblNavigationValidation.TextSettings.FontColor := ActiveColor;
        ValidationPageCard.BringToFront;
        btnExportValidatedLanguages.Visible := True;
        btnExportValidatedLanguages.Enabled := FBatchReadyToExport or
          ((not FBatchReady) and (FValidationResult <> nil) and
           not FValidationResult.HasErrors);
        if FBatchReady then
          btnExportValidatedLanguages.Text := 'Review deployment'
        else
          btnExportValidatedLanguages.Text := 'Export language pack';
        btnValidateCatalog.Visible := True;
        btnValidationReviewLanguages.Visible := FBatchReady or
          (FTranslationCatalog <> nil);
        if FBatchReady then
          btnValidationReviewLanguages.Text := 'Open selected issue'
        else
          btnValidationReviewLanguages.Text := 'Correct translations';
        btnValidationFinishWithoutExport.Visible := True;
        if FBatchReady then
          lblStatus.Text :=
            'Validate selected languages when ready. Export is a separate, optional action.'
        else
          lblStatus.Text :=
            'Validation is optional until export. Errors block export; warnings request review.';
      end;
    6:
      begin
        NavigationSelection.Position.Y := 293;
        lblNavigationExport.TextSettings.FontColor := ActiveColor;
        ExportPageCard.BringToFront;
        if FBatchReady then
        begin
          ReadyCount := 0;
          for TargetIndex := 0 to High(FBatchTargets) do
            if (TargetIndex < Length(FBatchValidationErrors)) and
               (FBatchValidationErrors[TargetIndex] = 0) then
              Inc(ReadyCount);
          lblExportSummary.Text := Format(
            '%d validated target language(s) ready for deployment.',
            [ReadyCount]);
          if Length(FBatchExportedTargets) = 0 then
            lblExportPathValue.Text :=
              'Review the destination list below before exporting.';
          UpdateDeploymentPreview;
          lblStatus.Text := 'Review the ready languages and every destination, ' +
            'then choose Export and deploy.';
        end
        else
          lblStatus.Text :=
            'Export: create the compact JSON runtime language pack after validation passes.';
      end;
    7:
      begin
        NavigationSelection.Position.Y := 338;
        lblNavigationIntegration.TextSettings.FontColor := ActiveColor;
        IntegrationPageCard.BringToFront;
        lblStatus.Text :=
          'Integration: prepare the managed dependency, temporary build path, and direct pack deployment without rewriting project files.';
      end;
    8:
      begin
        NavigationSelection.Position.Y := 383;
        lblNavigationSettings.TextSettings.FontColor := ActiveColor;
        SettingsPageCard.BringToFront;
        UpdateCredentialStatus;
        lblStatus.Text :=
          'Provider Settings: securely configure and test Google Cloud or DeepL.';
      end;
  end;
  case AStep of
    1:
      begin
        btnWorkflowNext.Text := 'Next: Scan';
        btnWorkflowNext.Enabled := FProjectProfile.ProjectFileName <> '';
      end;
    2:
      begin
        if FBatchReady then
          btnWorkflowNext.Text := 'Resume language work'
        else
          btnWorkflowNext.Text := 'Next: Languages';
        btnWorkflowNext.Enabled := FScanResult <> nil;
      end;
    3:
      begin
        if FEditingValidationIssue then
        begin
          btnWorkflowNext.Text := 'Save & validate again';
          btnWorkflowNext.Enabled := True;
          btnWorkflowBack.Text := 'Back to validation';
        end
        else if FCatalogToolsPageVisible then
        begin
          btnWorkflowNext.Text := 'Save & back';
          btnWorkflowNext.Enabled := True;
        end
        else if FAddLanguagesPageVisible then
        begin
          btnWorkflowNext.Text := 'Next: Review';
          btnWorkflowNext.Enabled := FBatchReady;
        end
        else if FBatchReviewComplete then
        begin
          btnWorkflowNext.Visible := False;
          btnWorkflowBack.Visible := False;
          btnMaintenanceCancel.Visible := False;
          StatusCard.Height := 40;
        end
        else if FBatchReady then
        begin
          if FBatchReviewIndex < High(FBatchTargets) then
            btnWorkflowNext.Text := 'Save & next'
          else
            btnWorkflowNext.Text := 'Finish review';
          btnWorkflowNext.Enabled := FBatchReviewIndex >= 0;
        end
        else
        begin
          btnWorkflowNext.Text := 'Save & validate';
          btnWorkflowNext.Enabled :=
            (FTranslationCatalog <> nil) and
            (SelectedLanguageCode(cboTargetLanguage) <> '');
        end;
      end;
    4:
      begin
        btnWorkflowNext.Text := 'Next: Validate';
        btnWorkflowNext.Enabled := FProjectProfile.ProjectFileName <> '';
      end;
    5:
      begin
        btnWorkflowNext.Visible := False;
        btnMaintenanceCancel.Visible := False;
      end;
    6:
      begin
        btnWorkflowNext.Text := 'Next: Integration';
        btnWorkflowNext.Enabled :=
          (not FBatchReady) and TFile.Exists(Trim(lblExportPathValue.Text));
      end;
    7:
      begin
        btnWorkflowNext.Text := 'Finish';
        btnWorkflowNext.Enabled := True;
      end;
    8:
      begin
        if FAddLanguagesPageVisible then
          btnWorkflowNext.Text := 'Next: Languages'
        else
          btnWorkflowNext.Text := 'Finish';
        btnWorkflowNext.Enabled := True;
      end;
  end;
  if not ((AStep = 3) and FBatchReviewComplete and
    not FAddLanguagesPageVisible) then
    StatusCard.Height := 90;
  StatusCard.BringToFront;
end;

procedure TfrmTranslationStudio.UpdateCatalogFromLanguageEditors;
var
  LocaleSettings: TFormatSettings;
begin
  if FTranslationCatalog = nil then
    raise Exception.Create(
      'Scan the project or open an existing catalog first.');
  if SelectedLanguageCode(cboTargetLanguage) = '' then
    raise Exception.Create('Select a target language.');
  if SelectedLanguageCode(cboSourceLanguage) = '' then
    raise Exception.Create('Select the language used in the saved Delphi project.');
  if SameText(SelectedLanguageCode(cboSourceLanguage),
    SelectedLanguageCode(cboTargetLanguage)) then
    raise Exception.Create('Choose different source and target languages.');
  if (Trim(FTranslationCatalog.SourceLanguage) <> '') and
    not SameText(FTranslationCatalog.SourceLanguage,
      SelectedLanguageCode(cboSourceLanguage)) then
    raise Exception.Create('The open catalog has a different source language. Open a matching catalog or begin a new translation.');
  if Trim(edtNativeLanguageName.Text) = '' then
    raise Exception.Create('Enter the language name in its native form.');

  LocaleSettings := TFormatSettings.Create(
    SelectedLanguageCode(cboTargetLanguage));
  if edtShortDateFormat.Text = '' then
    edtShortDateFormat.Text := LocaleSettings.ShortDateFormat;
  if edtLongDateFormat.Text = '' then
    edtLongDateFormat.Text := LocaleSettings.LongDateFormat;
  if edtShortTimeFormat.Text = '' then
    edtShortTimeFormat.Text := LocaleSettings.ShortTimeFormat;
  if edtLongTimeFormat.Text = '' then
    edtLongTimeFormat.Text := LocaleSettings.LongTimeFormat;
  if edtDecimalSeparator.Text = '' then
    edtDecimalSeparator.Text := LocaleSettings.DecimalSeparator;
  if edtThousandSeparator.Text = '' then
    edtThousandSeparator.Text := LocaleSettings.ThousandSeparator;
  if edtCurrencySymbol.Text = '' then
    edtCurrencySymbol.Text := LocaleSettings.CurrencyString;

  FTranslationCatalog.SourceLanguage :=
    SelectedLanguageCode(cboSourceLanguage);
  FTranslationCatalog.Locale.LanguageCode :=
    SelectedLanguageCode(cboTargetLanguage);
  FTranslationCatalog.Locale.NativeLanguageName :=
    Trim(edtNativeLanguageName.Text);
  if cboTextDirection.ItemIndex = 1 then
    FTranslationCatalog.Locale.TextDirection := 'rtl'
  else
    FTranslationCatalog.Locale.TextDirection := 'ltr';
  FTranslationCatalog.Locale.ShortDateFormat :=
    edtShortDateFormat.Text;
  FTranslationCatalog.Locale.LongDateFormat :=
    edtLongDateFormat.Text;
  FTranslationCatalog.Locale.ShortTimeFormat :=
    edtShortTimeFormat.Text;
  FTranslationCatalog.Locale.LongTimeFormat :=
    edtLongTimeFormat.Text;
  FTranslationCatalog.Locale.DecimalSeparator :=
    edtDecimalSeparator.Text;
  FTranslationCatalog.Locale.ThousandSeparator :=
    edtThousandSeparator.Text;
  FTranslationCatalog.Locale.CurrencySymbol :=
    edtCurrencySymbol.Text;
end;

procedure TfrmTranslationStudio.SaveCatalog;
var
  Changed: Boolean;
  SerializedCatalog: string;
begin
  CommitDisplayedTranslation;
  UpdateCatalogFromLanguageEditors;
  if FCatalogFileName = '' then
    FCatalogFileName :=
      TTranslationWorkspace.DevelopmentCatalogFileName(FProjectProfile,
        FTranslationCatalog.Locale.LanguageCode,
        FTranslationCatalog.SourceLanguage);
  SerializedCatalog := TCatalogJson.Serialize(FTranslationCatalog);
  Changed := not TFile.Exists(FCatalogFileName) or
    (TFile.ReadAllText(FCatalogFileName, TEncoding.UTF8) <>
      SerializedCatalog);
  if Changed then
  begin
    TCatalogJson.SaveToFile(FTranslationCatalog, FCatalogFileName);
    InvalidateValidation;
  end;
  FTranslationEditorDirty := False;
  lblCatalogPathValue.Text := FCatalogFileName;
  lblCatalogState.Text := 'Catalog saved  -  Open folder';
  lblStatus.Text := 'Development catalog saved.';
end;

procedure TfrmTranslationStudio.RunCatalogValidation;
begin
  UpdateCatalogFromLanguageEditors;
  FreeAndNil(FValidationResult);
  FValidationResult := TCatalogValidator.Validate(FTranslationCatalog);
  DisplayValidationResult;
end;

procedure TfrmTranslationStudio.btnOpenProjectClick(Sender: TObject);
begin
  if not dlgOpenProject.Execute then
    Exit;
  if not ConfirmGlossaryChanges then
    Exit;
  if FTranslationEditorDirty and (FCatalogFileName <> '') then
    try
      SaveCatalog;
    except
      on E: Exception do
      begin
        lblStatus.Text := 'Save the current translation before opening another project: ' +
          E.Message;
        Exit;
      end;
    end;

  try
    DisplayProjectSummary(TProjectDetector.Detect(dlgOpenProject.FileName));
  except
    on E: Exception do
    begin
      ClearProjectSummary;
      lblStatus.Text := E.Message;
    end;
  end;
end;

procedure TfrmTranslationStudio.btnScanProjectClick(Sender: TObject);
var
  Profile: TProjectProfile;
  SourceLanguage: string;
begin
  if FScanInProgress then
    Exit;
  if FTranslationEditorDirty and (FCatalogFileName <> '') then
    try
      SaveCatalog;
    except
      on E: Exception do
      begin
        lblStatus.Text := 'Save the edited translation before scanning: ' +
          E.Message;
        Exit;
      end;
    end;
  if SelectedLanguageCode(cboProjectSourceLanguage) = '' then
  begin
    SetWorkflowStep(2);
    TDialogServiceSync.MessageDialog(
      'Choose the language written in the saved Delphi project, then click Scan Project. The Studio will not guess this language from a project name.',
      TMsgDlgType.mtInformation, [TMsgDlgBtn.mbOK],
      TMsgDlgBtn.mbOK, 0);
    cboProjectSourceLanguage.SetFocus;
    lblStatus.Text := 'Choose the saved-project language, then click Scan Project.';
    Exit;
  end;
  SetWorkflowStep(2);
  btnScanProject.Enabled := False;
  lblStatus.Text := 'Scanning project text resources...';
  FScanInProgress := True;
  FCloseAfterScan := False;
  TInterlocked.Exchange(FScanCancelRequested, 0);
  ShowOperation('Scanning project',
    'Discovering forms and source files...', True);
  Profile := FProjectProfile;
  SourceLanguage := SelectedLanguageCode(cboSourceLanguage);
  TThread.CreateAnonymousThread(
    procedure
    var
      ErrorText: string;
      MergeSummary: TCatalogMergeSummary;
      NewScanResult: TProjectScanResult;
      RawScanCount: Integer;
      RecoveredSemanticCount: Integer;
    begin
      ErrorText := '';
      NewScanResult := nil;
      try
        NewScanResult := TProjectScanner.Scan(Profile,
          function: Boolean
          begin
            Result := TInterlocked.CompareExchange(
              FScanCancelRequested, 0, 0) <> 0;
          end,
          procedure(const AStage: string; const AFilesCompleted: Integer)
          begin
            TThread.Queue(nil,
              procedure
              begin
                if not (csDestroying in ComponentState) then
                  lblOperationProgress.Text := Format(
                    'Scanning %s: %d file(s) completed...',
                    [AStage, AFilesCompleted]);
              end);
          end, SourceLanguage);
      except
        on E: Exception do
          ErrorText := E.Message;
      end;
      TThread.Queue(nil,
        procedure
        begin
          try
            if ErrorText <> '' then
            begin
              NewScanResult.Free;
              if TInterlocked.CompareExchange(
                FScanCancelRequested, 0, 0) <> 0 then
                lblStatus.Text := 'Project scan cancelled.'
              else
                lblStatus.Text := 'Scan failed: ' + ErrorText;
            end
            else
            begin
              FreeAndNil(FScanResult);
              FScanResult := NewScanResult;
              NewScanResult := nil;
              FLastScanCompletedAt := Now;
              RawScanCount := FScanResult.Items.Count;
              if FTranslationCatalog = nil then
              begin
                FTranslationCatalog := TTranslationCatalog.Create;
                FTranslationCatalog.ApplicationId := FProjectProfile.ProjectName;
                FTranslationCatalog.Framework := FProjectProfile.Framework;
                FTranslationCatalog.SourceLanguage :=
                  SelectedLanguageCode(cboSourceLanguage);
              end;
              if not SameText(FTranslationCatalog.SourceLanguage,
                SelectedLanguageCode(cboSourceLanguage)) then
                raise EInvalidOpException.Create(
                  'The open catalog has a different source language. Open a matching catalog or begin a new translation.');
              RecoveredSemanticCount :=
                TScanCatalogMerger.RecoverWorkspaceSemanticContracts(
                TTranslationWorkspace.DevelopmentDirectory(FProjectProfile),
                FProjectProfile.ProjectName,
                SelectedLanguageCode(cboSourceLanguage),
                FProjectProfile.Framework, FScanResult);
              MergeSummary := TScanCatalogMerger.Merge(FScanResult,
                FTranslationCatalog);
              DisplayScanResult(FScanResult, RawScanCount,
                RecoveredSemanticCount, MergeSummary.DuplicateScanKeys);
              DisplayCatalogEntries;
              InvalidateValidation;
               RestoreBatchSession;
               cboProjectSourceLanguage.Enabled := False;
               btnContinueToLanguages.Enabled := True;
               if FBatchReady then
               begin
                 FBatchReviewComplete := True;
                 FAddLanguagesPageVisible := False;
               end
               else
                 FAddLanguagesPageVisible := True;
               SetWorkflowStep(3);
              lblStatus.Text := Format(
                'Scan complete: %d new, %d changed, %d unchanged, %d obsolete, %d equivalent duplicate occurrence(s) collapsed.',
                [MergeSummary.NewEntries, MergeSummary.ChangedEntries,
                  MergeSummary.UnchangedEntries, MergeSummary.ObsoleteEntries,
                  MergeSummary.DuplicateScanKeys]);
               if FBatchReady then
                 lblStatus.Text := lblStatus.Text + Format(
                   ' %d saved languages are ready. Review, validate/export, or add more.',
                   [Length(FBatchTargets)])
               else
                 lblStatus.Text := lblStatus.Text +
                   ' Select one or more target languages to begin.';
              if FOpenAddLanguagesAfterWizardScan then
              begin
                FOpenAddLanguagesAfterWizardScan := False;
                btnShowAddLanguagesClick(nil);
              end;
            end;
          except
            on E: Exception do
            begin
              FOpenAddLanguagesAfterWizardScan := False;
              lblStatus.Text := 'Scan failed: ' + E.Message;
            end;
          end;
          FScanInProgress := False;
          if ErrorText <> '' then
            FOpenAddLanguagesAfterWizardScan := False;
          btnScanProject.Enabled := FProjectProfile.Framework <> tfUnknown;
          HideOperation;
          if FCloseAfterScan then
          begin
            FCloseAfterScan := False;
            Close;
          end;
        end);
    end).Start;
end;

procedure TfrmTranslationStudio.lblNavigationProjectClick(Sender: TObject);
begin
  SetWorkflowStep(1);
end;

procedure TfrmTranslationStudio.lblNavigationScanClick(Sender: TObject);
begin
  SetWorkflowStep(2);
end;

procedure TfrmTranslationStudio.lblNavigationLanguagesClick(Sender: TObject);
begin
  if FCatalogToolsPageVisible then
    btnBackToReviewClick(Sender)
  else if FBatchReady and FBatchReviewComplete and
    not FAddLanguagesPageVisible then
    SetWorkflowStep(3)
  else if FBatchReady and FAddLanguagesPageVisible then
  begin
    try
      OpenBatchCatalog(0);
    except
      on E: Exception do
        lblStatus.Text := 'Unable to open translation review: ' + E.Message;
    end;
  end
  else
    SetWorkflowStep(3);
end;

procedure TfrmTranslationStudio.UpdateAddLanguagesSelection;
var
  CodeStart: Integer;
  Index: Integer;
  SelectedCount: Integer;
  SourceLanguage: string;
  TargetLanguage: string;
begin
  SourceLanguage := SelectedLanguageCode(cboSourceLanguage);
  if SourceLanguage = '' then
    lblAddLanguagesSource.Text :=
      'Source language: choose it on the Project page first.'
  else
    lblAddLanguagesSource.Text := 'Source language: ' + SourceLanguage +
      ' (saved Delphi project text; change it on the Project page before scanning)';
  SelectedCount := 0;
  for Index := 0 to lstAddLanguageTargets.Count - 1 do
  begin
    CodeStart := LastDelimiter('[', lstAddLanguageTargets.Items[Index]);
    TargetLanguage := Copy(lstAddLanguageTargets.Items[Index],
      CodeStart + 1, Length(lstAddLanguageTargets.Items[Index]) -
      CodeStart - 1);
    if SameText(TProviderLanguageCodes.Google(SourceLanguage),
      TProviderLanguageCodes.Google(TargetLanguage)) or
      MatchText(TargetLanguage, FBatchTargets) then
    begin
      if lstAddLanguageTargets.ItemByIndex(Index).IsSelected then
        lstAddLanguageTargets.ItemByIndex(Index).IsSelected := False;
      lstAddLanguageTargets.ItemByIndex(Index).Enabled := False;
    end
    else
    begin
      lstAddLanguageTargets.ItemByIndex(Index).Enabled := True;
      if lstAddLanguageTargets.ItemByIndex(Index).IsSelected then
        Inc(SelectedCount);
    end;
  end;
  lblAddLanguagesSelection.Text := Format(
    '%d new language(s) selected; %d already saved. Existing languages are ' +
    'unavailable here and stay in the next export. Provider requests may incur charges.',
    [SelectedCount, Length(FBatchTargets)]);
  btnRunAddLanguages.Enabled := (SelectedCount > 0) and
    (SourceLanguage <> '') and
    (FProjectProfile.ProjectFileName <> '') and
    not FProviderOperationInProgress;
end;

procedure TfrmTranslationStudio.btnShowAddLanguagesClick(Sender: TObject);
var
  Index: Integer;
begin
  if (FProjectProfile.ProjectFileName = '') or (FScanResult = nil) then
  begin
    lblStatus.Text := 'Open and scan a saved Delphi project before adding languages.';
    Exit;
  end;
  if SelectedLanguageCode(cboSourceLanguage) = '' then
  begin
    lblStatus.Text := 'Choose the language of the saved Delphi project first.';
    Exit;
  end;
  try
    if (FTranslationCatalog <> nil) and (FCatalogFileName <> '') and
       (SelectedLanguageCode(cboTargetLanguage) <> '') then
      SaveCatalog;
  except
    on E: Exception do
    begin
      lblStatus.Text := 'Save the current catalog before adding languages: ' + E.Message;
      Exit;
    end;
  end;
  lstAddLanguagesResults.Items.Clear;
  for Index := 0 to lstAddLanguageTargets.Count - 1 do
    lstAddLanguageTargets.ItemByIndex(Index).IsSelected := False;
  FAddLanguagesPageVisible := True;
  FCatalogToolsPageVisible := False;
  UpdateBatchReviewControls;
  SetWorkflowStep(3);
  UpdateAddLanguagesSelection;
end;

procedure TfrmTranslationStudio.btnBackToLanguageEditorClick(Sender: TObject);
begin
  FAddLanguagesPageVisible := False;
  FCatalogToolsPageVisible := False;
  SetWorkflowStep(3);
end;

procedure TfrmTranslationStudio.btnAddLanguagesSelectAllClick(Sender: TObject);
var
  CodeStart: Integer;
  Index: Integer;
  SourceLanguage: string;
  TargetLanguage: string;
begin
  SourceLanguage := SelectedLanguageCode(cboSourceLanguage);
  for Index := 0 to lstAddLanguageTargets.Count - 1 do
  begin
    CodeStart := LastDelimiter('[', lstAddLanguageTargets.Items[Index]);
    TargetLanguage := Copy(lstAddLanguageTargets.Items[Index],
      CodeStart + 1, Length(lstAddLanguageTargets.Items[Index]) -
      CodeStart - 1);
    lstAddLanguageTargets.ItemByIndex(Index).IsSelected :=
      not SameText(TProviderLanguageCodes.Google(SourceLanguage),
        TProviderLanguageCodes.Google(TargetLanguage)) and
      not MatchText(TargetLanguage, FBatchTargets);
  end;
  UpdateAddLanguagesSelection;
end;

procedure TfrmTranslationStudio.btnAddLanguagesClearClick(Sender: TObject);
var
  Index: Integer;
begin
  for Index := 0 to lstAddLanguageTargets.Count - 1 do
    lstAddLanguageTargets.ItemByIndex(Index).IsSelected := False;
  UpdateAddLanguagesSelection;
end;

procedure TfrmTranslationStudio.btnAddLanguageProviderSettingsClick(
  Sender: TObject);
begin
  SetWorkflowStep(8);
  lblStatus.Text :=
    'Choose a provider and save its key, then use Next: Languages.';
end;

procedure TfrmTranslationStudio.btnSettingsContinueLanguagesClick(
  Sender: TObject);
begin
  SetWorkflowStep(3);
  lblStatus.Text := 'Select targets, then choose Translate Selected.';
end;

procedure TfrmTranslationStudio.lstAddLanguageTargetsChange(Sender: TObject);
begin
  UpdateAddLanguagesSelection;
end;

procedure TfrmTranslationStudio.btnRunAddLanguagesClick(Sender: TObject);
var
  ApiKey: string;
  Catalog: TTranslationCatalog;
  CatalogFileName: string;
  CodeStart: Integer;
  Index: Integer;
  Item: TScanItem;
  Pack: TLanguagePackDescriptor;
  Packs: TObjectList<TLanguagePackDescriptor>;
  Provider: TTranslationProvider;
  SourceLanguage: string;
  TargetCode: string;
  Targets: TArray<string>;
  Profile: TProjectProfile;
begin
  if FProviderOperationInProgress then
    Exit;
  Profile := FProjectProfile;
  SourceLanguage := SelectedLanguageCode(cboSourceLanguage);
  if (Profile.ProjectFileName = '') or (SourceLanguage = '') or
     (FScanResult = nil) then
  begin
    lblStatus.Text :=
      'Open a project, confirm its source language, and scan it first.';
    Exit;
  end;
  if not SameText(SourceLanguage,
    SelectedLanguageCode(cboProjectSourceLanguage)) then
  begin
    lblStatus.Text :=
      'The project source and Translate source differ. Return to Project and scan again.';
    Exit;
  end;
  for Item in FScanResult.Items do
    if TFile.Exists(Item.SourceFileName) and
       (TFile.GetLastWriteTime(Item.SourceFileName) > FLastScanCompletedAt) then
    begin
      lblStatus.Text := 'A saved project file changed after scanning. Scan again first.';
      Exit;
    end;
  SetLength(Targets, 0);
  for Index := 0 to lstAddLanguageTargets.Count - 1 do
    if lstAddLanguageTargets.ItemByIndex(Index).IsSelected then
    begin
      CodeStart := LastDelimiter('[', lstAddLanguageTargets.Items[Index]);
      TargetCode := Copy(lstAddLanguageTargets.Items[Index],
        CodeStart + 1, Length(lstAddLanguageTargets.Items[Index]) -
        CodeStart - 1);
      if SameText(SourceLanguage, TargetCode) then
      begin
        lblStatus.Text := 'Source and target must differ. Clear the source selection.';
        Exit;
      end;
      SetLength(Targets, Length(Targets) + 1);
      Targets[High(Targets)] := TargetCode;
    end;
  if Length(Targets) = 0 then
  begin
    lblStatus.Text := 'Select at least one target language.';
    Exit;
  end;
  SaveProviderSettings;
  Provider := SelectedProvider;
  ApiKey := EffectiveApiKey(Provider);
  if ApiKey = '' then
  begin
    SetWorkflowStep(8);
    lblStatus.Text :=
      'Save a provider API key, then use Next: Languages.';
    Exit;
  end;
  for TargetCode in Targets do
  begin
    if SameText(TProviderLanguageCodes.Google(SourceLanguage),
      TProviderLanguageCodes.Google(TargetCode)) then
    begin
      lblStatus.Text := TargetCode +
        ' is a regional variant of the source. Automatic translation for this pair is unavailable; choose another target.';
      Exit;
    end;
    CatalogFileName := TTranslationWorkspace.DevelopmentCatalogFileName(
      Profile, TargetCode, SourceLanguage);
    if TFile.Exists(CatalogFileName) then
    begin
      try
        Catalog := TCatalogJson.LoadFromFile(CatalogFileName);
        try
          if not SameText(Catalog.SourceLanguage, SourceLanguage) or
             not SameText(Catalog.Locale.LanguageCode, TargetCode) then
            raise EInvalidOpException.Create('Catalog pair does not match.');
        finally
          Catalog.Free;
        end;
      except
        on E: Exception do
        begin
          lblStatus.Text := 'Cannot use ' + TargetCode + ': ' + E.Message;
          Exit;
        end;
      end;
    end;
  end;
  Packs := TLanguagePackDiscovery.Discover(
    TTranslationWorkspace.SourceLanguagesDirectory(Profile, SourceLanguage),
    Profile.ProjectName);
  try
    for Pack in Packs do
      if not SameText(Pack.SourceLanguage, SourceLanguage) then
      begin
        lblStatus.Text := 'The source-specific pack folder contains ' +
          Pack.LanguageCode + ' from ' + Pack.SourceLanguage +
          '. Nothing was translated; inspect this folder first.';
        Exit;
      end;
  finally
    Packs.Free;
  end;
  if TDialogServiceSync.MessageDialog(Format(
    'Add %d target language(s) from the saved %s project?' + sLineBreak +
    sLineBreak + 'The project is scanned once. Existing catalogs and reviewed ' +
    'translations are preserved. Unresolved strings are sent to %s and may ' +
    'incur provider charges. Successful draft catalogs remain if a later ' +
    'language fails or you cancel. Machine results still require review.' +
    sLineBreak + sLineBreak + 'Continue?',
    [Length(Targets), SourceLanguage,
     TranslationProviderDisplayName(Provider)]),
    TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
    TMsgDlgBtn.mbNo, 0) <> mrYes then
    Exit;
  lstAddLanguagesResults.Items.Clear;
  btnReviewBatch.Visible := False;
  btnRunAddLanguages.Visible := True;
  FProviderOperationInProgress := True;
  FCloseAfterProviderOperation := False;
  TInterlocked.Exchange(FProviderCancelRequested, 0);
  lblBatchProgress.Text :=
    'Scanning the project. This may take a few minutes.';
  prgBatchProgress.Value := 0;
  btnBatchCancel.Enabled := True;
  lstAddLanguageTargets.Enabled := False;
  btnAddLanguagesSelectAll.Enabled := False;
  btnAddLanguagesClear.Enabled := False;
  btnAddLanguageProviderSettings.Enabled := False;
  btnBackToLanguageEditor.Enabled := False;
  btnRunAddLanguages.Enabled := False;
  StatusCard.Enabled := False;
  NavigationCard.Enabled := False;
  TThread.CreateAnonymousThread(
    procedure
    begin
      ProcessSelectedLanguages(Profile, Targets, SourceLanguage, ApiKey,
        Provider, FProviderSettings);
    end).Start;
end;

procedure TfrmTranslationStudio.SaveBatchSession;
var
  FileName: string;
  Exported: TJSONArray;
  Root: TJSONObject;
  TargetCode: string;
  Targets: TJSONArray;
begin
  if not FBatchReady or (FProjectProfile.ProjectFileName = '') or
     (SelectedLanguageCode(cboProjectSourceLanguage) = '') then
    Exit;
  FileName := TPath.Combine(
    TTranslationWorkspace.DeploymentDirectory(FProjectProfile),
    'batch-session.json');
  Root := TJSONObject.Create;
  try
    Root.AddPair('schemaVersion', TJSONNumber.Create(1));
    Root.AddPair('projectFileName',
      TPath.GetFullPath(FProjectProfile.ProjectFileName));
    Root.AddPair('sourceLanguage',
      SelectedLanguageCode(cboProjectSourceLanguage));
    Root.AddPair('reviewIndex', TJSONNumber.Create(FBatchReviewIndex));
    Root.AddPair('reviewComplete', TJSONBool.Create(FBatchReviewComplete));
    Targets := TJSONArray.Create;
    for TargetCode in FBatchTargets do
      Targets.Add(TargetCode);
    Root.AddPair('targets', Targets);
    Exported := TJSONArray.Create;
    for TargetCode in FBatchExportedTargets do
      Exported.Add(TargetCode);
    Root.AddPair('exportedTargets', Exported);
    TDirectory.CreateDirectory(TPath.GetDirectoryName(FileName));
    TAtomicTextFile.WriteAllText(FileName, Root.Format(2), TEncoding.UTF8);
  finally
    Root.Free;
  end;
end;

procedure TfrmTranslationStudio.RestoreBatchSession;
var
  BeforeMerge: string;
  Catalog: TTranslationCatalog;
  CatalogFileName: string;
  DevelopmentDirectory: string;
  FileName: string;
  Index: Integer;
  MissingCount: Integer;
  Parsed: TJSONValue;
  RecoveredCount: Integer;
  Root: TJSONObject;
  SavedProject: TJSONValue;
  SavedExported: TJSONValue;
  SavedReviewComplete: TJSONValue;
  SavedReviewIndex: TJSONValue;
  SavedSource: TJSONValue;
  SavedTargets: TJSONValue;
  SessionDate: TDateTime;
  SessionNeedsCanonicalSave: Boolean;
  SessionValid: Boolean;
  SourceLanguage: string;
  TargetCode: string;
begin
  if (FProjectProfile.ProjectFileName = '') or
     (SelectedLanguageCode(cboProjectSourceLanguage) = '') then
    Exit;
  SourceLanguage := SelectedLanguageCode(cboProjectSourceLanguage);
  FileName := TPath.Combine(
    TTranslationWorkspace.DeploymentDirectory(FProjectProfile),
    'batch-session.json');
  DevelopmentDirectory := TTranslationWorkspace.DevelopmentDirectory(
    FProjectProfile);
  SessionValid := False;
  SessionNeedsCanonicalSave := False;
  SessionDate := 0;
  MissingCount := 0;
  RecoveredCount := 0;
  Parsed := nil;
  SavedExported := nil;
  try
    try
    if TFile.Exists(FileName) then
    begin
      SessionDate := TFile.GetLastWriteTime(FileName);
      Parsed := TJSONObject.ParseJSONValue(TFile.ReadAllText(FileName,
        TEncoding.UTF8));
      if not (Parsed is TJSONObject) then
        raise EInvalidOpException.Create('The saved session is unreadable.');
      Root := TJSONObject(Parsed);
      SavedProject := Root.GetValue('projectFileName');
      SavedSource := Root.GetValue('sourceLanguage');
      SavedTargets := Root.GetValue('targets');
      SavedExported := Root.GetValue('exportedTargets');
      if (SavedProject = nil) or (SavedSource = nil) or
         not (SavedTargets is TJSONArray) then
        raise EInvalidOpException.Create('The saved session is incomplete.');
      if not SameText(TProjectDetector.Detect(
        SavedProject.Value).ProjectFileName,
        FProjectProfile.ProjectFileName) then
        raise EInvalidOpException.Create(
          'This workspace belongs to another Delphi project.');
      if not SameText(SavedSource.Value, SourceLanguage) then
        raise EInvalidOpException.CreateFmt(
          'Saved languages use %s as their original app language, not %s.',
          [SavedSource.Value, SourceLanguage]);
      SessionValid := True;
      SessionNeedsCanonicalSave := not SameText(SavedProject.Value,
        FProjectProfile.ProjectFileName);
      for Index := 0 to TJSONArray(SavedTargets).Count - 1 do
      begin
        TargetCode := TJSONArray(SavedTargets).Items[Index].Value;
        CatalogFileName := TTranslationWorkspace.DevelopmentCatalogFileName(
          FProjectProfile, TargetCode, SourceLanguage);
        if not TFile.Exists(CatalogFileName) then
        begin
          Inc(MissingCount);
          Continue;
        end;
        SetLength(FBatchTargets, Length(FBatchTargets) + 1);
        FBatchTargets[High(FBatchTargets)] := TargetCode;
      end;
    end;
    { A completed language is saved before its session checkpoint. Recover
      such catalogs without resurrecting older, deliberately unselected work. }
    if TDirectory.Exists(DevelopmentDirectory) then
      for CatalogFileName in TDirectory.GetFiles(DevelopmentDirectory,
        '*.translation-project.json', TSearchOption.soTopDirectoryOnly) do
      begin
        if SessionValid and
           (TFile.GetLastWriteTime(CatalogFileName) <= SessionDate) then
          Continue;
        Catalog := nil;
        try
          try
            Catalog := TCatalogJson.LoadFromFile(CatalogFileName);
            TargetCode := Catalog.Locale.LanguageCode;
            if SameText(Catalog.ApplicationId, FProjectProfile.ProjectName) and
               SameText(Catalog.SourceLanguage, SourceLanguage) and
               (Catalog.Framework = FProjectProfile.Framework) and
               not MatchText(TargetCode, FBatchTargets) and
               SameText(CatalogFileName,
                 TTranslationWorkspace.DevelopmentCatalogFileName(
                   FProjectProfile, TargetCode, SourceLanguage)) then
            begin
              SetLength(FBatchTargets, Length(FBatchTargets) + 1);
              FBatchTargets[High(FBatchTargets)] := TargetCode;
              Inc(RecoveredCount);
            end;
          except
            { A damaged catalog cannot hide the other recoverable languages. }
          end;
        finally
          Catalog.Free;
        end;
      end;
    if SessionValid and (SavedExported is TJSONArray) then
      for Index := 0 to TJSONArray(SavedExported).Count - 1 do
      begin
        TargetCode := TJSONArray(SavedExported).Items[Index].Value;
        if MatchText(TargetCode, FBatchTargets) and
           not MatchText(TargetCode, FBatchExportedTargets) then
        begin
          SetLength(FBatchExportedTargets,
            Length(FBatchExportedTargets) + 1);
          FBatchExportedTargets[High(FBatchExportedTargets)] := TargetCode;
        end;
      end;
    for TargetCode in FBatchTargets do
    begin
      CatalogFileName := TTranslationWorkspace.DevelopmentCatalogFileName(
        FProjectProfile, TargetCode, SourceLanguage);
      Catalog := TCatalogJson.LoadFromFile(CatalogFileName);
      try
        if not SameText(Catalog.SourceLanguage, SourceLanguage) or
           not SameText(Catalog.Locale.LanguageCode, TargetCode) then
          raise EInvalidOpException.Create(
            TargetCode + ' saved catalog has a different language pair.');
        BeforeMerge := TCatalogJson.Serialize(Catalog);
        TScanCatalogMerger.Merge(FScanResult, Catalog);
        if TCatalogJson.Serialize(Catalog) <> BeforeMerge then
          TCatalogJson.SaveToFile(Catalog, CatalogFileName);
      finally
        Catalog.Free;
      end;
    end;
    if Length(FBatchTargets) = 0 then
    begin
      if MissingCount > 0 then
        lblStatus.Text := Format(
          '%d listed catalog(s) are missing; restore them or add new languages.',
          [MissingCount]);
      Exit;
    end;
    FBatchReviewIndex := 0;
    FBatchReviewComplete := not SessionValid;
    if SessionValid then
    begin
      SavedReviewIndex := Root.GetValue('reviewIndex');
      SavedReviewComplete := Root.GetValue('reviewComplete');
      if SavedReviewIndex <> nil then
        FBatchReviewIndex := Max(0, Min(High(FBatchTargets),
          StrToIntDef(SavedReviewIndex.Value, 0)));
      FBatchReviewComplete := (SavedReviewComplete <> nil) and
        SameText(SavedReviewComplete.Value, 'true');
    end;
    FBatchReady := True;
    FBatchValidated := False;
    FBatchReadyToExport := False;
    FAddLanguagesPageVisible := False;
    UpdateBatchReviewControls;
    if (MissingCount = 0) and ((RecoveredCount > 0) or
       not SessionValid or SessionNeedsCanonicalSave) then
      SaveBatchSession;
    lblStatus.Text := Format(
      '%d saved languages ready to resume; %d recovered, %d missing. ' +
      'Choose Continue saved work or Add languages.',
      [Length(FBatchTargets), RecoveredCount, MissingCount]);
  except
    on E: Exception do
    begin
      SetLength(FBatchTargets, 0);
      SetLength(FBatchExportedTargets, 0);
      FBatchReady := False;
      lblStatus.Text := 'Saved language batch needs attention: ' + E.Message;
    end;
    end;
  finally
    Parsed.Free;
  end;
end;

procedure TfrmTranslationStudio.ProcessSelectedLanguages(
  const AProfile: TProjectProfile; const ATargets: TArray<string>;
  const ASourceLanguage, AApiKey: string;
  const AProvider: TTranslationProvider;
  const ASettings: TProviderSettings);
var
  Catalog: TTranslationCatalog;
  CatalogFileName: string;
  Client: TTranslationProviderClient;
  BatchContexts: TArray<string>;
  BatchCount: Integer;
  BatchIndex: Integer;
  BatchOffset: Integer;
  BatchSourceTexts: TArray<string>;
  CompletedCount: Integer;
  Contexts: TArray<string>;
  Entry: TTranslationEntry;
  EntryIndexes: TArray<Integer>;
  ErrorText: string;
  ExistingCount: Integer;
  Glossary: TProjectGlossary;
  GlossaryFileName: string;
  Index: Integer;
  LocaleFacts: TLocaleFacts;
  Memory: TTranslationMemory;
  ProgressText: string;
  ProviderCount: Integer;
  ResolvedText: string;
  ScanCompletedAt: TDateTime;
  ScanItem: TScanItem;
  ScanResult: TProjectScanResult;
  SourceTexts: TArray<string>;
  TargetCode: string;
  TargetIndex: Integer;
  TranslatedTexts: TArray<string>;
begin
  CompletedCount := 0;
  ErrorText := '';
  ScanResult := nil;
  CatalogFileName := '';
  try
    ScanResult := TProjectScanner.Scan(AProfile,
      function: Boolean
      begin
        Result := TInterlocked.CompareExchange(
          FProviderCancelRequested, 0, 0) <> 0;
      end, nil, ASourceLanguage);
    ScanCompletedAt := Now;
    if TInterlocked.CompareExchange(FProviderCancelRequested, 0, 0) <> 0 then
      raise EAbort.Create('Batch cancelled after scanning.');
    TScanCatalogMerger.RecoverWorkspaceSemanticContracts(
      TTranslationWorkspace.DevelopmentDirectory(AProfile),
      AProfile.ProjectName, ASourceLanguage, AProfile.Framework, ScanResult);
    for TargetIndex := 0 to High(ATargets) do
    begin
      CatalogFileName := '';
      if TInterlocked.CompareExchange(FProviderCancelRequested, 0, 0) <> 0 then
        raise EAbort.Create('Batch cancelled before the next language.');
      TargetCode := ATargets[TargetIndex];
      ProgressText := Format('Language %d of %d: %s',
        [TargetIndex + 1, Length(ATargets), TargetCode]);
      TThread.Synchronize(nil,
        procedure
        begin
          lblBatchProgress.Text := ProgressText +
            '. This may take a few minutes.';
          prgBatchProgress.Value :=
            (TargetIndex * prgBatchProgress.Max) / Length(ATargets);
        end);
      Catalog := nil;
      try
        CatalogFileName := TTranslationWorkspace.DevelopmentCatalogFileName(
          AProfile, TargetCode, ASourceLanguage);
        if TFile.Exists(CatalogFileName) then
        begin
          Catalog := TCatalogJson.LoadFromFile(CatalogFileName);
          if not SameText(Catalog.SourceLanguage, ASourceLanguage) or
             not SameText(Catalog.Locale.LanguageCode, TargetCode) then
            raise EInvalidOpException.Create(
              'Existing catalog has a different source or target language.');
        end
        else
        begin
          Catalog := TTranslationCatalog.Create;
          Catalog.ApplicationId := AProfile.ProjectName;
          Catalog.Framework := AProfile.Framework;
          Catalog.SourceLanguage := ASourceLanguage;
          Catalog.Locale.LanguageCode := TargetCode;
          LocaleFacts := TLocaleFactsReader.Read(TargetCode);
          Catalog.Locale.NativeLanguageName :=
            CanonicalNativeLanguageName(TargetCode, LocaleFacts.NativeName);
          Catalog.Locale.TextDirection := LocaleFacts.TextDirection;
          Catalog.Locale.ShortDateFormat := LocaleFacts.ShortDateFormat;
          Catalog.Locale.LongDateFormat := LocaleFacts.LongDateFormat;
          Catalog.Locale.ShortTimeFormat := LocaleFacts.ShortTimeFormat;
          Catalog.Locale.LongTimeFormat := LocaleFacts.LongTimeFormat;
          Catalog.Locale.DecimalSeparator := LocaleFacts.DecimalSeparator;
          Catalog.Locale.ThousandSeparator := LocaleFacts.ThousandSeparator;
          Catalog.Locale.CurrencySymbol := LocaleFacts.CurrencySymbol;
        end;
        TScanCatalogMerger.Merge(ScanResult, Catalog);
        TSharedDictionary.ApplyToCatalog(TargetCode, Catalog,
          ASourceLanguage);
        GlossaryFileName := TTranslationWorkspace.GlossaryFileName(
          AProfile, TargetCode, ASourceLanguage);
        if TFile.Exists(GlossaryFileName) then
        begin
          Glossary := TProjectGlossary.LoadFromFile(GlossaryFileName);
          try
            Glossary.ApplyToCatalog(Catalog);
          finally
            Glossary.Free;
          end;
        end;
        TTerminologyResolver.ApplyAuthoritativeTerms(Catalog);
        Memory := TTranslationMemory.Load(TargetCode, ASourceLanguage);
        try
          Memory.ApplyToCatalog(Catalog);
        finally
          Memory.Free;
        end;
        SetLength(EntryIndexes, Catalog.Entries.Count);
        SetLength(SourceTexts, Catalog.Entries.Count);
        SetLength(Contexts, Catalog.Entries.Count);
        ProviderCount := 0;
        for Index := 0 to Catalog.Entries.Count - 1 do
        begin
          Entry := Catalog.Entries[Index];
          if not TranslationEntryEligibleForAutomaticTranslation(Entry) or
             (Entry.Status in [tsExcluded, tsObsolete,
               tsReviewed, tsApproved]) or
             ((Trim(Entry.TranslatedText) <> '') and
              not (Entry.Status in [tsNeedsTranslation,
                tsSourceChanged, tsError])) then
            Continue;
          if TTerminologyResolver.TryTranslationMemory(Catalog, Entry,
            ResolvedText) then
          begin
            Entry.TranslatedText := ResolvedText;
            Entry.Status := tsMachineTranslated;
            Entry.TranslationOrigin := torSuggestion;
            Entry.TranslationConfidence := 'translation-memory';
            Entry.TranslationReviewNote :=
              'Reused from a reviewed or approved entry with matching context.';
          end
          else if TTerminologyResolver.TryResolve(Entry, TargetCode,
            ResolvedText, ASourceLanguage) then
          begin
            Entry.TranslatedText := ResolvedText;
            Entry.Status := tsMachineTranslated;
            Entry.TranslationOrigin := torTerminology;
            Entry.TranslationConfidence := 'terminology';
            Entry.TranslationReviewNote := '';
          end
          else
          begin
            EntryIndexes[ProviderCount] := Index;
            SourceTexts[ProviderCount] := Entry.SourceText;
            Contexts[ProviderCount] := Entry.ContextDescription;
            Inc(ProviderCount);
          end;
        end;
        SetLength(EntryIndexes, ProviderCount);
        SetLength(SourceTexts, ProviderCount);
        SetLength(Contexts, ProviderCount);
        TCatalogJson.SaveToFile(Catalog, CatalogFileName);
        if ProviderCount > 0 then
        begin
          if AApiKey = '' then
            raise EInvalidOpException.CreateFmt(
              'An API key is required for %d unresolved entries.',
              [ProviderCount]);
          Client := TTranslationProviderClient.Create(AProvider,
            ASettings.DeepLPlan, AApiKey,
            ASettings.RequestTimeoutSeconds, ASettings.BatchSize);
          try
            BatchOffset := 0;
            while BatchOffset < ProviderCount do
            begin
              BatchCount := Min(25, Min(Max(1, ASettings.BatchSize),
                ProviderCount - BatchOffset));
              SetLength(BatchSourceTexts, BatchCount);
              SetLength(BatchContexts, BatchCount);
              for BatchIndex := 0 to BatchCount - 1 do
              begin
                BatchSourceTexts[BatchIndex] :=
                  SourceTexts[BatchOffset + BatchIndex];
                BatchContexts[BatchIndex] :=
                  Contexts[BatchOffset + BatchIndex];
              end;
              TranslatedTexts := Client.TranslateWithContexts(
                BatchSourceTexts, BatchContexts, ASourceLanguage, TargetCode,
                function: Boolean
                begin
                  Result := TInterlocked.CompareExchange(
                    FProviderCancelRequested, 0, 0) <> 0;
                end, nil);
              if Length(TranslatedTexts) <> BatchCount then
                raise EInvalidOpException.Create(
                  'Provider returned a different number of translations.');
              for BatchIndex := 0 to BatchCount - 1 do
              begin
                Index := BatchOffset + BatchIndex;
                Entry := Catalog.Entries[EntryIndexes[Index]];
                Entry.TranslatedText := TranslatedTexts[BatchIndex];
                Entry.Status := tsMachineTranslated;
                if AProvider = tpGoogle then
                begin
                  Entry.TranslationOrigin := torGoogle;
                  Entry.TranslationConfidence := 'provider-basic';
                  if SameText(Entry.ContextConfidence, 'unknown') or
                    ((Length(Trim(Entry.SourceText)) <= 12) and
                     (Entry.SemanticConcept = '')) then
                    Entry.TranslationReviewNote :=
                      'Short or ambiguous text translated without provider-side context; review recommended.';
                end
                else
                begin
                  Entry.TranslationOrigin := torDeepL;
                  Entry.TranslationConfidence := 'contextual-provider';
                end;
              end;
              TCatalogJson.SaveToFile(Catalog, CatalogFileName);
              Inc(BatchOffset, BatchCount);
            end;
          finally
            Client.Free;
          end;
        end;
        TTerminologyResolver.ApplyAuthoritativeTerms(Catalog);
        TCatalogJson.SaveToFile(Catalog, CatalogFileName);
        Inc(CompletedCount);
        ProgressText := Format('%s: draft catalog saved; %d provider entries. Review next.',
          [TargetCode, ProviderCount]);
        TThread.Synchronize(nil,
          procedure
          begin
            lstAddLanguagesResults.Items.Add(ProgressText);
            lblBatchProgress.Text := Format('%d of %d languages saved.',
              [CompletedCount, Length(ATargets)]);
            prgBatchProgress.Value :=
              (CompletedCount * prgBatchProgress.Max) / Length(ATargets);
          end);
      except
        on E: Exception do
        begin
          ErrorText := TargetCode + ': ' + E.Message;
          ProgressText := TargetCode + ': needs attention - ' + E.Message;
          TThread.Synchronize(nil,
            procedure
            begin
              lstAddLanguagesResults.Items.Add(ProgressText);
            end);
        end;
      end;
      Catalog.Free;
      if ErrorText <> '' then
        Break;
    end;
    if (ErrorText = '') and
       (TInterlocked.CompareExchange(FProviderCancelRequested, 0, 0) = 0) then
      for ScanItem in ScanResult.Items do
        if TFile.Exists(ScanItem.SourceFileName) and
           (TFile.GetLastWriteTime(ScanItem.SourceFileName) >
             ScanCompletedAt) then
          raise EInvalidOpException.CreateFmt(
            'Saved source changed after the batch scan: %s. Rescan before export.',
            [ScanItem.SourceFileName]);
  except
    on E: Exception do
      ErrorText := E.Message;
  end;
  ScanResult.Free;
  if (ErrorText <> '') and (CompletedCount < Length(ATargets)) and
     (CatalogFileName <> '') and TFile.Exists(CatalogFileName) then
    Inc(CompletedCount);
  TThread.Synchronize(nil,
    procedure
    begin
      FProviderOperationInProgress := False;
      btnBatchCancel.Enabled := False;
      lstAddLanguageTargets.Enabled := True;
      btnAddLanguagesSelectAll.Enabled := True;
      btnAddLanguagesClear.Enabled := True;
      btnAddLanguageProviderSettings.Enabled := True;
      btnBackToLanguageEditor.Enabled := True;
      StatusCard.Enabled := True;
      NavigationCard.Enabled := True;
      lblBatchProgress.Text := Format('%d of %d languages saved. %s',
        [CompletedCount, Length(ATargets),
         IfThen(ErrorText = '', 'Ready to review.', 'See batch results.')]);
      UpdateAddLanguagesSelection;
      if CompletedCount > 0 then
      begin
        ExistingCount := Length(FBatchTargets);
        SetLength(FBatchTargets, ExistingCount + CompletedCount);
        Index := 0;
        while Index < CompletedCount do
        begin
          FBatchTargets[ExistingCount + Index] := ATargets[Index];
          Inc(Index);
        end;
        FBatchReviewIndex := ExistingCount;
        FBatchReady := True;
        FBatchValidated := False;
        FBatchReadyToExport := False;
        FBatchReviewComplete := False;
        SaveBatchSession;
        UpdateAddLanguagesSelection;
        btnRunAddLanguages.Visible := False;
        btnReviewBatch.Visible := False;
        btnWorkflowNext.Enabled := True;
      end;
      if TInterlocked.CompareExchange(FProviderCancelRequested, 0, 0) <> 0 then
        lblStatus.Text := Format(
          'Batch cancelled. %d of %d drafts saved. Choose Next: Review to inspect saved languages; retry Add Languages for the rest.',
          [CompletedCount, Length(ATargets)])
      else if ErrorText <> '' then
        lblStatus.Text := Format(
          'Stopped after %d of %d. Choose Next: Review for saved languages; retry the rest later. %s',
          [CompletedCount, Length(ATargets), ErrorText])
      else
        lblStatus.Text := Format(
          '%d new draft catalogs saved; %d languages are now in this project. ' +
          'Choose Next: Review. Earlier exported packs remain available.',
          [CompletedCount, Length(FBatchTargets)]);
      if FCloseAfterProviderOperation then
      begin
        FCloseAfterProviderOperation := False;
        Close;
      end;
    end);
end;

procedure TfrmTranslationStudio.UpdateBatchReviewControls;
var
  Index: Integer;
begin
  cboBatchReviewTarget.OnChange := nil;
  try
    cboBatchReviewTarget.Items.Clear;
    if FBatchReady then
      for Index := 0 to High(FBatchTargets) do
        cboBatchReviewTarget.Items.Add(FBatchTargets[Index]);
    cboBatchReviewTarget.ItemIndex := FBatchReviewIndex;
  finally
    cboBatchReviewTarget.OnChange := cboBatchReviewTargetChange;
  end;
  cboBatchReviewTarget.Visible := FBatchReady and
    not FAddLanguagesPageVisible;
  btnNextBatchLanguage.Visible := False;
  if FBatchReady then
    if FBatchReviewIndex < High(FBatchTargets) then
      btnNextBatchLanguage.Text := 'Save & Review Next Language'
    else
      btnNextBatchLanguage.Text := 'Finish review';
  btnReviewBatch.Visible := False;
  btnRunAddLanguages.Visible := FAddLanguagesPageVisible;
  cboTargetLanguage.Enabled := not FBatchReady;
  btnExportValidatedLanguages.Enabled := FBatchReadyToExport;
  btnExportBatch.Visible := FBatchReady;
  btnExportBatch.Enabled := FBatchReady and FBatchReadyToExport;
  btnExportRuntimePack.Visible := not FBatchReady;
end;

procedure TfrmTranslationStudio.UpdateDeploymentPreview;
var
  Destination: string;
  Destinations: TStringList;
  ExistingPacks: TArray<string>;
  ExecutableDirectory: string;
  Index: Integer;
  PackDirectory: string;
  ReadyTargets: TStringList;
  RemovedCount: Integer;
  RemovedNames: string;
  TargetCode: string;
begin
  memDeploymentPreview.Lines.Clear;
  if not FBatchReady or not FBatchReadyToExport then
  begin
    memDeploymentPreview.Lines.Add(
      'Validate saved languages to see exactly what will be deployed.');
    Exit;
  end;
  ReadyTargets := TStringList.Create;
  Destinations := TStringList.Create;
  try
    ReadyTargets.Sorted := True;
    ReadyTargets.CaseSensitive := False;
    ReadyTargets.Duplicates := dupIgnore;
    for Index := 0 to High(FBatchTargets) do
      if FBatchValidationErrors[Index] = 0 then
        ReadyTargets.Add(FBatchTargets[Index]);
    memDeploymentPreview.Lines.Add('Ready target languages: ' +
      StringReplace(Trim(ReadyTargets.CommaText), ',', ', ', [rfReplaceAll]));
    memDeploymentPreview.Lines.Add('Original app language pack: ' +
      SelectedLanguageCode(cboProjectSourceLanguage));
    memDeploymentPreview.Lines.Add('');
    Destinations.Sorted := True;
    Destinations.CaseSensitive := False;
    Destinations.Duplicates := dupIgnore;
    Destinations.Add(TPath.GetDirectoryName(FProjectProfile.ProjectFileName));
    for Destination in TTargetBuildDeployer.ExistingBuildOutputDirectories(
      FProjectProfile.ProjectFileName, FProjectProfile.ProjectName,
      FProjectProfile.SupportsWin32, FProjectProfile.SupportsWin64) do
      if TFile.Exists(TPath.Combine(Destination,
        FProjectProfile.ProjectName + '.exe')) then
        Destinations.Add(Destination);
    ExecutableDirectory := TPath.Combine(
      TPath.GetDirectoryName(FProjectProfile.ProjectFileName), 'Executable');
    if TFile.Exists(TPath.Combine(ExecutableDirectory,
      FProjectProfile.ProjectName + '.exe')) then
      Destinations.Add(ExecutableDirectory);
    for Destination in Destinations do
    begin
      PackDirectory := TPath.Combine(Destination, 'Localization\Languages');
      RemovedCount := 0;
      RemovedNames := '';
      if TDirectory.Exists(PackDirectory) then
      begin
        ExistingPacks := TDirectory.GetFiles(PackDirectory, '*.json',
          TSearchOption.soTopDirectoryOnly);
        for TargetCode in ExistingPacks do
          if not SameText(TPath.GetFileNameWithoutExtension(TargetCode),
            SelectedLanguageCode(cboProjectSourceLanguage)) and
            (ReadyTargets.IndexOf(
              TPath.GetFileNameWithoutExtension(TargetCode)) < 0) then
          begin
            Inc(RemovedCount);
            if RemovedNames <> '' then
              RemovedNames := RemovedNames + ', ';
            RemovedNames := RemovedNames +
              TPath.GetFileNameWithoutExtension(TargetCode);
          end;
      end;
      memDeploymentPreview.Lines.Add(Format('%s — %d existing pack(s) ' +
        'not in this validated set will be removed',
        [PackDirectory, RemovedCount]));
      if RemovedCount > 0 then
        memDeploymentPreview.Lines.Add('  Remove: ' + RemovedNames);
    end;
    memDeploymentPreview.Lines.Add(
      'The new Release build output also receives these packs.');
    memDeploymentPreview.Lines.Add(
      'No archived portable exports will be changed.');
  finally
    Destinations.Free;
    ReadyTargets.Free;
  end;
end;

procedure TfrmTranslationStudio.OpenBatchCatalog(const AIndex: Integer);
var
  Catalog: TTranslationCatalog;
  CatalogFileName: string;
  SourceLanguage: string;
begin
  if not FBatchReady or (AIndex < 0) or
     (AIndex >= Length(FBatchTargets)) then
    raise EInvalidOpException.Create('No batch language is available to review.');
  if (FTranslationCatalog <> nil) and (FCatalogFileName <> '') and
     (SelectedLanguageCode(cboTargetLanguage) <> '') then
    SaveCatalog;
  SourceLanguage := SelectedLanguageCode(cboProjectSourceLanguage);
  CatalogFileName := TTranslationWorkspace.DevelopmentCatalogFileName(
    FProjectProfile, FBatchTargets[AIndex], SourceLanguage);
  Catalog := TCatalogJson.LoadFromFile(CatalogFileName);
  try
    if not SameText(Catalog.SourceLanguage, SourceLanguage) or
       not SameText(Catalog.Locale.LanguageCode, FBatchTargets[AIndex]) then
      raise EInvalidOpException.Create('The selected catalog does not match this source/target pair.');
    FreeAndNil(FTranslationCatalog);
    FTranslationCatalog := Catalog;
    Catalog := nil;
  finally
    Catalog.Free;
  end;
  FCatalogFileName := CatalogFileName;
  FBatchReviewIndex := AIndex;
  FBatchReviewComplete := False;
  FAddLanguagesPageVisible := False;
  SaveBatchSession;
  FCatalogToolsPageVisible := False;
  DisplayCatalogLanguage;
  DisplayCatalogEntries;
  SetWorkflowStep(3);
  UpdateBatchReviewControls;
  lblBatchReviewProgress.Text := Format(
    'Reviewing %s — %d of %d. Correct and save entries; use %s when ready.',
    [FBatchTargets[AIndex], AIndex + 1,
     Length(FBatchTargets), btnWorkflowNext.Text]);
  lblStatus.Text := Format(
    'Review %s (%d of %d). Draft catalogs are saved; export is optional.',
    [FBatchTargets[AIndex], AIndex + 1, Length(FBatchTargets)]);
end;

procedure TfrmTranslationStudio.btnReviewBatchClick(Sender: TObject);
begin
  try
    OpenBatchCatalog(Max(0, FBatchReviewIndex));
  except
    on E: Exception do
      lblStatus.Text := 'Unable to open batch review: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.cboBatchReviewTargetChange(Sender: TObject);
begin
  try
    if cboBatchReviewTarget.ItemIndex <> FBatchReviewIndex then
      OpenBatchCatalog(cboBatchReviewTarget.ItemIndex);
  except
    on E: Exception do
      lblStatus.Text := 'Unable to switch language: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.btnNextBatchLanguageClick(Sender: TObject);
begin
  try
    if FBatchReviewIndex < High(FBatchTargets) then
      OpenBatchCatalog(FBatchReviewIndex + 1)
    else
    begin
      SaveCatalog;
      FBatchReviewComplete := True;
      SaveBatchSession;
      SetWorkflowStep(3);
    end;
  except
    on E: Exception do
      lblStatus.Text := 'Unable to continue: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.lblNavigationGlossaryClick(Sender: TObject);
begin
  SetWorkflowStep(4);
end;

procedure TfrmTranslationStudio.lblNavigationValidationClick(Sender: TObject);
begin
  SetWorkflowStep(5);
end;

procedure TfrmTranslationStudio.lblNavigationExportClick(Sender: TObject);
begin
  SetWorkflowStep(6);
end;

procedure TfrmTranslationStudio.lblNavigationIntegrationClick(Sender: TObject);
begin
  SetWorkflowStep(7);
end;

procedure TfrmTranslationStudio.lblNavigationSettingsClick(Sender: TObject);
begin
  SetWorkflowStep(8);
end;

procedure TfrmTranslationStudio.cboTranslationProviderChange(Sender: TObject);
begin
  cboDeepLPlan.Enabled := SelectedProvider = tpDeepL;
  edtProviderApiKey.Text := '';
  UpdateCredentialStatus;
end;

procedure TfrmTranslationStudio.btnSaveProviderKeyClick(Sender: TObject);
var
  ApiKey: string;
  Provider: TTranslationProvider;
begin
  try
    Provider := SelectedProvider;
    ApiKey := Trim(edtProviderApiKey.Text);
    if ApiKey = '' then
      raise Exception.Create(
        'Enter the new API key in the masked field first.');
    SaveProviderSettings;
    if chkRememberCredential.IsChecked then
    begin
      TProviderCredentialStore.Write(Provider, ApiKey);
      FSessionApiKeys[Provider] := '';
      lblStatus.Text :=
        'API key saved securely in Windows Credential Manager.';
    end
    else
    begin
      TProviderCredentialStore.Delete(Provider);
      FSessionApiKeys[Provider] := ApiKey;
      lblStatus.Text :=
        'API key is available for this Studio session only.';
    end;
    edtProviderApiKey.Text := '';
    UpdateCredentialStatus;
  except
    on E: Exception do
      lblStatus.Text := 'Unable to save provider settings: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.btnRemoveProviderKeyClick(Sender: TObject);
var
  Provider: TTranslationProvider;
begin
  try
    Provider := SelectedProvider;
    TProviderCredentialStore.Delete(Provider);
    FSessionApiKeys[Provider] := '';
    edtProviderApiKey.Text := '';
    UpdateCredentialStatus;
    lblStatus.Text := 'The selected provider key was removed.';
  except
    on E: Exception do
      lblStatus.Text := 'Unable to remove the provider key: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.btnTestProviderConnectionClick(
  Sender: TObject);
var
  ApiKey: string;
  BatchSize: Integer;
  DeepLPlan: TDeepLPlan;
  Provider: TTranslationProvider;
  ProviderName: string;
  RequestTimeoutSeconds: Integer;
begin
  if FProviderOperationInProgress then
    Exit;
  btnTestProviderConnection.Enabled := False;
  try
    SaveProviderSettings;
    Provider := FProviderSettings.Provider;
    DeepLPlan := FProviderSettings.DeepLPlan;
    ApiKey := EffectiveApiKey(Provider);
    RequestTimeoutSeconds := FProviderSettings.RequestTimeoutSeconds;
    BatchSize := FProviderSettings.BatchSize;
    ProviderName := TranslationProviderDisplayName(Provider);
    FProviderOperationInProgress := True;
    FCloseAfterProviderOperation := False;
    TInterlocked.Exchange(FProviderCancelRequested, 0);
    BodyLayout.Enabled := False;
    NavigationCard.Enabled := False;
    lblStatus.Text := 'Testing the ' + ProviderName + ' connection...';
    ShowOperation('Testing provider connection',
      'Waiting for ' + ProviderName + '...', True);
    TThread.CreateAnonymousThread(
      procedure
      var
        Client: TTranslationProviderClient;
        ErrorText: string;
        Passed: Boolean;
      begin
        ErrorText := '';
        Passed := False;
        Client := nil;
        try
          try
            Client := TTranslationProviderClient.Create(Provider, DeepLPlan,
              ApiKey, RequestTimeoutSeconds, BatchSize);
            Client.TestConnection(
              function: Boolean
              begin
                Result := TInterlocked.CompareExchange(
                  FProviderCancelRequested, 0, 0) <> 0;
              end);
            Passed := True;
          except
            on E: Exception do
              ErrorText := E.Message;
          end;
        finally
          Client.Free;
        end;
        TThread.Queue(nil,
          procedure
          begin
            FProviderOperationInProgress := False;
            HideOperation;
            BodyLayout.Enabled := True;
            NavigationCard.Enabled := True;
            btnTestProviderConnection.Enabled := True;
            if TInterlocked.CompareExchange(
              FProviderCancelRequested, 0, 0) <> 0 then
              lblStatus.Text := 'Connection test cancelled.'
            else if Passed then
              lblStatus.Text := ProviderName + ' connection test passed.'
            else
              lblStatus.Text := 'Connection test failed: ' + ErrorText;
            if FCloseAfterProviderOperation then
            begin
              FCloseAfterProviderOperation := False;
              Close;
            end;
          end);
      end).Start;
  except
    on E: Exception do
    begin
      lblStatus.Text := 'Connection test failed: ' + E.Message;
      btnTestProviderConnection.Enabled := True;
    end;
  end;
end;

procedure TfrmTranslationStudio.btnBuildIntegrationPlanClick(Sender: TObject);
var
  Descriptor: TLanguagePackDescriptor;
  Languages: TObjectList<TLanguagePackDescriptor>;
begin
  btnApplyIntegration.Text := 'Apply';
  chkIntegrationReviewConfirmed.Text :=
    'I authorize the backed-up, transactional integration changes';
  chkIntegrationReviewConfirmed.IsChecked := False;
  chkIntegrationReviewConfirmed.Enabled := False;
  btnApplyIntegration.Enabled := False;
  btnRestoreIntegration.Enabled := False;
  try
    if IsComponentIntegrationMode then
    begin
      lstIntegrationPlan.Items.Clear;
      lstIntegrationPlan.Items.Add(
        '1. Generate a verified, self-contained component integration kit.');
      if FProjectProfile.Framework = tfVCL then
        lstIntegrationPlan.Items.Add(
          '2. In Delphi, add DATLanguageManagerVCLDesign.bpl through ' +
          'Component > Install Packages.')
      else
        lstIntegrationPlan.Items.Add(
          '2. In Delphi, add DATLanguageManagerFMXDesign.bpl through ' +
          'Component > Install Packages.');
      lstIntegrationPlan.Items.Add(
        '3. Install the complete DAT source set under dependencies\DelphiAppTranslation\source.');
      lstIntegrationPlan.Items.Add(
        '4. Keep Pascal, DPR, DPROJ, DFM, and FMX files read-only; Studio builds use a temporary dependency Search Path.');
      lstIntegrationPlan.Items.Add(
        '5. Rebuild Win32 Release and deploy the current packs directly.');
      lstIntegrationPlan.Items.Add(
        '6. Add dependencies\DelphiAppTranslation\source once through RAD Studio Project Options for normal IDE builds.');
      lstIntegrationPlan.Items.Add(
        '7. In the Form Designer, place the manager and connected selector if needed, then test every distributed target.');
      Languages := TLanguagePackDiscovery.Discover(
        TTranslationWorkspace.LanguagesDirectory(FProjectProfile),
        FProjectProfile.ProjectName);
      try
        lblIntegrationSummary.Text := Format(
          '%d translated pack(s) found; English will be generated.',
          [Languages.Count]);
        for Descriptor in Languages do
          lstIntegrationPlan.Items.Add(Format('   %s (%s)',
            [Descriptor.NativeLanguageName, Descriptor.LanguageCode]));
      finally
        Languages.Free;
      end;
      memIntegrationDiff.Text :=
        'The Studio first creates a safety copy, stages and verifies the full ' +
        'dependency set, then atomically promotes it. Only the project-local ' +
        'dependencies\DelphiAppTranslation folder is managed. Project files are read-only.';
      btnGenerateIntegrationPackage.Enabled := True;
      btnOpenDesignPackageLocation.Enabled := True;
      lblStatus.Text :=
        'Automation plan ready. No target files have been changed yet.';
      Exit;
    end;
    lstIntegrationPlan.Items.Clear;
    lstIntegrationPlan.Items.Add(
      'Target source integration is disabled.');
    lstIntegrationPlan.Items.Add(
      'Use Component Integration mode. The Studio may scan, translate, export JSON packs, and generate component kits, but it must not edit target Pascal, form, DPR, or DPROJ files.');
    memIntegrationDiff.Text :=
      'Read-only policy: no source integration preview is generated. ' +
      'Select Component Integration (Recommended) to generate the safe kit.';
    lblIntegrationSummary.Text :=
      'No target file changes are available in read-only mode.';
    lblIntegrationOutput.Text := '';
    lblStatus.Text :=
      'Target source integration is disabled. Use Component Integration.';
    btnGenerateIntegrationPackage.Enabled := False;
    Exit;
  except
    on E: Exception do
      lblStatus.Text := 'Unable to build integration plan: ' + E.Message;
  end;
end;

function FindStudioProjectRoot: string;
var
  CandidateDirectory: string;
  ParentDirectory: string;
begin
  CandidateDirectory := TPath.GetFullPath(
    ExtractFilePath(ParamStr(0)));
  while CandidateDirectory <> '' do
  begin
    if TFile.Exists(TPath.Combine(CandidateDirectory,
      'DelphiAppTranslationStudio.dproj')) then
      Exit(CandidateDirectory);
    ParentDirectory := TPath.GetDirectoryName(CandidateDirectory);
    if SameText(ParentDirectory, CandidateDirectory) then
      Break;
    CandidateDirectory := ParentDirectory;
  end;
  raise Exception.Create(
    'The Studio project root could not be located.');
end;

procedure TfrmTranslationStudio.btnOpenDesignPackageLocationClick(
  Sender: TObject);
var
  DesignPackageFileName: string;
  ExplorerArguments: string;
  StudioProjectRoot: string;
begin
  try
    if FProjectProfile.ProjectFileName = '' then
      raise Exception.Create('Open a Delphi project first.');
    if FProjectProfile.Framework = tfVCL then
      DesignPackageFileName := 'DATLanguageManagerVCLDesign.bpl'
    else
      DesignPackageFileName := 'DATLanguageManagerFMXDesign.bpl';
    if (FIntegrationPackageDirectory <> '') and
      TDirectory.Exists(FIntegrationPackageDirectory) then
      DesignPackageFileName := TPath.Combine(FIntegrationPackageDirectory,
        TPath.Combine('DesignPackages\Win32\Release',
          DesignPackageFileName))
    else
    begin
      StudioProjectRoot := FindStudioProjectRoot;
      DesignPackageFileName := TPath.Combine(StudioProjectRoot,
        TPath.Combine('bin\packages\Win32\Release', DesignPackageFileName));
    end;
    if not TFile.Exists(DesignPackageFileName) then
      raise EFileNotFoundException.CreateFmt(
        'Verified Win32 Release design package not found: %s. Run the ' +
        'release validation build first.', [DesignPackageFileName]);
    ExplorerArguments := '/select,"' + DesignPackageFileName + '"';
    if ShellExecute(0, 'open', 'explorer.exe', PChar(ExplorerArguments), nil,
      SW_SHOWNORMAL) <= 32 then
      raise Exception.Create('Windows could not open the package location.');
    lblStatus.Text :=
      'Design BPL selected. In Delphi use Component > Install Packages > Add.';
  except
    on E: Exception do
      lblStatus.Text := 'Unable to show the design package: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.btnOpenComponentKitFolderClick(
  Sender: TObject);
begin
  try
    if (FIntegrationPackageDirectory = '') or
       not TDirectory.Exists(FIntegrationPackageDirectory) then
      raise Exception.Create('Generate the component kit first.');
    if ShellExecute(0, 'open', PChar(FIntegrationPackageDirectory), nil, nil,
      SW_SHOWNORMAL) <= 32 then
      raise Exception.Create('Windows could not open the component kit folder.');
    lblStatus.Text := 'Component kit folder opened. Target source is unchanged.';
  except
    on E: Exception do
      lblStatus.Text := 'Unable to open the component kit folder: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.btnGenerateIntegrationPackageClick(
  Sender: TObject);
var
  BackupRoot: string;
  BuildResult: string;
  FileName: string;
  Index: Integer;
  OutputDirectory: string;
  SelectedTargets: TArray<string>;
  StudioProjectRoot: string;
begin
  try
    FIntegrationBuildError := '';
    btnApplyIntegration.Text := 'Apply';
    chkIntegrationReviewConfirmed.Text :=
      'I authorize the backed-up, transactional integration changes';
    StudioProjectRoot := FindStudioProjectRoot;
    if IsComponentIntegrationMode then
    begin
      if FBatchReady then
      begin
        if FExportInProgress then
        begin
          SetLength(SelectedTargets, 0);
          for Index := 0 to High(FBatchTargets) do
            if FBatchValidationErrors[Index] = 0 then
            begin
              SetLength(SelectedTargets, Length(SelectedTargets) + 1);
              SelectedTargets[High(SelectedTargets)] := FBatchTargets[Index];
            end;
        end
        else
          SelectedTargets := Copy(FBatchTargets);
      end
      else
        SetLength(SelectedTargets, 0);
      OutputDirectory := TComponentIntegrationPackageGenerator.Generate(
        FProjectProfile,
        TPath.Combine(StudioProjectRoot, 'export\component-integration'),
        TPath.Combine(StudioProjectRoot, 'source\runtime'),
        TPath.Combine(StudioProjectRoot, 'source\components'),
        SelectedLanguageCode(cboSourceLanguage), SelectedTargets);
      FIntegrationPackageDirectory := OutputDirectory;
      if FWorkflowStep = 7 then
        btnWorkflowNext.Enabled := True;
      BackupRoot := TPath.Combine(TPath.GetDocumentsPath,
        TPath.Combine('Delphi App Translation Backups',
          FProjectProfile.ProjectName));
      FLastIntegrationBackupDirectory :=
        TComponentIntegrationPackageGenerator.PrepareProjectDependencies(
          FProjectProfile, OutputDirectory, BackupRoot);
      btnOpenComponentKitFolder.Enabled := True;
      lstIntegrationPlan.Items.Clear;
      for FileName in TDirectory.GetFiles(OutputDirectory, '*',
        TSearchOption.soAllDirectories) do
        lstIntegrationPlan.Items.Add(FileName.Substring(
          IncludeTrailingPathDelimiter(OutputDirectory).Length));
      if lstIntegrationPlan.Items.Count > 0 then
      begin
        lstIntegrationPlan.ItemIndex :=
          lstIntegrationPlan.Items.IndexOf('README.txt');
        if lstIntegrationPlan.ItemIndex < 0 then
          lstIntegrationPlan.ItemIndex := 0;
        DisplaySelectedIntegrationChange;
      end;
      lblIntegrationOutput.Text := OutputDirectory;
      memIntegrationDiff.Lines.Insert(0,
        'Previous dependency snapshot: ' + FLastIntegrationBackupDirectory);
      BuildResult := '';
      try
        if FProjectProfile.SupportsWin32 then
          BuildResult := TTargetBuildDeployer.BuildAndDeploy(
            FProjectProfile.ProjectFileName, FProjectProfile.ProjectName,
            'Win32', 'Release', OutputDirectory)
        else if FProjectProfile.SupportsWin64 then
          BuildResult := TTargetBuildDeployer.BuildAndDeploy(
            FProjectProfile.ProjectFileName, FProjectProfile.ProjectName,
            'Win64', 'Release', OutputDirectory);
        if BuildResult = '' then
          FIntegrationBuildError :=
            'No supported Windows build target was available for deployment.';
      except
        on E: Exception do
        begin
          FIntegrationBuildError := E.Message;
          BuildResult := 'Project preparation succeeded, but the automatic ' +
            'Release build needs attention: ' + E.Message;
        end;
      end;
      if BuildResult <> '' then
        memIntegrationDiff.Lines.Insert(1, BuildResult);
      lblIntegrationSummary.Text := Format(
        '%d verified kit file(s); project-local dependency prepared without changing project files.',
        [lstIntegrationPlan.Items.Count]);
      lblStatus.Text :=
        'Dependency preparation complete. Add the Search Path in RAD Studio once, then use Show Design BPL.';
      Exit;
    end;
    lstIntegrationPlan.Items.Clear;
    lstIntegrationPlan.Items.Add(
      'Target source integration is disabled.');
    lstIntegrationPlan.Items.Add(
      'Use Component Integration mode. The Studio may scan, translate, export JSON packs, and generate component kits, but it must not edit target Pascal, form, DPR, or DPROJ files.');
    memIntegrationDiff.Text :=
      'Read-only policy: no source integration package is generated. ' +
      'Select Component Integration (Recommended) to generate the safe kit.';
    lblIntegrationOutput.Text := '';
    lblIntegrationSummary.Text :=
      'No target file changes are available in read-only mode.';
    lblStatus.Text :=
      'Target source integration is disabled. Use Component Integration.';
    btnGenerateIntegrationPackage.Enabled := False;
    Exit;
  except
    on E: Exception do
    begin
      FIntegrationBuildError := E.Message;
      lblStatus.Text := 'Unable to generate integration package: ' + E.Message;
    end;
  end;
end;

procedure TfrmTranslationStudio.btnApplyIntegrationClick(Sender: TObject);
begin
  lblStatus.Text :=
    'Apply is disabled. Target source, form, DPR, and DPROJ files are read-only.';
  btnApplyIntegration.Enabled := False;
end;

procedure TfrmTranslationStudio.btnCompleteResetClick(Sender: TObject);
begin
  lblStatus.Text :=
    'Complete Reset is disabled because the selected target project is read-only.';
  btnCompleteReset.Enabled := False;
end;

procedure TfrmTranslationStudio.lstIntegrationPlanChange(Sender: TObject);
begin
  DisplaySelectedIntegrationChange;
end;

procedure TfrmTranslationStudio.chkIntegrationReviewConfirmedChange(
  Sender: TObject);
begin
  UpdateIntegrationApplyState;
end;

procedure TfrmTranslationStudio.btnRestoreIntegrationClick(Sender: TObject);
begin
  lblStatus.Text :=
    'Restore is disabled. Target source, form, DPR, and DPROJ files are read-only.';
  btnRestoreIntegration.Enabled := False;
  btnApplyIntegration.Enabled := False;
  chkIntegrationReviewConfirmed.IsChecked := False;
  chkIntegrationReviewConfirmed.Enabled := False;
end;

procedure TfrmTranslationStudio.btnOpenCatalogClick(Sender: TObject);
var
  LoadedCatalog: TTranslationCatalog;
begin
  if FProjectProfile.ProjectFileName = '' then
  begin
    lblStatus.Text := 'Open the matching Delphi project first.';
    Exit;
  end;
  if not dlgOpenCatalog.Execute then
    Exit;

  try
    LoadedCatalog := TCatalogJson.LoadFromFile(dlgOpenCatalog.FileName);
    if (LoadedCatalog.Framework <> tfUnknown) and
      (LoadedCatalog.Framework <> FProjectProfile.Framework) then
    begin
      LoadedCatalog.Free;
      raise Exception.Create(
        'The catalog framework does not match the open Delphi project.');
    end;
    FreeAndNil(FTranslationCatalog);
    FTranslationCatalog := LoadedCatalog;
    FCatalogFileName := dlgOpenCatalog.FileName;
    lblCatalogPathValue.Text := FCatalogFileName;
    lblCatalogState.Text := 'Catalog saved  -  Open folder';
    DisplayCatalogLanguage;
    DisplayCatalogEntries;
    InvalidateValidation;
    if (FWorkflowStep = 3) and not FAddLanguagesPageVisible and
       not FBatchReady then
      btnWorkflowNext.Enabled :=
        SelectedLanguageCode(cboTargetLanguage) <> '';
    lblStatus.Text := 'Development catalog opened.';
  except
    on E: Exception do
      lblStatus.Text := 'Unable to open catalog: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.btnSaveCatalogClick(Sender: TObject);
begin
  try
    SaveCatalog;
  except
    on E: Exception do
      lblStatus.Text := 'Unable to save catalog: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.btnExportCatalogCsvClick(Sender: TObject);
begin
  if FTranslationCatalog = nil then
  begin
    lblStatus.Text := 'Scan a project or open a catalog first.';
    Exit;
  end;
  if SelectedLanguageCode(cboTargetLanguage) = '' then
  begin
    lblStatus.Text := 'Select a target language before exporting CSV.';
    Exit;
  end;
  try
    UpdateCatalogFromLanguageEditors;
    if FCatalogFileName = '' then
      SaveCatalog;
    dlgExportCatalogCsv.FileName := TPath.ChangeExtension(
      FCatalogFileName, '.csv');
    if not dlgExportCatalogCsv.Execute then
      Exit;
    TCatalogCsv.ExportToFile(FTranslationCatalog,
      dlgExportCatalogCsv.FileName);
    lblStatus.Text := 'Translation CSV exported: ' +
      dlgExportCatalogCsv.FileName;
  except
    on E: Exception do
      lblStatus.Text := 'Unable to export CSV: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.btnImportCatalogCsvClick(Sender: TObject);
var
  ConfirmationText: string;
  ImportPlan: TCatalogCsvImportPlan;
  IssueIndex: Integer;
begin
  if FTranslationCatalog = nil then
  begin
    lblStatus.Text := 'Scan a project or open a catalog first.';
    Exit;
  end;
  if not dlgImportCatalogCsv.Execute then
    Exit;
  ImportPlan := nil;
  try
    try
      ImportPlan := TCatalogCsv.AnalyzeImport(FTranslationCatalog,
        dlgImportCatalogCsv.FileName);
      ConfirmationText := ImportPlan.Summary;
      if ImportPlan.Issues.Count > 0 then
      begin
        ConfirmationText := ConfirmationText + sLineBreak + sLineBreak +
          'Import issues:';
        for IssueIndex := 0 to
          Min(ImportPlan.Issues.Count - 1, 7) do
          ConfirmationText := ConfirmationText + sLineBreak +
            ImportPlan.Issues[IssueIndex];
        if ImportPlan.Issues.Count > 8 then
          ConfirmationText := ConfirmationText + sLineBreak +
            Format('...and %d more issue(s).',
              [ImportPlan.Issues.Count - 8]);
      end;
      ConfirmationText := ConfirmationText + sLineBreak + sLineBreak +
        'Apply the staged translations?';
      if TDialogServiceSync.MessageDialog(ConfirmationText,
        TMsgDlgType.mtConfirmation,
        [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
        TMsgDlgBtn.mbNo, 0) <> mrYes then
      begin
        lblStatus.Text := 'CSV import canceled. ' +
          StringReplace(ImportPlan.Summary, sLineBreak, ' | ',
            [rfReplaceAll]);
        Exit;
      end;
      ImportPlan.Apply;
      InvalidateValidation;
      DisplayCatalogEntries;
      if FCatalogFileName <> '' then
        SaveCatalog;
      lblStatus.Text := 'CSV import complete. ' +
        StringReplace(ImportPlan.Summary, sLineBreak, ' | ',
          [rfReplaceAll]);
    except
      on E: Exception do
        lblStatus.Text := 'Unable to import CSV: ' + E.Message;
    end;
  finally
    ImportPlan.Free;
  end;
end;

procedure TfrmTranslationStudio.lstCatalogEntriesChange(Sender: TObject);
var
  Entry: TTranslationEntry;
begin
  if FUpdatingEntryControls then
    Exit;
  if FTranslationEditorDirty then
  begin
    CommitDisplayedTranslation;
    if (FProjectProfile.ProjectFileName <> '') and
       (SelectedLanguageCode(cboTargetLanguage) <> '') then
      SaveCatalog;
  end;
  if (FTranslationCatalog = nil) or
    (lstCatalogEntries.ItemIndex < 0) or
    (lstCatalogEntries.ItemIndex >= FTranslationCatalog.Entries.Count) then
    Exit;
  Entry := FTranslationCatalog.Entries[lstCatalogEntries.ItemIndex];
  FUpdatingEntryControls := True;
  try
    memSourceText.Text := Entry.SourceText;
    memTranslatedText.Text := Entry.TranslatedText;
    lblRuntimeApplicationValue.Text := 'Runtime: ' +
      RuntimeApplicationKindToString(Entry.RuntimeApplication) +
      ' | Role: ' + RuntimeTextRoleDisplayName(Entry.RuntimeTextRole) +
      ' | Ownership: ' + TextOwnershipDisplayName(Entry.TextOwnership) +
      ' | Origin: ' +
      TranslationOriginDisplayName(Entry.TranslationOrigin);
    lblTranslationContextValue.Text := 'Context: ' + Entry.ContextKind;
    lblTranslationContextValue.Hint := Entry.ContextDescription +
      IfThen(Entry.SemanticConcept <> '', sLineBreak + 'Concept: ' +
        Entry.SemanticConcept, '') + sLineBreak + 'Confidence: ' +
        Entry.ContextConfidence;
    chkRuntimeWiringConfirmed.Enabled :=
      Entry.RuntimeApplication = rakManualTranslateText;
    chkRuntimeWiringConfirmed.Visible :=
      Entry.RuntimeApplication = rakManualTranslateText;
    chkRuntimeWiringConfirmed.IsChecked :=
      Entry.RuntimeWiringConfirmed;
    btnMarkTranslationReviewed.Enabled :=
      (Trim(Entry.TranslatedText) <> '') and
      not (Entry.Status in [tsExcluded, tsObsolete, tsApproved]);
    btnApproveTranslation.Enabled := Entry.Status = tsReviewed;
    UpdateTranslationSuggestions(Entry);
  finally
    FUpdatingEntryControls := False;
  end;
  FDisplayedEntryIndex := lstCatalogEntries.ItemIndex;
end;

procedure TfrmTranslationStudio.memTranslatedTextChange(Sender: TObject);
begin
  if not FUpdatingEntryControls and (FDisplayedEntryIndex >= 0) then
    FTranslationEditorDirty := True;
end;

procedure TfrmTranslationStudio.CommitDisplayedTranslation;
var
  Entry: TTranslationEntry;
begin
  if not FTranslationEditorDirty or (FTranslationCatalog = nil) or
     (FDisplayedEntryIndex < 0) or
     (FDisplayedEntryIndex >= FTranslationCatalog.Entries.Count) then
    Exit;
  Entry := FTranslationCatalog.Entries[FDisplayedEntryIndex];
  if Entry.TranslatedText <> memTranslatedText.Text then
  begin
    Entry.TranslatedText := memTranslatedText.Text;
    if Trim(Entry.TranslatedText) = '' then
      Entry.Status := tsNeedsTranslation
    else
      Entry.Status := tsEdited;
    Entry.TranslationOrigin := torHuman;
    Entry.TranslationConfidence := '';
    Entry.TranslationReviewNote := '';
  end;
end;

procedure TfrmTranslationStudio.btnApplyTranslationClick(Sender: TObject);
var
  Entry: TTranslationEntry;
begin
  if (FTranslationCatalog = nil) or
    (lstCatalogEntries.ItemIndex < 0) then
  begin
    lblStatus.Text := 'Select a catalog entry first.';
    Exit;
  end;

  Entry := FTranslationCatalog.Entries[lstCatalogEntries.ItemIndex];
  Entry.TranslatedText := memTranslatedText.Text;
  if Trim(Entry.TranslatedText) = '' then
    Entry.Status := tsNeedsTranslation
  else
    Entry.Status := tsEdited;
  Entry.TranslationOrigin := torHuman;
  Entry.TranslationConfidence := '';
  Entry.TranslationReviewNote := '';
  lstCatalogEntries.Items[lstCatalogEntries.ItemIndex] :=
    Entry.Key + '  [' + TranslationStatusToString(Entry.Status) + ']';
  btnMarkTranslationReviewed.Enabled :=
    Trim(Entry.TranslatedText) <> '';
  btnApproveTranslation.Enabled := False;
  UpdateTranslationSuggestions(Entry);
  InvalidateValidation;
  UpdateCatalogReadiness;
  try
    if FCatalogFileName <> '' then
      SaveCatalog;
    lblStatus.Text := 'Translation applied.';
  except
    on E: Exception do
      lblStatus.Text := 'Translation applied but not saved: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.chkRuntimeWiringConfirmedChange(
  Sender: TObject);
var
  Entry: TTranslationEntry;
begin
  if FUpdatingEntryControls or (FTranslationCatalog = nil) or
     (lstCatalogEntries.ItemIndex < 0) then
    Exit;
  Entry := FTranslationCatalog.Entries[lstCatalogEntries.ItemIndex];
  if Entry.RuntimeApplication <> rakManualTranslateText then
    Exit;
  Entry.RuntimeWiringConfirmed :=
    chkRuntimeWiringConfirmed.IsChecked;
  InvalidateValidation;
  UpdateCatalogReadiness;
  if FCatalogFileName <> '' then
    SaveCatalog;
end;

procedure TfrmTranslationStudio.btnAcceptSuggestionClick(Sender: TObject);
var
  Entry: TTranslationEntry;
  SuggestedEntry: TTranslationEntry;
begin
  if (FTranslationCatalog = nil) or
     (lstCatalogEntries.ItemIndex < 0) or
     (cboTranslationSuggestions.ItemIndex < 0) then
    Exit;
  SuggestedEntry := TTranslationEntry(
    cboTranslationSuggestions.Items.Objects[
      cboTranslationSuggestions.ItemIndex]);
  if SuggestedEntry = nil then
    Exit;
  Entry := FTranslationCatalog.Entries[lstCatalogEntries.ItemIndex];
  Entry.TranslatedText := SuggestedEntry.TranslatedText;
  Entry.Status := tsEdited;
  Entry.TranslationOrigin := torSuggestion;
  Entry.TranslationConfidence := '';
  Entry.TranslationReviewNote := '';
  memTranslatedText.Text := Entry.TranslatedText;
  lstCatalogEntries.Items[lstCatalogEntries.ItemIndex] :=
    Entry.Key + '  [' + TranslationStatusToString(Entry.Status) + ']';
  btnMarkTranslationReviewed.Enabled := True;
  btnApproveTranslation.Enabled := False;
  InvalidateValidation;
  UpdateCatalogReadiness;
  UpdateTranslationSuggestions(Entry);
  if FCatalogFileName <> '' then
    SaveCatalog;
  FCatalogToolsPageVisible := False;
  SetWorkflowStep(3);
  lblStatus.Text := 'Translation suggestion accepted. Review the updated text.';
end;

procedure TfrmTranslationStudio.btnMarkTranslationReviewedClick(
  Sender: TObject);
var
  Entry: TTranslationEntry;
begin
  if (FTranslationCatalog = nil) or
     (lstCatalogEntries.ItemIndex < 0) then
  begin
    lblStatus.Text := 'Select a translated catalog entry first.';
    Exit;
  end;
  Entry := FTranslationCatalog.Entries[lstCatalogEntries.ItemIndex];
  if Trim(Entry.TranslatedText) = '' then
  begin
    lblStatus.Text := 'A blank translation cannot be marked reviewed.';
    Exit;
  end;
  Entry.Status := tsReviewed;
  lstCatalogEntries.Items[lstCatalogEntries.ItemIndex] :=
    Entry.Key + '  [' + TranslationStatusToString(Entry.Status) + ']';
  btnMarkTranslationReviewed.Enabled := False;
  btnApproveTranslation.Enabled := True;
  InvalidateValidation;
  UpdateCatalogReadiness;
  UpdateTranslationSuggestions(Entry);
  if FCatalogFileName <> '' then
    SaveCatalog;
  lblStatus.Text :=
    'Translation marked linguistically reviewed. Approval remains separate.';
end;

procedure TfrmTranslationStudio.btnApproveTranslationClick(Sender: TObject);
var
  Entry: TTranslationEntry;
begin
  if (FTranslationCatalog = nil) or
     (lstCatalogEntries.ItemIndex < 0) then
  begin
    lblStatus.Text := 'Select a reviewed catalog entry first.';
    Exit;
  end;
  Entry := FTranslationCatalog.Entries[lstCatalogEntries.ItemIndex];
  if Entry.Status <> tsReviewed then
  begin
    lblStatus.Text :=
      'Mark the translation Reviewed before granting final approval.';
    Exit;
  end;
  Entry.Status := tsApproved;
  lstCatalogEntries.Items[lstCatalogEntries.ItemIndex] :=
    Entry.Key + '  [' + TranslationStatusToString(Entry.Status) + ']';
  btnMarkTranslationReviewed.Enabled := False;
  btnApproveTranslation.Enabled := False;
  InvalidateValidation;
  UpdateCatalogReadiness;
  UpdateTranslationSuggestions(Entry);
  if FCatalogFileName <> '' then
    SaveCatalog;
  lblStatus.Text := 'Translation approved.';
end;

procedure TfrmTranslationStudio.btnReviewAllTranslationsClick(Sender: TObject);
var
  EligibleCount: Integer;
  Entry: TTranslationEntry;
begin
  if FTranslationCatalog = nil then
  begin
    lblStatus.Text := 'Open or create a catalog first.';
    Exit;
  end;
  EligibleCount := 0;
  for Entry in FTranslationCatalog.Entries do
    if (Trim(Entry.TranslatedText) <> '') and
       not (Entry.Status in [tsReviewed, tsApproved, tsExcluded,
         tsObsolete]) then
      Inc(EligibleCount);
  if EligibleCount = 0 then
  begin
    lblStatus.Text := 'No translated drafts are waiting for review.';
    Exit;
  end;
  if TDialogServiceSync.MessageDialog(Format(
    'Mark all %d translated drafts as Reviewed? This records one catalog-wide review decision; it does not change any translated text.',
    [EligibleCount]), TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], TMsgDlgBtn.mbNo, 0) <> mrYes then
    Exit;
  for Entry in FTranslationCatalog.Entries do
    if (Trim(Entry.TranslatedText) <> '') and
       not (Entry.Status in [tsReviewed, tsApproved, tsExcluded,
         tsObsolete]) then
      Entry.Status := tsReviewed;
  InvalidateValidation;
  DisplayCatalogEntries;
  if FCatalogFileName <> '' then
    SaveCatalog;
  lblStatus.Text := Format('%d translated drafts marked Reviewed.',
    [EligibleCount]);
end;

procedure TfrmTranslationStudio.btnApproveAllReviewedClick(Sender: TObject);
var
  ApprovedCount: Integer;
  Entry: TTranslationEntry;
begin
  if FTranslationCatalog = nil then
  begin
    lblStatus.Text := 'Open or create a catalog first.';
    Exit;
  end;
  ApprovedCount := 0;
  for Entry in FTranslationCatalog.Entries do
    if Entry.Status = tsReviewed then
      Inc(ApprovedCount);
  if ApprovedCount = 0 then
  begin
    lblStatus.Text := 'No Reviewed translations are waiting for approval.';
    Exit;
  end;
  if TDialogServiceSync.MessageDialog(Format(
    'Approve all %d Reviewed translations for runtime export?',
    [ApprovedCount]), TMsgDlgType.mtConfirmation,
    [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], TMsgDlgBtn.mbNo, 0) <> mrYes then
    Exit;
  for Entry in FTranslationCatalog.Entries do
    if Entry.Status = tsReviewed then
      Entry.Status := tsApproved;
  InvalidateValidation;
  DisplayCatalogEntries;
  if FCatalogFileName <> '' then
    SaveCatalog;
  lblStatus.Text := Format('%d Reviewed translations approved.',
    [ApprovedCount]);
end;

procedure TfrmTranslationStudio.btnTranslateMissingClick(Sender: TObject);
var
  ActiveCount: Integer;
  ApiKey: string;
  Entry: TTranslationEntry;
  EntryIndexes: TArray<Integer>;
  Index: Integer;
  MissingCount: Integer;
  ProtectedCount: Integer;
  SuspiciousCount: Integer;
  Provider: TTranslationProvider;
  ResolvedCount: Integer;
  SourceTexts: TArray<string>;
  TranslatedTexts: TArray<string>;
  Contexts: TArray<string>;
  ProviderCount: Integer;
  ResolvedText: string;
begin
  if FTranslationCatalog = nil then
  begin
    lblStatus.Text := 'Scan a project or open a catalog first.';
    Exit;
  end;
  try
    UpdateCatalogFromLanguageEditors;
    SaveProviderSettings;
    Provider := FProviderSettings.Provider;
    ApiKey := EffectiveApiKey(Provider);
    if ApiKey = '' then
    begin
      SetWorkflowStep(8);
      lblStatus.Text := Format(
        'Add and test a %s API key before translating.',
        [TranslationProviderDisplayName(Provider)]);
      Exit;
    end;
    ActiveCount := 0;
    TTerminologyResolver.ApplyAuthoritativeTerms(FTranslationCatalog);
    MissingCount := 0;
    ProtectedCount := 0;
    SuspiciousCount := 0;
    ResolvedCount := 0;
    for Entry in FTranslationCatalog.Entries do
    begin
      if Entry.Status = tsObsolete then
        Continue;
      Inc(ActiveCount);
      if Entry.TextOwnership = tokSuspicious then
      begin
        Inc(ProtectedCount);
        Inc(SuspiciousCount);
      end
      else if (Entry.Status = tsExcluded) or
         not TranslationEntryEligibleForAutomaticTranslation(Entry) then
        Inc(ProtectedCount)
      else if not (Entry.Status in [tsReviewed, tsApproved]) and
              ((Trim(Entry.TranslatedText) = '') or
               (Entry.Status in [tsNeedsTranslation, tsSourceChanged,
                 tsError])) then
        Inc(MissingCount)
      else
        Inc(ResolvedCount);
    end;
    if MissingCount = 0 then
    begin
      SaveCatalog;
      DisplayCatalogEntries;
      lblStatus.Text := 'No missing translations were found.';
      Exit;
    end;
    if TDialogServiceSync.MessageDialog(Format(
      'The catalog contains %d active entries: %d require translation, %d are protected or non-translatable (%d suspicious source strings require developer review), and %d are already resolved.' + sLineBreak + sLineBreak +
      'Send the %d unresolved source strings to %s? Reviewed and approved entries will remain unchanged. Results are saved automatically and marked Machine translated for review.',
      [ActiveCount, MissingCount, ProtectedCount, SuspiciousCount, ResolvedCount, MissingCount,
       TranslationProviderDisplayName(Provider)]),
      TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
      TMsgDlgBtn.mbNo, 0) <> mrYes then
      Exit;

    SetLength(EntryIndexes, MissingCount);
    SetLength(SourceTexts, MissingCount);
    SetLength(Contexts, MissingCount);
    ProviderCount := 0;
    for Index := 0 to FTranslationCatalog.Entries.Count - 1 do
    begin
      Entry := FTranslationCatalog.Entries[Index];
      if not (Entry.Status in [tsExcluded, tsObsolete,
        tsReviewed, tsApproved]) and
         TranslationEntryEligibleForAutomaticTranslation(Entry) and
         ((Trim(Entry.TranslatedText) = '') or
          (Entry.Status in [tsNeedsTranslation, tsSourceChanged,
            tsError])) then
      begin
        if TTerminologyResolver.TryTranslationMemory(FTranslationCatalog,
          Entry, ResolvedText) then
        begin
          Entry.TranslatedText := ResolvedText;
          Entry.Status := tsMachineTranslated;
          Entry.TranslationOrigin := torSuggestion;
          Entry.TranslationConfidence := 'translation-memory';
          Entry.TranslationReviewNote :=
            'Reused from a reviewed or approved entry with matching context.';
        end
        else if TTerminologyResolver.TryResolve(Entry,
          FTranslationCatalog.Locale.LanguageCode, ResolvedText,
          FTranslationCatalog.SourceLanguage) then
        begin
          Entry.TranslatedText := ResolvedText;
          Entry.Status := tsMachineTranslated;
          Entry.TranslationOrigin := torTerminology;
          Entry.TranslationConfidence := 'terminology';
          Entry.TranslationReviewNote := '';
        end
        else
        begin
          EntryIndexes[ProviderCount] := Index;
          SourceTexts[ProviderCount] := Entry.SourceText;
          Contexts[ProviderCount] := Entry.ContextDescription;
          Inc(ProviderCount);
        end;
      end;
    end;

    SetLength(EntryIndexes, ProviderCount);
    SetLength(SourceTexts, ProviderCount);
    SetLength(Contexts, ProviderCount);
    SaveCatalog;

    if ProviderCount = 0 then
    begin
      TTerminologyResolver.ApplyAuthoritativeTerms(FTranslationCatalog);
      DisplayCatalogEntries;
      InvalidateValidation;
      SaveCatalog;
      lblStatus.Text := Format(
        '%d entries resolved locally and saved. Review the results before export.',
        [MissingCount]);
      Exit;
    end;

    btnTranslateMissing.Enabled := False;
    BodyLayout.Enabled := False;
    NavigationCard.Enabled := False;
    FProviderOperationInProgress := True;
    FCloseAfterProviderOperation := False;
    TInterlocked.Exchange(FProviderCancelRequested, 0);
    lblStatus.Text := Format('Translating %d provider strings with %s...',
      [ProviderCount, TranslationProviderDisplayName(Provider)]);
    ShowOperation('Translating catalog', Format(
      'Preparing %d string(s) for %s...',
      [ProviderCount, TranslationProviderDisplayName(Provider)]), True);
    TThread.CreateAnonymousThread(
      procedure
      var
        BatchContexts: TArray<string>;
        BatchCount: Integer;
        BatchIndex: Integer;
        BatchOffset: Integer;
        BatchSourceTexts: TArray<string>;
        BatchTranslations: TArray<string>;
        ErrorText: string;
        LocalClient: TTranslationProviderClient;
      begin
        ErrorText := '';
        try
          LocalClient := TTranslationProviderClient.Create(Provider,
            FProviderSettings.DeepLPlan, ApiKey,
            FProviderSettings.RequestTimeoutSeconds,
            FProviderSettings.BatchSize);
          try
            SetLength(TranslatedTexts, ProviderCount);
            BatchOffset := 0;
            while BatchOffset < ProviderCount do
            begin
              BatchCount := Min(25, Min(Max(1, FProviderSettings.BatchSize),
                ProviderCount - BatchOffset));
              SetLength(BatchSourceTexts, BatchCount);
              SetLength(BatchContexts, BatchCount);
              for BatchIndex := 0 to BatchCount - 1 do
              begin
                BatchSourceTexts[BatchIndex] :=
                  SourceTexts[BatchOffset + BatchIndex];
                BatchContexts[BatchIndex] :=
                  Contexts[BatchOffset + BatchIndex];
              end;
              BatchTranslations := LocalClient.TranslateWithContexts(
                BatchSourceTexts, BatchContexts,
                FTranslationCatalog.SourceLanguage,
                FTranslationCatalog.Locale.LanguageCode,
                function: Boolean
                begin
                  Result := TInterlocked.CompareExchange(
                    FProviderCancelRequested, 0, 0) <> 0;
                end, nil);
              if Length(BatchTranslations) <> BatchCount then
                raise EInvalidOpException.Create(
                  'Provider returned a different number of translations.');
              TThread.Synchronize(nil,
                procedure
                var
                  LocalEntry: TTranslationEntry;
                  LocalIndex: Integer;
                begin
                  for LocalIndex := 0 to BatchCount - 1 do
                  begin
                    LocalEntry := FTranslationCatalog.Entries[
                      EntryIndexes[BatchOffset + LocalIndex]];
                    LocalEntry.TranslatedText := BatchTranslations[LocalIndex];
                    LocalEntry.Status := tsMachineTranslated;
                    if Provider = tpGoogle then
                    begin
                      LocalEntry.TranslationOrigin := torGoogle;
                      LocalEntry.TranslationConfidence := 'provider-basic';
                      if SameText(LocalEntry.ContextConfidence, 'unknown') or
                        ((Length(Trim(LocalEntry.SourceText)) <= 12) and
                         (LocalEntry.SemanticConcept = '')) then
                        LocalEntry.TranslationReviewNote :=
                          'Short or ambiguous text translated by Google Basic without provider-side context; review recommended.'
                      else
                        LocalEntry.TranslationReviewNote := '';
                    end
                    else
                    begin
                      LocalEntry.TranslationOrigin := torDeepL;
                      LocalEntry.TranslationConfidence := 'contextual-provider';
                      LocalEntry.TranslationReviewNote := '';
                    end;
                  end;
                  SaveCatalog;
                  lblOperationProgress.Text := Format(
                    'Saved %d of %d translated strings...',
                    [BatchOffset + BatchCount, ProviderCount]);
                  prgOperation.Value :=
                    ((BatchOffset + BatchCount) * prgOperation.Max) /
                    ProviderCount;
                end);
              for BatchIndex := 0 to BatchCount - 1 do
                TranslatedTexts[BatchOffset + BatchIndex] :=
                  BatchTranslations[BatchIndex];
              Inc(BatchOffset, BatchCount);
            end;
          finally
            LocalClient.Free;
          end;
        except
          on E: Exception do
            ErrorText := E.Message;
        end;
        TThread.Queue(nil,
          procedure
          var
            LocalEntry: TTranslationEntry;
            LocalIndex: Integer;
          begin
            try
              if ErrorText <> '' then
              begin
                if TInterlocked.CompareExchange(
                  FProviderCancelRequested, 0, 0) <> 0 then
                  lblStatus.Text := 'Bulk translation cancelled.'
                else
                  lblStatus.Text := 'Bulk translation failed: ' + ErrorText;
              end
              else
              begin
                for LocalIndex := 0 to High(TranslatedTexts) do
                begin
                  LocalEntry := FTranslationCatalog.Entries[
                    EntryIndexes[LocalIndex]];
                  LocalEntry.TranslatedText := TranslatedTexts[LocalIndex];
                  LocalEntry.Status := tsMachineTranslated;
                  if Provider = tpGoogle then
                    LocalEntry.TranslationOrigin := torGoogle
                  else
                    LocalEntry.TranslationOrigin := torDeepL;
                  if Provider = tpGoogle then
                  begin
                    LocalEntry.TranslationConfidence := 'provider-basic';
                    if SameText(LocalEntry.ContextConfidence, 'unknown') or
                      ((Length(Trim(LocalEntry.SourceText)) <= 12) and
                       (LocalEntry.SemanticConcept = '')) then
                      LocalEntry.TranslationReviewNote :=
                        'Short or ambiguous text translated by Google Basic without provider-side context; review recommended.'
                    else
                      LocalEntry.TranslationReviewNote := '';
                  end
                  else
                  begin
                    LocalEntry.TranslationConfidence := 'contextual-provider';
                    LocalEntry.TranslationReviewNote := '';
                  end;
                end;
                TTerminologyResolver.ApplyAuthoritativeTerms(
                  FTranslationCatalog);
                DisplayCatalogEntries;
                InvalidateValidation;
                SaveCatalog;
                lblStatus.Text := Format(
                  '%d entries resolved and saved; %d were sent to the provider. Review flagged ambiguous results before export.',
                  [MissingCount, Length(TranslatedTexts)]);
              end;
            except
              on E: Exception do
                lblStatus.Text := 'Bulk translation failed: ' + E.Message;
            end;
            FProviderOperationInProgress := False;
            HideOperation;
            BodyLayout.Enabled := True;
            NavigationCard.Enabled := True;
            btnTranslateMissing.Enabled := True;
            if FCloseAfterProviderOperation then
            begin
              FCloseAfterProviderOperation := False;
              Close;
            end;
          end);
      end).Start;
    Exit;
  except
    on E: Exception do
      lblStatus.Text := 'Bulk translation failed: ' + E.Message;
  end;
  btnTranslateMissing.Enabled := True;
end;

procedure TfrmTranslationStudio.btnValidateCatalogClick(Sender: TObject);
begin
  try
    if FBatchReady then
    begin
      ValidateBatchCatalogs;
      Exit;
    end;
    RunCatalogValidation;
    SetWorkflowStep(5);
    if FValidationResult.HasErrors then
      lblStatus.Text := 'Validation found errors that block export.'
    else
      lblStatus.Text :=
        'Validation passed. Export the runtime pack when you are ready.';
  except
    on E: Exception do
      lblStatus.Text := 'Unable to validate catalog: ' + E.Message;
  end;
end;

procedure TfrmTranslationStudio.ValidateBatchCatalogs;
var
  Catalog: TTranslationCatalog;
  CatalogChanged: Boolean;
  CatalogFileName: string;
  CurrentEntry: TTranslationEntry;
  ErrorCount: Integer;
  Entry: TTranslationEntry;
  Index: Integer;
  Issue: TValidationIssue;
  IssueInfo: TBatchValidationIssueInfo;
  IssueSeverity: TValidationSeverity;
  PreviousTarget: Integer;
  ReadyCount: Integer;
  RepairedCount: Integer;
  RepairedText: string;
  Row: Integer;
  ResultItem: TCatalogValidationResult;
  SourceLanguage: string;
  TargetCode: string;
  WarningCount: Integer;
begin
  if not FBatchReady then
    raise EInvalidOpException.Create('Review the translated languages first.');
  if FTranslationCatalog <> nil then
    SaveCatalog;
  PreviousTarget := -1;
  if (lstValidationLanguages.ItemIndex >= 0) and
     (lstValidationLanguages.ItemIndex < Length(FBatchValidationOrder)) then
    PreviousTarget := FBatchValidationOrder[lstValidationLanguages.ItemIndex];
  SourceLanguage := SelectedLanguageCode(cboProjectSourceLanguage);
  FBatchValidated := False;
  FBatchReadyToExport := False;
  btnExportValidatedLanguages.Enabled := False;
  ErrorCount := 0;
  WarningCount := 0;
  ReadyCount := 0;
  RepairedCount := 0;
  SetLength(FBatchValidationIssues, Length(FBatchTargets));
  SetLength(FBatchValidationErrors, Length(FBatchTargets));
  SetLength(FBatchValidationWarnings, Length(FBatchTargets));
  SetLength(FBatchValidationOrder, 0);
  for Index := 0 to High(FBatchTargets) do
  begin
    TargetCode := FBatchTargets[Index];
    CatalogFileName := TTranslationWorkspace.DevelopmentCatalogFileName(
      FProjectProfile, TargetCode, SourceLanguage);
    Catalog := TCatalogJson.LoadFromFile(CatalogFileName);
    try
      if not SameText(Catalog.SourceLanguage, SourceLanguage) or
         not SameText(Catalog.Locale.LanguageCode, TargetCode) then
        raise EInvalidOpException.Create(TargetCode + ' catalog pair does not match.');
      CatalogChanged := False;
      for Entry in Catalog.Entries do
        if (Entry.Status = tsMachineTranslated) and
           TPlaceholderProtection.TryRepairSimpleReorder(
             Entry.SourceText, Entry.TranslatedText, RepairedText) then
        begin
          Entry.TranslatedText := RepairedText;
          CatalogChanged := True;
          Inc(RepairedCount);
          if (FTranslationCatalog <> nil) and
             SameText(FTranslationCatalog.Locale.LanguageCode, TargetCode) then
            for CurrentEntry in FTranslationCatalog.Entries do
              if SameText(CurrentEntry.Key, Entry.Key) then
              begin
                CurrentEntry.TranslatedText := RepairedText;
                Break;
              end;
        end;
      if CatalogChanged then
        TCatalogJson.SaveToFile(Catalog, CatalogFileName);
      ResultItem := TCatalogValidator.Validate(Catalog);
      try
        FBatchValidationErrors[Index] := ResultItem.CountBySeverity(vsError);
        FBatchValidationWarnings[Index] := ResultItem.CountBySeverity(vsWarning);
        Inc(ErrorCount, FBatchValidationErrors[Index]);
        Inc(WarningCount, FBatchValidationWarnings[Index]);
        if FBatchValidationErrors[Index] = 0 then
          Inc(ReadyCount);
        SetLength(FBatchValidationIssues[Index], 0);
        for IssueSeverity in [vsError, vsWarning, vsInformation] do
          for Issue in ResultItem.Issues do
            if Issue.Severity = IssueSeverity then
            begin
              IssueInfo.Severity := Issue.Severity;
              IssueInfo.EntryKey := Issue.EntryKey;
              IssueInfo.MessageText := Issue.MessageText;
              IssueInfo.SourceText := '';
              IssueInfo.TranslatedText := '';
              if (Issue.Severity = vsError) and
                 SameText(Issue.Code, 'entry.placeholders') then
                for Entry in Catalog.Entries do
                  if SameText(Entry.Key, Issue.EntryKey) then
                  begin
                    IssueInfo.SourceText := Entry.SourceText;
                    IssueInfo.TranslatedText := Entry.TranslatedText;
                    Break;
                  end;
              SetLength(FBatchValidationIssues[Index],
                Length(FBatchValidationIssues[Index]) + 1);
              FBatchValidationIssues[Index][High(FBatchValidationIssues[Index])] :=
                IssueInfo;
            end;
      finally
        ResultItem.Free;
      end;
    finally
      Catalog.Free;
    end;
  end;
  for Index := 0 to High(FBatchTargets) do
    if FBatchValidationErrors[Index] > 0 then
    begin
      SetLength(FBatchValidationOrder, Length(FBatchValidationOrder) + 1);
      FBatchValidationOrder[High(FBatchValidationOrder)] := Index;
    end;
  for Index := 0 to High(FBatchTargets) do
    if FBatchValidationErrors[Index] = 0 then
    begin
      SetLength(FBatchValidationOrder, Length(FBatchValidationOrder) + 1);
      FBatchValidationOrder[High(FBatchValidationOrder)] := Index;
    end;
  lstValidationLanguages.OnChange := nil;
  try
    lstValidationLanguages.Items.Clear;
    for Row := 0 to High(FBatchValidationOrder) do
    begin
      Index := FBatchValidationOrder[Row];
      lstValidationLanguages.Items.Add(Format('%s  |  %d errors  |  %d warnings',
        [FBatchTargets[Index], FBatchValidationErrors[Index],
         FBatchValidationWarnings[Index]]));
      if Index = PreviousTarget then
        lstValidationLanguages.ItemIndex := Row;
    end;
    if (lstValidationLanguages.ItemIndex < 0) and
       (lstValidationLanguages.Count > 0) then
      lstValidationLanguages.ItemIndex := 0;
  finally
    lstValidationLanguages.OnChange := lstValidationLanguagesChange;
  end;
  DisplayBatchValidationIssues;
  FBatchValidated := ErrorCount = 0;
  FBatchReadyToExport := ReadyCount > 0;
  btnExportValidatedLanguages.Enabled := FBatchReadyToExport;
  SetWorkflowStep(5);
  if FBatchValidated then
  begin
    lblValidationSummary.Text := Format(
      '%d languages passed; %d warnings. %d safe format reorder(s) repaired. ' +
      'Review warnings; export when ready.',
      [Length(FBatchTargets), WarningCount, RepairedCount]);
    lblStatus.Text :=
      'All languages passed validation. Choose Export and deploy, or Finish without exporting.';
  end
  else
  begin
    lblValidationSummary.Text := Format(
      '%d of %d languages ready; %d errors remain in %d languages. ' +
      'Export the ready languages now, or select an error to correct it.',
      [ReadyCount, Length(FBatchTargets), ErrorCount,
       Length(FBatchTargets) - ReadyCount]);
    if FBatchReadyToExport then
      lblStatus.Text := Format(
        'Export and deploy will include only the %d validated languages. ' +
        'The other %d remain saved drafts.',
        [ReadyCount, Length(FBatchTargets) - ReadyCount])
    else
      lblStatus.Text := Format(
        'No language can be exported yet. Correct the %d errors and validate again.',
        [ErrorCount]);
  end;
end;

procedure TfrmTranslationStudio.DisplayBatchValidationIssues;
var
  BatchIndex: Integer;
  Issue: TBatchValidationIssueInfo;
  IssueIndex: Integer;
begin
  lstValidationIssues.Items.Clear;
  if (lstValidationLanguages.ItemIndex < 0) or
     (lstValidationLanguages.ItemIndex >= Length(FBatchValidationOrder)) then
  begin
    memValidationIssueDetail.Text := 'Select a language to see its issues.';
    Exit;
  end;
  BatchIndex := FBatchValidationOrder[lstValidationLanguages.ItemIndex];
  for IssueIndex := 0 to High(FBatchValidationIssues[BatchIndex]) do
  begin
    Issue := FBatchValidationIssues[BatchIndex][IssueIndex];
    lstValidationIssues.Items.Add(Format('[%s] %s  %s',
      [ValidationSeverityDisplayName(Issue.Severity),
       Issue.EntryKey, Issue.MessageText]));
  end;
  if lstValidationIssues.Count > 0 then
    lstValidationIssues.ItemIndex := 0
  else
    memValidationIssueDetail.Text := 'This language has no validation issues.';
end;

procedure TfrmTranslationStudio.btnExportValidatedLanguagesClick(
  Sender: TObject);
begin
  if not (FBatchReadyToExport or
    ((not FBatchReady) and (FValidationResult <> nil) and
     not FValidationResult.HasErrors)) then
  begin
    lblStatus.Text := 'Validate at least one language successfully before exporting.';
    Exit;
  end;
  if FBatchReady then
    SetWorkflowStep(6)
  else
  begin
    SetWorkflowStep(6);
    btnExportRuntimePackClick(Sender);
  end;
end;

procedure TfrmTranslationStudio.btnExportRuntimePackClick(Sender: TObject);
var
  Entry: TTranslationEntry;
  Item: TScanItem;
  RuntimeEntryCount: Integer;
  RuntimeFileName: string;
begin
  if FExportInProgress then
    Exit;
  FExportInProgress := True;
  try
    ShowOperation('Exporting language pack',
      'Please wait while the catalog is checked and the runtime pack is written.',
      False);
    BodyLayout.Enabled := False;
    NavigationCard.Enabled := False;
    OperationCard.Repaint;
    try
      if FScanResult = nil then
        raise Exception.Create(
          'Scan the open project before exporting. This confirms that the catalog matches the saved Delphi forms and source files.');
    for Item in FScanResult.Items do
      if TFile.Exists(Item.SourceFileName) and
         (TFile.GetLastWriteTime(Item.SourceFileName) >
          FLastScanCompletedAt) then
        raise Exception.CreateFmt(
          'The source file "%s" was saved after the last scan. Save all files in Delphi, scan the project again, translate any new entries, and then export.',
          [Item.SourceFileName]);
    SaveCatalog;
    RunCatalogValidation;
    if FValidationResult.HasErrors then
    begin
      SetWorkflowStep(5);
      lblStatus.Text := 'Export is blocked by validation errors.';
      Exit;
    end;

    RuntimeFileName := TTranslationWorkspace.RuntimePackFileName(
      FProjectProfile, FTranslationCatalog.Locale.LanguageCode,
      FTranslationCatalog.SourceLanguage);
    TRuntimePackBuilder.ExportToFile(FTranslationCatalog, RuntimeFileName,
      TPath.Combine(FindStudioProjectRoot,
        TPath.Combine('export\localization-review',
          TPath.Combine(FProjectProfile.ProjectName,
            TPath.Combine(FTranslationCatalog.Locale.LanguageCode,
              'layout-proposal.json')))));
    lblExportPathValue.Text := RuntimeFileName;
    RuntimeEntryCount := 0;
    for Entry in FTranslationCatalog.Entries do
      if RuntimeTextRoleRequiresTranslation(Entry.RuntimeTextRole) and
         not (Entry.Status in [tsExcluded, tsObsolete]) then
        Inc(RuntimeEntryCount);
    lblExportSummary.Text := Format(
      '%d runtime entries exported successfully.',
      [RuntimeEntryCount]);
    lblStatus.Text := 'Offline runtime language pack created.';
      if FWorkflowStep = 6 then
        btnWorkflowNext.Enabled := True;
    except
      on E: Exception do
        lblStatus.Text := 'Unable to export runtime pack: ' + E.Message;
    end;
  finally
    BodyLayout.Enabled := True;
    NavigationCard.Enabled := True;
    HideOperation;
    FExportInProgress := False;
  end;
end;

procedure TfrmTranslationStudio.btnExportBatchClick(Sender: TObject);
var
  Catalog: TTranslationCatalog;
  CatalogFileName: string;
  DeploymentDirectories: TStringList;
  DestinationDirectory: string;
  ExecutableDirectory: string;
  Index: Integer;
  Item: TScanItem;
  PackDirectory: string;
  ReadyTargets: TArray<string>;
  RuntimeFileName: string;
  SourceLanguage: string;
  TargetCode: string;
  Validation: TCatalogValidationResult;
begin
  if FExportInProgress then
    Exit;
  if not FBatchReady or not FBatchReadyToExport or
     (Length(FBatchValidationErrors) <> Length(FBatchTargets)) then
  begin
    lblStatus.Text := 'Validate at least one saved language before export.';
    Exit;
  end;
  SetLength(ReadyTargets, 0);
  for Index := 0 to High(FBatchTargets) do
    if FBatchValidationErrors[Index] = 0 then
    begin
      SetLength(ReadyTargets, Length(ReadyTargets) + 1);
      ReadyTargets[High(ReadyTargets)] := FBatchTargets[Index];
    end;
  if Length(ReadyTargets) = 0 then
  begin
    lblStatus.Text := 'No validated language is ready to export.';
    Exit;
  end;
  DeploymentDirectories := TStringList.Create;
  try
    DeploymentDirectories.Sorted := True;
    DeploymentDirectories.CaseSensitive := False;
    DeploymentDirectories.Duplicates := dupIgnore;
    for DestinationDirectory in
      TTargetBuildDeployer.ExistingBuildOutputDirectories(
        FProjectProfile.ProjectFileName, FProjectProfile.ProjectName,
        FProjectProfile.SupportsWin32, FProjectProfile.SupportsWin64) do
      if TFile.Exists(TPath.Combine(DestinationDirectory,
        FProjectProfile.ProjectName + '.exe')) then
        DeploymentDirectories.Add(DestinationDirectory);
    ExecutableDirectory := TPath.Combine(
      TPath.GetDirectoryName(FProjectProfile.ProjectFileName), 'Executable');
    if TFile.Exists(TPath.Combine(ExecutableDirectory,
      FProjectProfile.ProjectName + '.exe')) then
      DeploymentDirectories.Add(ExecutableDirectory);
    if TDialogServiceSync.MessageDialog(Format(
      'Export %d validated target languages and deploy them beside the ' +
      'application executable?' + sLineBreak + sLineBreak +
      '%d language(s) with errors remain saved as drafts and will not be ' +
      'included. Existing deployed language folders are replaced by the ' +
      'validated set and the original-language pack.' + sLineBreak + sLineBreak +
      'The Studio will build a Release target and replace the language-pack ' +
      'folders at these existing executable locations:' + sLineBreak + '%s' +
      sLineBreak + 'The project Localization\Languages build source will ' +
      'receive the same packs for future builds.' +
      sLineBreak + 'Archived portable exports are not changed. Continue?',
      [Length(ReadyTargets), Length(FBatchTargets) - Length(ReadyTargets),
       DeploymentDirectories.Text]),
      TMsgDlgType.mtConfirmation,
      [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],
      TMsgDlgBtn.mbNo, 0) <> mrYes then
      Exit;
  FExportInProgress := True;
  try
    ShowOperation('Exporting and deploying languages',
      Format('Please wait. Checking %d language catalogs before export.',
        [Length(ReadyTargets)]), False);
    BodyLayout.Enabled := False;
    NavigationCard.Enabled := False;
    OperationCard.Repaint;
    try
      if FScanResult = nil then
        raise EInvalidOpException.Create('Scan the project again before export.');
    for Item in FScanResult.Items do
      if TFile.Exists(Item.SourceFileName) and
         (TFile.GetLastWriteTime(Item.SourceFileName) > FLastScanCompletedAt) then
        raise EInvalidOpException.Create('A saved project file changed after scanning. Scan again before export.');
    SourceLanguage := SelectedLanguageCode(cboProjectSourceLanguage);
    if SourceLanguage = '' then
      raise EInvalidOpException.Create('Confirm the project source language first.');
    { Check every catalog before writing the first runtime pack. }
    for TargetCode in ReadyTargets do
    begin
      CatalogFileName := TTranslationWorkspace.DevelopmentCatalogFileName(
        FProjectProfile, TargetCode, SourceLanguage);
      Catalog := TCatalogJson.LoadFromFile(CatalogFileName);
      try
        if not SameText(Catalog.SourceLanguage, SourceLanguage) or
           not SameText(Catalog.Locale.LanguageCode, TargetCode) then
          raise EInvalidOpException.Create(TargetCode + ' catalog pair does not match.');
        Validation := TCatalogValidator.Validate(Catalog);
        try
          if Validation.HasErrors then
            raise EInvalidOpException.Create(TargetCode +
              ' has validation errors. Return to Validation.');
        finally
          Validation.Free;
        end;
      finally
        Catalog.Free;
      end;
    end;
    for Index := 0 to High(ReadyTargets) do
    begin
      TargetCode := ReadyTargets[Index];
      lblOperationProgress.Text := Format(
        'Exporting %s (%d of %d). Please wait.',
        [TargetCode, Index + 1, Length(ReadyTargets)]);
      prgOperation.Value :=
        ((Index + 1) * prgOperation.Max * 0.8) / Length(ReadyTargets);
      OperationCard.Repaint;
      CatalogFileName := TTranslationWorkspace.DevelopmentCatalogFileName(
        FProjectProfile, TargetCode, SourceLanguage);
      Catalog := TCatalogJson.LoadFromFile(CatalogFileName);
      try
        RuntimeFileName := TTranslationWorkspace.RuntimePackFileName(
          FProjectProfile, TargetCode, SourceLanguage);
        TRuntimePackBuilder.ExportToFile(Catalog, RuntimeFileName,
          TPath.Combine(FindStudioProjectRoot,
            TPath.Combine('export\localization-review',
              TPath.Combine(FProjectProfile.ProjectName,
                TPath.Combine(TargetCode, 'layout-proposal.json')))));
      finally
        Catalog.Free;
      end;
    end;
    lblExportPathValue.Text := RuntimeFileName;
    lblExportSummary.Text := Format(
      '%d source-matched runtime packs exported.', [Length(ReadyTargets)]);
    lblOperationProgress.Text :=
      'Language packs are ready. Preparing dependencies and building the target application. Please wait.';
    OperationCard.Repaint;
    SetWorkflowStep(7);
    FIntegrationPackageDirectory := '';
    btnGenerateIntegrationPackageClick(Sender);
    if FIntegrationPackageDirectory = '' then
      raise EInvalidOpException.Create('Runtime packs were exported, but integration preparation needs attention. See the Integration page.');
    if FIntegrationBuildError <> '' then
      raise EInvalidOpException.Create(
        'Runtime packs were exported, but the Release build or dependency ' +
        'preparation failed: ' + FIntegrationBuildError);
    PackDirectory := TPath.Combine(FIntegrationPackageDirectory,
      'Localization\Languages');
    TTargetBuildDeployer.DeployLanguagePacks(PackDirectory,
      TPath.Combine(TPath.GetDirectoryName(FProjectProfile.ProjectFileName),
        'Localization\Languages'), FProjectProfile.ProjectName);
    for Index := 0 to DeploymentDirectories.Count - 1 do
    begin
      DestinationDirectory := DeploymentDirectories[Index];
      lblOperationProgress.Text := Format(
        'Deploying packs beside executable %d of %d. Please wait.',
        [Index + 1, DeploymentDirectories.Count]);
      OperationCard.Repaint;
      TTargetBuildDeployer.DeployLanguagePacks(PackDirectory,
        TPath.Combine(DestinationDirectory, 'Localization\Languages'),
        FProjectProfile.ProjectName);
    end;
    lblIntegrationSummary.Text := Format(
      '%d target languages and the source pack prepared for %d existing ' +
      'executable folder(s), plus the Release build. Check each output below.',
      [Length(ReadyTargets), DeploymentDirectories.Count]);
    for DestinationDirectory in DeploymentDirectories do
      memIntegrationDiff.Lines.Add('Verified deployment: ' +
        TPath.Combine(DestinationDirectory, 'Localization\Languages'));
    FBatchExportedTargets := Copy(ReadyTargets, 0, Length(ReadyTargets));
    SaveBatchSession;
    SetWorkflowStep(7);
    lblStatus.Text := Format(
      '%d target languages exported and deployed. Test the application in ' +
      'each updated executable folder. Choose Add languages at left to ' +
      'continue, or Finish for now.', [Length(ReadyTargets)]);
    prgOperation.Value := prgOperation.Max;
    except
      on E: Exception do
        lblStatus.Text := 'Unable to export and deploy batch: ' + E.Message;
    end;
  finally
    BodyLayout.Enabled := True;
    NavigationCard.Enabled := True;
    HideOperation;
    FExportInProgress := False;
  end;
  finally
    DeploymentDirectories.Free;
  end;
end;

end.

