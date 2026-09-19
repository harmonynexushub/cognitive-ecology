$ErrorActionPreference = "Stop"

$root = (Get-Location).Path
$indexPath = Join-Path $root "index.html"

if (-not (Test-Path $indexPath)) { throw "INDEX_NOT_FOUND" }

$html = Get-Content $indexPath -Raw

# Idempotent: add an explicit navigation block rather than relying on fragile regex wrapping.
$start = "<!-- CE_GUIDE_LINKS_START -->"
$end = "<!-- CE_GUIDE_LINKS_END -->"

$block = @'
<!-- CE_GUIDE_LINKS_START -->
<section id="practical-guides" style="max-width:1120px;margin:0 auto;padding:28px 20px 64px">
  <div style="font-size:.78rem;letter-spacing:.12em;font-weight:800;opacity:.65;margin-bottom:8px">PRACTICAL GUIDES</div>
  <h2 style="margin:0 0 10px">困りごとから読む</h2>
  <p style="margin:0 0 22px;opacity:.75">今の状態に近い入口から、具体的な工夫を読めます。</p>
  <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:12px">
    <a href="./focus.html" style="display:block;padding:18px;border:1px solid #d8d2c6;border-radius:16px;color:inherit;text-decoration:none;background:#fffdf8"><b>集中できない</b><br><small>意志より環境を変える</small></a>
    <a href="./ai-work.html" style="display:block;padding:18px;border:1px solid #d8d2c6;border-radius:16px;color:inherit;text-decoration:none;background:#fffdf8"><b>AIを仕事で使いたい</b><br><small>摩擦を1つ減らす</small></a>
    <a href="./remote-work.html" style="display:block;padding:18px;border:1px solid #d8d2c6;border-radius:16px;color:inherit;text-decoration:none;background:#fffdf8"><b>在宅・副業を考えたい</b><br><small>向き不向きより条件を見る</small></a>
    <a href="./relationships.html" style="display:block;padding:18px;border:1px solid #d8d2c6;border-radius:16px;color:inherit;text-decoration:none;background:#fffdf8"><b>人間関係で疲れる</b><br><small>消耗する条件を分ける</small></a>
    <a href="./life.html" style="display:block;padding:18px;border:1px solid #d8d2c6;border-radius:16px;color:inherit;text-decoration:none;background:#fffdf8"><b>生活を整えたい</b><br><small>記憶より仕組みに預ける</small></a>
    <a href="./ai-income.html" style="display:block;padding:18px;border:1px solid #d8d2c6;border-radius:16px;color:inherit;text-decoration:none;background:#fffdf8"><b>AIと収入を考えたい</b><br><small>誰の何を楽にするか決める</small></a>
  </div>
</section>
<!-- CE_GUIDE_LINKS_END -->
'@

if ($html.Contains($start) -and $html.Contains($end)) {
    $pattern = [regex]::Escape($start) + '(?s).*?' + [regex]::Escape($end)
    $html = [regex]::Replace($html, $pattern, $block)
}
elseif ($html -match '</main>') {
    $html = $html -replace '</main>', ($block + "`r`n</main>")
}
elseif ($html -match '</body>') {
    $html = $html -replace '</body>', ($block + "`r`n</body>")
}
else {
    $html += "`r`n" + $block
}

Set-Content -Path $indexPath -Value $html -Encoding UTF8

$required = @(
  "focus.html",
  "ai-work.html",
  "remote-work.html",
  "relationships.html",
  "life.html",
  "ai-income.html"
)

$check = Get-Content $indexPath -Raw
foreach ($file in $required) {
    if ($check -notmatch [regex]::Escape($file)) {
        throw "LINK_VERIFY_FAILED: $file"
    }
}

Write-Host "HOME_LINKS_OK: 6/6"

powershell -ExecutionPolicy Bypass -File ".\.phase2\publish-cognitive-ecology.ps1"
