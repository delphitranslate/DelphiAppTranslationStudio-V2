[CmdletBinding()]
param(
    [string]$Version = '2.0',
    [switch]$ValidateOnly
)

$ErrorActionPreference = 'Stop'

$ProjectRoot = [System.IO.Path]::GetFullPath(
    (Join-Path $PSScriptRoot '..'))
$DistributionDirectory = Join-Path $ProjectRoot 'source distributions'
$ArchiveName = "DelphiAppTranslationStudio-$Version-source.zip"
$ArchivePath = Join-Path $DistributionDirectory $ArchiveName
$TemporaryArchivePath = Join-Path $DistributionDirectory (
    ".$ArchiveName.$([Guid]::NewGuid().ToString('N')).tmp")

$TrackedFiles = @(
    & git -C $ProjectRoot ls-files
)
if ($LASTEXITCODE -ne 0) {
    throw 'Unable to enumerate Git-owned project files.'
}

$Files = @($TrackedFiles) |
    Where-Object {
        $_ -and
        ($_ -notmatch '^source distributions[/\\]') -and
        ($_ -notmatch '^(bin|dcu|export|__backup|__history|__recovery|__work)[/\\]') -and
        ($_ -notmatch '(^|[/\\])\.gitkeep$')
    } |
    Sort-Object -Unique

$ExistingFiles = @()
foreach ($RelativePath in $Files) {
    $NormalizedRelativePath = $RelativePath.Replace(
        '/', [System.IO.Path]::DirectorySeparatorChar)
    $SourcePath = [System.IO.Path]::GetFullPath(
        (Join-Path $ProjectRoot $NormalizedRelativePath))
    if (-not $SourcePath.StartsWith(
        $ProjectRoot + [System.IO.Path]::DirectorySeparatorChar,
        [System.StringComparison]::OrdinalIgnoreCase)) {
        throw "Unsafe source-distribution path: $RelativePath"
    }
    if (-not (Test-Path -LiteralPath $SourcePath -PathType Leaf)) {
        if ($RelativePath -match '^(source|tools|packages)[/\\]') {
            throw "Required source-distribution file is missing: $RelativePath"
        }
        Write-Warning "Skipping removed legacy asset: $RelativePath"
        continue
    }
    $ExistingFiles += $RelativePath
}

if ($ValidateOnly) {
    Write-Output "V2 source distribution validated: $($ExistingFiles.Count) files. No archive created."
    return
}

New-Item -ItemType Directory -Path $DistributionDirectory -Force | Out-Null

Add-Type -AssemblyName System.IO.Compression
Add-Type -AssemblyName System.IO.Compression.FileSystem

$ArchiveStream = [System.IO.File]::Open(
    $TemporaryArchivePath,
    [System.IO.FileMode]::CreateNew,
    [System.IO.FileAccess]::ReadWrite,
    [System.IO.FileShare]::None)
try {
    $Archive = [System.IO.Compression.ZipArchive]::new(
        $ArchiveStream,
        [System.IO.Compression.ZipArchiveMode]::Create,
        $true)
    try {
        foreach ($RelativePath in $ExistingFiles) {
            $NormalizedRelativePath = $RelativePath.Replace(
                '/',
                [System.IO.Path]::DirectorySeparatorChar)
            $SourcePath = [System.IO.Path]::GetFullPath(
                (Join-Path $ProjectRoot $NormalizedRelativePath))
            if (-not $SourcePath.StartsWith(
                $ProjectRoot + [System.IO.Path]::DirectorySeparatorChar,
                [System.StringComparison]::OrdinalIgnoreCase)) {
                throw "Unsafe source-distribution path: $RelativePath"
            }
            if (-not (Test-Path -LiteralPath $SourcePath -PathType Leaf)) {
                throw "Source-distribution file is missing: $RelativePath"
            }

            $EntryName = $RelativePath.Replace('\', '/')
            $Entry = $Archive.CreateEntry(
                $EntryName,
                [System.IO.Compression.CompressionLevel]::Optimal)
            $EntryStream = $Entry.Open()
            $SourceStream = [System.IO.File]::OpenRead($SourcePath)
            try {
                $SourceStream.CopyTo($EntryStream)
            }
            finally {
                $SourceStream.Dispose()
                $EntryStream.Dispose()
            }
        }
    }
    finally {
        $Archive.Dispose()
    }
}
finally {
    $ArchiveStream.Dispose()
}

if ((Get-Item -LiteralPath $TemporaryArchivePath).Length -le 0) {
    throw 'The generated source distribution is empty.'
}

Copy-Item -LiteralPath $TemporaryArchivePath -Destination $ArchivePath -Force
if ((Get-Item -LiteralPath $ArchivePath).Length -ne
    (Get-Item -LiteralPath $TemporaryArchivePath).Length) {
    throw 'The source-distribution replacement did not verify.'
}
Remove-Item -LiteralPath $TemporaryArchivePath -Force
Write-Output $ArchivePath
