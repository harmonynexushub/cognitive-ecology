$ErrorActionPreference = 'Stop'
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
  throw 'winget not found. Install GitHub CLI from the official GitHub CLI installer.'
}
if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
  winget install --id GitHub.cli --exact --source winget
  Write-Host 'GitHub CLI installed. Re-open PowerShell once, then run this script again.'
  exit 0
}
Write-Host 'GitHub CLI is installed.'
gh auth status
Write-Host ''
Write-Host 'If harmonynexushub is not listed, run:'
Write-Host '  gh auth login --hostname github.com --web --git-protocol https'
Write-Host 'Then authenticate the harmonynexushub account in the browser.'
