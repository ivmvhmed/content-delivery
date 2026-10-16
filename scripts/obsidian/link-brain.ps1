<#
.SYNOPSIS
  Shows content-delivery's docs, including Claude's project brain (docs\brain), inside the Obsidian vault.

.DESCRIPTION
  Makes "<vault>\Projects\content-delivery" a folder link (a junction, no admin rights needed) to
  "<clone>\docs". The notes Claude writes in docs\brain, from a cloud or a local session, are then
  the notes Obsidian shows after a git pull, and an edit made in Obsidian lands in the repo.

  Nothing is deleted. A folder already at that path is renamed "content-delivery (old)" so its notes can
  be compared and removed by hand. Home.md links to the old note paths are pointed at docs\brain.
  Running it again when the link is already right changes nothing.

.EXAMPLE
  powershell -ExecutionPolicy Bypass -File scripts\obsidian\link-brain.ps1

.EXAMPLE
  powershell -ExecutionPolicy Bypass -File scripts\obsidian\link-brain.ps1 -Vault "D:\Notes\Brain"
#>
param(
  [string]$Vault = (Join-Path ([Environment]::GetFolderPath('MyDocuments')) 'Obsidian Vault'),
  [string]$Repo = (Join-Path ([Environment]::GetFolderPath('MyDocuments')) 'Projects\content-delivery')
)

# The vault folder name and the prefix every brain note starts with.
$Folder = 'content-delivery'
$Prefix = 'content-delivery'

$docs = Join-Path $Repo 'docs'
$projects = Join-Path $Vault 'Projects'
$link = Join-Path $projects $Folder

if (-not (Test-Path -LiteralPath (Join-Path $docs 'brain'))) {
  Write-Host "No docs\brain in $Repo." -ForegroundColor Yellow
  Write-Host 'Clone or pull the repo first, or pass -Repo.'
  exit 1
}
if (-not (Test-Path -LiteralPath $Vault)) {
  Write-Host "Vault not found: $Vault. Pass -Vault with the vault folder." -ForegroundColor Yellow
  exit 1
}

$existing = Get-Item -LiteralPath $link -Force -ErrorAction SilentlyContinue
if ($existing -and $existing.LinkType -eq 'Junction' -and
    (@($existing.Target)[0]).TrimEnd('\') -eq $docs.TrimEnd('\')) {
  Write-Host "Already linked: $link -> $docs" -ForegroundColor Green
} else {
  if ($existing) {
    # Rename, never delete: removing a junction recursively can delete the folder it points at.
    $oldName = "$Folder (old)"
    if (Test-Path -LiteralPath (Join-Path $projects $oldName)) {
      $oldName = "$Folder (old " + (Get-Date -Format 'yyyyMMdd-HHmmss') + ')'
    }
    Rename-Item -LiteralPath $link -NewName $oldName
    Write-Host "Kept the previous folder as Projects\$oldName. Compare it with docs\brain, then delete it."
  }
  New-Item -ItemType Directory -Path $projects -Force -ErrorAction Stop | Out-Null
  New-Item -ItemType Junction -Path $link -Target $docs -ErrorAction Stop | Out-Null
  $made = Get-Item -LiteralPath $link -Force -ErrorAction SilentlyContinue
  if (-not $made -or $made.LinkType -ne 'Junction') {
    Write-Host "Could not create the folder link at $link." -ForegroundColor Red
    exit 1
  }
  Write-Host "Linked: $link -> $docs" -ForegroundColor Green
}

# Home.md linked the notes at Projects/<folder>/<note>; they now sit one folder down, in brain/.
$homeNote = Join-Path $Vault 'Home.md'
if (Test-Path -LiteralPath $homeNote) {
  $text = [IO.File]::ReadAllText($homeNote)
  $prefixPattern = [regex]::Escape($Prefix).Replace('\ ', '(%20| )')
  $pattern = 'Projects/' + [regex]::Escape($Folder) + '/(?=' + $prefixPattern + '(%20| ))'
  $count = ([regex]::Matches($text, $pattern)).Count
  if ($count -gt 0) {
    $text = [regex]::Replace($text, $pattern, "Projects/$Folder/brain/")
    [IO.File]::WriteAllText($homeNote, $text, (New-Object Text.UTF8Encoding $false))
    Write-Host "Home.md: pointed $count link(s) at Projects/$Folder/brain/."
  }
}

Write-Host ''
Write-Host "Next: open Obsidian; the notes are under Projects\$Folder\brain."
Write-Host 'After a git pull in the clone, Obsidian shows what Claude wrote. Commit edits you make there.'
