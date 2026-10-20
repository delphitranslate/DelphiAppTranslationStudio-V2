# Delphi App Translation Studio 2.0

Delphi App Translation Studio helps Delphi developers create, review, and deploy offline language packs for Windows VCL and FireMonkey applications. It reads the language already written in a saved project and supports translation into one or more target languages.

This is the separate public **V2 source repository**. It contains source code, build tools, test contracts, samples, and guides. It does not host a compiled download, GitHub Release, or the public website. Version 1 remains on the existing website until a separate publication decision is made.

## What the Studio does

- Scans saved forms, Delphi resources, and supported runtime text.
- Keeps an editable catalog for each source-to-target language pair.
- Requests translation drafts from DeepL or Google Cloud Translation Basic v2.
- Checks placeholders and catalog structure before export.
- Produces offline JSON packs for the target application.
- Prepares a project-local integration dependency while keeping target Pascal, DPR, DPROJ, DFM, and FMX files read-only.
- Supports repeated language additions and exports in Maintenance Studio.

The target application does not need an Internet connection or provider key to use deployed packs. Translation quality, terminology, layout, and application-specific dynamic text still require developer review.

## Supported development environment

The project is built with RAD Studio 13 Florence for Windows Win32 and Win64. The supplied source covers VCL and FireMonkey integrations. Other toolchains and non-Windows targets require separate validation.

To build locally, open `DelphiAppTranslationStudio.dproj` in RAD Studio. Runtime and design-time package projects are under `packages`. The `tools/build_packages.ps1` script builds the matching package set with the RAD Studio 37.0 environment. Generated executables, package binaries, and DCUs belong in the ignored `bin` and `dcu` folders.

## Documentation

- [User Guide](docs/pdf/Delphi%20App%20Translation%20Studio%20User%20Guide.pdf)
- [Setup Wizard Guide](docs/pdf/Delphi%20App%20Translation%20Studio%20Setup%20Wizard%20Guide.pdf)
- [Engineering Guide](docs/pdf/Delphi%20App%20Translation%20Studio%20Engineering%20Guide.pdf)
- [Complete Test Guide](docs/pdf/Delphi%20App%20Translation%20Studio%20Complete%20Test%20Guide.pdf)
- [Wizard-to-Runtime Complete Procedure](docs/pdf/Delphi%20App%20Translation%20Studio%20Wizard-to-Runtime%20Complete%20Procedure.pdf)

Editable DOCX versions are in `docs/guides`. The [release checklist](docs/guides/Release%20Checklist.md) records completed verification and remaining acceptance work.

## Repository layout

```text
bin/                 Generated executables and package binaries (not committed)
contracts/           Scanner, layout, and package test fixtures
dcu/                 Generated compiler units (not committed)
docs/guides/         Editable guides and release checklist
docs/pdf/            Companion PDF guides
export/              Generated exports (not committed)
help/                Help source
Images/              Project icon assets
images and icons/    Product artwork
packages/            Delphi runtime and design package projects
samples/             VCL and FireMonkey examples
source/              Studio and component source
source distributions/  Reserved for approved distribution packages
tools/               Build and validation scripts
```

Keep project copies under version control. Do not commit provider keys, private catalogs, or customer data. For support, include the RAD Studio version, framework, platform, exact steps, and expected and actual result. Contact: churchesite@gmail.com.

Licensed under the Apache License, Version 2.0; see [LICENSE](LICENSE).
