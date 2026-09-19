$ErrorActionPreference = "Stop"

$repo = "harmonynexushub/cognitive-ecology"
$expectedRemote = "github.com/harmonynexushub/cognitive-ecology"
$publicUrl = "https://harmonynexushub.github.io/cognitive-ecology/"

$gh = Get-ChildItem "$env:LOCALAPPDATA\GitHubCLI" -Filter gh.exe -Recurse -File |
    Select-Object -First 1

if (-not $gh) {
    throw "GitHub CLI not found"
}

$viewer = (& $gh.FullName api user --jq ".login").Trim()

if ($viewer -ne "harmonynexushub") {
    throw "ACCOUNT_MISMATCH: $viewer"
}

$remote = (git remote get-url origin).Trim()

if ($remote -notmatch "github\.com[:/]harmonynexushub/cognitive-ecology(\.git)?$") {
    throw "REPOSITORY_MISMATCH: $remote"
}

$branch = (git branch --show-current).Trim()

if ($branch -ne "main") {
    throw "BRANCH_MISMATCH: $branch"
}

Write-Host "GUARD_OK"
Write-Host "ACCOUNT: $viewer"
Write-Host "REPOSITORY: $repo"
Write-Host "BRANCH: $branch"

$status = git status --porcelain

if ($status) {
    git add -A
    git commit -m "Phase 2 automated publish"
    git push origin main
    Write-Host "PUSH_OK"
}
else {
    Write-Host "NO_SOURCE_CHANGES"
}

$pages = & $gh.FullName api "/repos/$repo/pages" | ConvertFrom-Json

if (-not $pages.html_url) {
    throw "PAGES_NOT_ENABLED"
}

Write-Host "PAGES_OK"

$verified = $false

for ($i = 1; $i -le 6; $i++) {
    try {
        $response = Invoke-WebRequest $publicUrl -UseBasicParsing -TimeoutSec 20

        if (
            $response.StatusCode -eq 200 -and
            $response.Content -match "Cognitive Ecology"
        ) {
            $verified = $true
            break
        }
    }
    catch {
        Start-Sleep -Seconds 10
    }

    Start-Sleep -Seconds 10
}

if (-not $verified) {
    throw "PUBLIC_VERIFY_FAILED"
}

Write-Host ""
Write-Host "PUBLIC_OK"
Write-Host $publicUrl
