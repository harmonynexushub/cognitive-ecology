param(
  [Parameter(Mandatory=$true)][string]$Project,
  [ValidateSet('status','switch','push')][string]$Action='status'
)

$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path
$Config = Get-Content (Join-Path $Root 'projects.json') -Raw | ConvertFrom-Json
$P = $Config.projects.$Project
if (-not $P) { throw "UNKNOWN_PROJECT:$Project" }
if (-not $P.source.github) { throw "NO_GITHUB_ROUTE:$Project" }

$Owner = $P.source.github.owner
$Repo = $P.source.github.repo
$Expected = "$Owner/$Repo"

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
  throw 'GH_CLI_MISSING: install GitHub CLI first (winget install --id GitHub.cli)'
}

function Assert-Identity {
  $viewer = gh api user --jq .login
  if ($viewer -ne $Owner) {
    throw "IDENTITY_MISMATCH: expected=$Owner actual=$viewer. Refusing to write."
  }
  $remote = gh repo view $Expected --json nameWithOwner --jq .nameWithOwner
  if ($remote -ne $Expected) { throw "REPO_MISMATCH: expected=$Expected actual=$remote" }
  Write-Host "IDENTITY_OK $viewer -> $remote"
}

switch ($Action) {
  'status' {
    gh auth status
    Write-Host "ROUTE $Project -> $Expected"
  }
  'switch' {
    gh auth switch --hostname github.com --user $Owner
    Assert-Identity
  }
  'push' {
    gh auth switch --hostname github.com --user $Owner
    Assert-Identity
    $branch = $P.source.github.branch
    git remote set-url origin "https://github.com/$Expected.git"
    $actual = git remote get-url origin
    if ($actual -ne "https://github.com/$Expected.git") { throw "REMOTE_MISMATCH:$actual" }
    git push origin $branch
  }
}
