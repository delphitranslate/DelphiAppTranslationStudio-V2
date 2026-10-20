# Delphi App Translation Studio Help

Last changed: October 2, 2026

This help text describes the local Version 2 source-language work. The
public website and its downloads still provide Version 1.0.0. Do not mix a
Version 2 executable, component kit, language pack, or dependency with the
published release.

## Purpose

Delphi App Translation Studio scans Windows Delphi VCL and FireMonkey projects,
builds editable language catalogs, translates unresolved text automatically
through Google Cloud Translation or DeepL, validates translation safety,
exports offline JSON packs, and generates a non-mutating component setup kit.

The developer computer needs Internet access only while using a translation
provider. Finished applications use local JSON packs and remain completely
offline. No API key is added to the target application's source or deployment.

## Workflow

1. Open a `.dproj` or `.dpr` under **Project**.
2. Select **Scan** to inventory designer text and `resourcestring` declarations.
3. Under **Provider Settings**, select Google Cloud Translation or DeepL.
4. Paste the provider API key into the masked field, choose secure remembered
   storage or session-only use, select **Replace / Save Key**, and then select
   **Test Connection**.
5. Under **Project/Scan**, select the language actually saved in the Delphi
   project, then under **Translate** choose a different target language. For
   example, use `fr-FR` for an existing French interface and `de-DE` for
   German output. Open **Details & Tools > Locale settings** only when the
   native name, direction, or formats need adjustment.
6. Under **Details & Tools > Catalog actions**, choose **Translate unresolved...**.
   Confirm the provider and unresolved
   entry count. The Studio translates eligible entries in batches and saves the
   development catalog automatically.
7. Review Machine translated entries for meaning, placeholders, accelerators,
   terminology, tone, and available control space. Use the selected-entry
   actions for focused work. Bulk **Review All** and **Approve All** are under
   **Details & Tools > Catalog actions** and require confirmation.
8. Run **Validation**. Errors block export; warnings request review. Double-click
   an issue to open its catalog entry, then export the offline JSON pack.
9. Under **Integration**, leave **Component Integration (Recommended)** selected
   and choose **Prepare / Update Dependencies**. The Studio creates a verified
   kit, previous-dependency snapshot, complete project-local dependency,
   temporary build Search Path, direct pack deployment, and baseline Release
   build without writing target project files. In RAD Studio Project Options,
   add `$(PROJECTDIR)\dependencies\DelphiAppTranslation\source` once for normal
   IDE builds. Use
   **Show Design BPL** for the one manual IDE step: Component > Install Packages
   > Add. The exact design BPL and its required runtime BPLs are together under
   the kit's `DesignPackages\Win32\Release` folder.
10. Optionally place the matching language combo box and assign its
    `LanguageManager` property in the Object Inspector.

### Add several target languages at once

After opening a saved project, choose its **Original app language** on the
Project/Scan screen: this is the language already written in the saved forms
and `resourcestring` values. Run **Scan Project**, then choose **Next: Languages**.
Select individual target locales or choose **Select All**; the exact source
locale is excluded. **Clear** removes every selection. Once a project has a
saved language, **Add more languages** appears on the review summary and the
orange **Add languages** action appears in the left panel. Both let you extend
the same project without discarding earlier languages. Languages already added
are unavailable in the new-target list.

Before **Add Languages...**, configure a provider and key under **Provider
Settings** and save your Delphi source/form changes. The confirmation states
the selected count, provider, possible API charges, and review obligation.
The Studio scans the project once and works through the selected targets in
order. For each pair it loads or creates the corresponding development catalog,
preserves reviewed/approved work, applies available terminology and memory,
and requests only unresolved text from the provider. The results list reports
each outcome. After the targets succeed, choose **Next: Review**. The Translate
editor identifies the current language and its position in the batch. Check
wording, native display name, direction, formats, and approval status, then
choose **Save & next**. After the last language, **Finish review** opens a
summary where you can finish without exporting, review again, or validate. Draft
catalogs remain saved if you finish; no runtime pack is exported or deployed
automatically. The selected language batch is saved with the project, so you
can reopen it and resume review or validation without selecting and translating
all the targets again. After reopening and scanning the project, choose
**Resume language work** to return to the review summary, or use the orange
**Add languages** action to select new targets immediately.

Validation is optional until export. When you decide to release the languages,
run **Validate languages**. Validation shows each selected language and its
specific errors and warnings, placing languages with errors first. Select a
language to inspect its issues. Double-click an error to open the corresponding
translation or catalog setting, save the correction, and return to Validation.
Validation checks each language separately. If some languages pass and others
have errors, choose **Export ready languages** to deploy only those that passed.
The others remain saved as drafts; correct their errors, validate again, and
export again when ready. Warnings request review but do not alone block export.
**Finish without exporting** keeps all draft catalogs. For one catalog the
action reads **Export language pack**.

Format markers such as `%d` (a number) and `%s` (text) are replaced by the
application at runtime. Validation automatically numbers markers in saved
machine translations when two distinct markers have simply exchanged places.
The original wording is retained, and the corrected catalog is saved. If an
error remains, select it to see the original and translated text. Messages
with several `%s` markers may need a new translation or a developer's review:
the saved text does not identify which runtime value each repeated marker was
meant to receive. Do not remove a marker merely to clear the error.

A please-wait card shows catalog checks, each pack export, and integration
preparation. Before a batch deployment, confirm the number of ready languages
and the listed executable folders. Deployment replaces each destination's
language-pack folder with the validated set and original-language pack; packs
not in that set are not deployed.
Wait for the final result; inspect Integration if a build needs attention. This
creates the offline packs, prepares the project-local dependency, builds a
Release target, and places the selected language packs next to existing
application executables and in the project's language-pack build source.
After a successful export, choose **Add languages** on the left to continue
with another target, or **Finish** for now. Each later export includes the
previously added languages as well as the new ones, so their deployed packs
remain available. Repeat this add, review, validate, and export cycle as often
as needed.
Archived portable exports are not changed. The Studio does not modify the
target `.dproj`, Pascal, DFM, or FMX files.
If a target fails, earlier completed draft catalogs remain; correct the problem
and retry. Automatic translations are not silently approved.

The Setup Wizard has the same source/target choice at Step 4. Changing either
choice invalidates an earlier Wizard scan. The chosen source must match the
text already saved in forms and resources; the Studio does not detect it for
you or translate Pascal statements. Traditional Chinese (`zh-TW`) is a source
option. Simplified Chinese (`zh-CN`) is deferred as a source but remains a
target option. The Wizard and Maintenance Studio each show 46 source locales
and 47 target locales. An exact source/target match is rejected. The source
list is not a promise that every translation provider supports every pair.
If a regional pair collapses to the same provider language code, automatic
translation stops and asks for another workflow.

## Automatic Provider Translation

Only Needs Translation, Source Changed, and Error entries are sent. Reviewed,
Approved, Excluded, and Obsolete entries are never overwritten automatically.
Each returned value is marked Machine translated and records Google or DeepL
as its origin. Results are not silently approved.

If no key is configured, **Translate unresolved...** opens Provider Settings
and explains what is missing. Provider failures are reported without exposing
the key. Existing catalog data remains available for correction or retry.

## Provider Settings

The provider list contains only DeepL and Google Cloud Translation. DeepL users
must also choose API Free or API Pro so the matching endpoint is used. Google
uses Cloud Translation Basic v2, which supports API-key authentication.

The API key field is masked. Leave **Remember securely on this computer**
checked to store the key as a Windows Generic Credential for the current user.
Clear it to use the key only until the Studio closes. **Replace / Save Key**
records the chosen key. The Wizard's **Test Connection** makes a small request
for its selected source/target pair; the general Maintenance provider-settings
test retains its default diagnostic pair. **Remove Key** deletes both stored
and session copies for the selected provider.

The current provider adapters normalize source locales to their base
languages. They cannot reliably translate `fr-FR` to `fr-CA`, `en-GB` to
`en-US`, or another pair of regional variants of the same base language.
Automatic translation rejects that pair rather than presenting unchanged
provider text as a result. Use human regional adaptation until a separate
supported workflow is designed. A connection test proves only the tested pair,
not every pair in the selector.

Keys are never written to provider settings JSON, language catalogs, exported
runtime packs, source distributions, logs, or Git.

## Optional CSV Interchange

The development JSON catalog is the lossless record. These actions are under
**Details & Tools > Catalog actions**; they are not part of ordinary review.
**Export CSV** creates a
UTF-8 translator-friendly file. Edit only the Translation column. **Import
CSV** stages changes and reports duplicate or unknown keys, stale source data,
and protected Reviewed/Approved entries before applying anything. Imported text
is marked Imported and is never approved automatically.

## Files

Development catalogs live under
`%LOCALAPPDATA%\DelphiAppTranslationStudio\Workspaces\<Project>\Development`.
For non-English source projects, the filename includes both codes, such as
`<Project>.fr-FR.de-DE.translation-project.json`. Project glossaries use the
same pair under the workspace's `Glossaries` folder. Existing `en-US`
catalog/glossary filenames remain unchanged for compatibility.

Shared dictionaries and translation memory live under Public Documents in
`Delphi App Translation\Dictionaries` and `Delphi App Translation\Memory`.
Their non-English-source filenames include both source and target codes, so
French-to-German decisions cannot be applied to English-to-German work.
Workspace runtime packs are stored as `<target>.json` under the workspace's
`Languages` folder. Integrated applications read complete compatible packs
from `Localization\Languages` beside the executable and save the selected
language under `%LOCALAPPDATA%\<ApplicationId>\language.ini`.

Designer-property entries are applied by the VCL or FMX runtime adapter. Pascal
`resourcestring` entries require an explicit generated `TranslateText` call;
mark manual wiring confirmed only after reviewing that code location.

## Component Integration and Safety

Scanning does not alter target source. Recommended Component Integration writes
the external kit and atomically refreshes the target's single managed
`dependencies\DelphiAppTranslation` tree. It does not rewrite target Pascal,
DPR, DPROJ, DFM, or FMX files. Studio-initiated builds receive a temporary
Search Path and packs are deployed directly. The normal IDE Search Path remains
a one-time developer-owned Project Options setting. Component placement remains
in Delphi's Form Designer, where it stays visible and editable.

Never select a `.dpk` in Delphi's **Component > Install Component** wizard.
The `.dpk` is package source. Choose **Show Design BPL**, then use **Component >
Install Packages > Add** on that exact Win32 design BPL. Keep the adjacent core
and framework runtime BPLs in place. The Studio deliberately does not register
or unregister IDE packages automatically.

The component kit creates a complete runtime pack for the selected authored
source language from the latest scan, such as `fr-FR.json` for a French
project. It refuses to mix saved packs with different recorded source
languages. It normalizes and de-duplicates language names and installs a
compatible JSON pack set. A
language selection immediately refreshes every open form; newly created forms
receive the saved language through the manager's additive lifecycle adapter.

One manager on the primary form covers the application. A language selector is
optional and is also placed and configured in the Form Designer. Automatic
Source Integration remains available as an advanced fallback; it retains the
exact preview, verified backup, atomic Apply, Restore, and Complete Reset safety
workflow.

## Support

Consult the User Guide for detailed Google and DeepL account/key instructions,
all controls, status meanings, troubleshooting, deployment, and
self-translation. Consult the Engineering Guide for provider protocols,
credential storage, schemas, runtime behavior, transactional integration, and
build validation.

The local `docs\guides\V2 Source-Language Notes.md` records what is
new in Version 2 and what still requires testing. The published guides
on the website describe Version 1.0.0 until a later release is approved.
