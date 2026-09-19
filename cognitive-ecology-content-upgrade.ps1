$ErrorActionPreference = "Stop"
$root = (Get-Location).Path
if (-not (Test-Path (Join-Path $root "index.html"))) { throw "RUN_FROM_REPO_ROOT" }
$pages = @{}

$pages['focus.html'] = @'
<!doctype html><html lang="ja"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>集中できないとき、意志より環境を変える｜Cognitive Ecology</title><style>
:root{--bg:#f5f1e8;--ink:#17211d;--green:#245b49;--line:#d8d2c6;--card:#fffdf8}
*{box-sizing:border-box}body{margin:0;background:var(--bg);color:var(--ink);font-family:system-ui,-apple-system,"Segoe UI",sans-serif;line-height:1.8}
main{max-width:820px;margin:auto;padding:64px 22px 100px}a{color:var(--green)}.back{text-decoration:none;font-weight:700}
.eyebrow{margin-top:48px;color:var(--green);font-weight:800;letter-spacing:.08em}h1{font-size:clamp(2rem,6vw,3.6rem);line-height:1.15;margin:.25em 0 .5em}
h2{margin-top:2.2em;font-size:1.45rem}.lead{font-size:1.15rem}.box{background:var(--card);border:1px solid var(--line);border-radius:18px;padding:20px 24px;margin:28px 0}
footer{margin-top:70px;padding-top:24px;border-top:1px solid var(--line);font-size:.9rem}
</style></head><body><main><a class="back" href="./index.html">← Cognitive Ecology</a><div class="eyebrow">PRACTICAL GUIDE</div><h1>集中できないとき、意志より環境を変える</h1>
<p class="lead">集中できないときに、最初から「自分の集中力が弱い」と決めつけない。Cognitive Ecologyでは、人・環境・道具・情報・時間の組み合わせとして見ます。</p>
<h2>まず切り分ける</h2>
<p>同じ人でも、場所、音、視界、時間帯、通知、作業の大きさが変わるだけで動きやすさは変わります。最初に「集中できる／できない」ではなく、どの条件で崩れるかを観察します。</p>
<div class="box"><b>試す順番</b><ol><li>通知を1つ止める</li><li>視界から不要な物を1つ外す</li><li>作業を10分で終わる単位にする</li><li>音あり／なしを比較する</li><li>時間帯を変えて記録する</li></ol></div>
<h2>一度に全部直さない</h2><p>条件を一つだけ変えると、自分に効いた要因が分かります。改善は根性ではなく、小さな比較実験として扱います。</p>
<h2>持ち帰る問い</h2><p>「自分は集中できる人か」ではなく、「自分が集中しやすい条件は何か」。この問いに変えるだけで、対策を具体化しやすくなります。</p>
<footer>Cognitive Ecology — 人 × 環境 × 道具 × 情報 × 時間</footer></main></body></html>
'@

$pages['ai-work.html'] = @'
<!doctype html><html lang="ja"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>AIを仕事で使うなら、まず摩擦を1つ減らす｜Cognitive Ecology</title><style>
:root{--bg:#f5f1e8;--ink:#17211d;--green:#245b49;--line:#d8d2c6;--card:#fffdf8}
*{box-sizing:border-box}body{margin:0;background:var(--bg);color:var(--ink);font-family:system-ui,-apple-system,"Segoe UI",sans-serif;line-height:1.8}
main{max-width:820px;margin:auto;padding:64px 22px 100px}a{color:var(--green)}.back{text-decoration:none;font-weight:700}
.eyebrow{margin-top:48px;color:var(--green);font-weight:800;letter-spacing:.08em}h1{font-size:clamp(2rem,6vw,3.6rem);line-height:1.15;margin:.25em 0 .5em}
h2{margin-top:2.2em;font-size:1.45rem}.lead{font-size:1.15rem}.box{background:var(--card);border:1px solid var(--line);border-radius:18px;padding:20px 24px;margin:28px 0}
footer{margin-top:70px;padding-top:24px;border-top:1px solid var(--line);font-size:.9rem}
</style></head><body><main><a class="back" href="./index.html">← Cognitive Ecology</a><div class="eyebrow">PRACTICAL GUIDE</div><h1>AIを仕事で使うなら、まず摩擦を1つ減らす</h1>
<p class="lead">AIを覚えること自体を目的にせず、今の仕事で繰り返している面倒を一つ減らすところから始めます。</p>
<h2>AI向きの仕事を探す</h2><p>文章の下書き、要約、比較、分類、チェックリスト化、アイデア整理など、毎回似た手順を踏む仕事は試しやすい領域です。</p>
<div class="box"><b>小さな導入例</b><ul><li>長文を「要点・期限・次の行動」に分解</li><li>メモから報告文の下書きを作る</li><li>複数案の違いを表にする</li><li>作業手順をチェックリストにする</li></ul></div>
<h2>丸投げしない</h2><p>個人情報や社外秘を入力しない、重要事項は原文と照合する、最終判断は人が行う。この3点を基本にします。</p>
<h2>評価する</h2><p>「AIを使ったか」ではなく、時間、迷い、やり直しが減ったかで判断します。効かなければ用途を変えます。</p>
<footer>Cognitive Ecology — 人 × 環境 × 道具 × 情報 × 時間</footer></main></body></html>
'@

$pages['remote-work.html'] = @'
<!doctype html><html lang="ja"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>在宅・副業を、向き不向きではなく条件で考える｜Cognitive Ecology</title><style>
:root{--bg:#f5f1e8;--ink:#17211d;--green:#245b49;--line:#d8d2c6;--card:#fffdf8}
*{box-sizing:border-box}body{margin:0;background:var(--bg);color:var(--ink);font-family:system-ui,-apple-system,"Segoe UI",sans-serif;line-height:1.8}
main{max-width:820px;margin:auto;padding:64px 22px 100px}a{color:var(--green)}.back{text-decoration:none;font-weight:700}
.eyebrow{margin-top:48px;color:var(--green);font-weight:800;letter-spacing:.08em}h1{font-size:clamp(2rem,6vw,3.6rem);line-height:1.15;margin:.25em 0 .5em}
h2{margin-top:2.2em;font-size:1.45rem}.lead{font-size:1.15rem}.box{background:var(--card);border:1px solid var(--line);border-radius:18px;padding:20px 24px;margin:28px 0}
footer{margin-top:70px;padding-top:24px;border-top:1px solid var(--line);font-size:.9rem}
</style></head><body><main><a class="back" href="./index.html">← Cognitive Ecology</a><div class="eyebrow">PRACTICAL GUIDE</div><h1>在宅・副業を、向き不向きではなく条件で考える</h1>
<p class="lead">在宅勤務や副業は万能ではありません。通勤、対人刺激、自己管理、収入の安定性など、負担がどこから来ているかで価値が変わります。</p>
<h2>在宅で減るもの・増えるもの</h2><p>移動や周囲の刺激が減る一方、切り替え、孤立、自己管理が難しくなることがあります。自分の場合に何が減り、何が増えるかを分けて考えます。</p>
<div class="box"><b>確認項目</b><ul><li>通勤後にどれくらい消耗するか</li><li>家で作業開始できるか</li><li>文章・電話・対面のどれが負担か</li><li>収入変動をどこまで許容できるか</li></ul></div>
<h2>副業は小さく検証する</h2><p>いきなり生活費を置き換えず、小さな案件や販売で「続けられるか」「需要があるか」「負担に見合うか」を確認します。</p>
<footer>Cognitive Ecology — 人 × 環境 × 道具 × 情報 × 時間</footer></main></body></html>
'@

$pages['relationships.html'] = @'
<!doctype html><html lang="ja"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>人間関係で疲れるとき、相性だけで終わらせない｜Cognitive Ecology</title><style>
:root{--bg:#f5f1e8;--ink:#17211d;--green:#245b49;--line:#d8d2c6;--card:#fffdf8}
*{box-sizing:border-box}body{margin:0;background:var(--bg);color:var(--ink);font-family:system-ui,-apple-system,"Segoe UI",sans-serif;line-height:1.8}
main{max-width:820px;margin:auto;padding:64px 22px 100px}a{color:var(--green)}.back{text-decoration:none;font-weight:700}
.eyebrow{margin-top:48px;color:var(--green);font-weight:800;letter-spacing:.08em}h1{font-size:clamp(2rem,6vw,3.6rem);line-height:1.15;margin:.25em 0 .5em}
h2{margin-top:2.2em;font-size:1.45rem}.lead{font-size:1.15rem}.box{background:var(--card);border:1px solid var(--line);border-radius:18px;padding:20px 24px;margin:28px 0}
footer{margin-top:70px;padding-top:24px;border-top:1px solid var(--line);font-size:.9rem}
</style></head><body><main><a class="back" href="./index.html">← Cognitive Ecology</a><div class="eyebrow">PRACTICAL GUIDE</div><h1>人間関係で疲れるとき、相性だけで終わらせない</h1>
<p class="lead">人間関係の疲れは、相手との相性だけでなく、人数、距離、会話速度、曖昧さ、拘束時間などから生まれることがあります。</p>
<h2>疲労の発生条件を見る</h2><p>「人付き合いが苦手」とまとめず、1対1なら平気なのか、雑談が続くと疲れるのか、予定変更が負担なのかを分解します。</p>
<div class="box"><b>調整できること</b><ul><li>返信する時間を決める</li><li>口頭だけでなく文章を併用する</li><li>長時間より短時間で会う</li><li>断る文をあらかじめ用意する</li></ul></div>
<h2>距離も設計できる</h2><p>関係を切る／我慢するの二択ではありません。頻度、媒体、時間、役割を調整するだけで維持しやすくなる場合があります。</p>
<footer>Cognitive Ecology — 人 × 環境 × 道具 × 情報 × 時間</footer></main></body></html>
'@

$pages['life.html'] = @'
<!doctype html><html lang="ja"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>生活を整えるとき、記憶より仕組みに預ける｜Cognitive Ecology</title><style>
:root{--bg:#f5f1e8;--ink:#17211d;--green:#245b49;--line:#d8d2c6;--card:#fffdf8}
*{box-sizing:border-box}body{margin:0;background:var(--bg);color:var(--ink);font-family:system-ui,-apple-system,"Segoe UI",sans-serif;line-height:1.8}
main{max-width:820px;margin:auto;padding:64px 22px 100px}a{color:var(--green)}.back{text-decoration:none;font-weight:700}
.eyebrow{margin-top:48px;color:var(--green);font-weight:800;letter-spacing:.08em}h1{font-size:clamp(2rem,6vw,3.6rem);line-height:1.15;margin:.25em 0 .5em}
h2{margin-top:2.2em;font-size:1.45rem}.lead{font-size:1.15rem}.box{background:var(--card);border:1px solid var(--line);border-radius:18px;padding:20px 24px;margin:28px 0}
footer{margin-top:70px;padding-top:24px;border-top:1px solid var(--line);font-size:.9rem}
</style></head><body><main><a class="back" href="./index.html">← Cognitive Ecology</a><div class="eyebrow">PRACTICAL GUIDE</div><h1>生活を整えるとき、記憶より仕組みに預ける</h1>
<p class="lead">毎日同じことを覚え続けるのが負担なら、生活の一部を環境や道具に預けます。</p>
<h2>忘れない努力を減らす</h2><p>定位置、見える化、アラーム、補充ルール、チェックリストなどを使い、「思い出せたら成功」という構造を減らします。</p>
<div class="box"><b>今日できる変更</b><ol><li>よく探す物の定位置を1つ決める</li><li>朝の手順を3項目だけ書く</li><li>補充が必要な物を一か所にまとめる</li><li>予定通知を必要なものだけ残す</li></ol></div>
<h2>仕組みは軽くする</h2><p>管理方法そのものが重くなったら失敗です。毎日続けられる最小構成を残し、使わないルールは捨てます。</p>
<footer>Cognitive Ecology — 人 × 環境 × 道具 × 情報 × 時間</footer></main></body></html>
'@

$pages['ai-income.html'] = @'
<!doctype html><html lang="ja"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>AIと収入をつなぐ前に、誰の何を楽にするか決める｜Cognitive Ecology</title><style>
:root{--bg:#f5f1e8;--ink:#17211d;--green:#245b49;--line:#d8d2c6;--card:#fffdf8}
*{box-sizing:border-box}body{margin:0;background:var(--bg);color:var(--ink);font-family:system-ui,-apple-system,"Segoe UI",sans-serif;line-height:1.8}
main{max-width:820px;margin:auto;padding:64px 22px 100px}a{color:var(--green)}.back{text-decoration:none;font-weight:700}
.eyebrow{margin-top:48px;color:var(--green);font-weight:800;letter-spacing:.08em}h1{font-size:clamp(2rem,6vw,3.6rem);line-height:1.15;margin:.25em 0 .5em}
h2{margin-top:2.2em;font-size:1.45rem}.lead{font-size:1.15rem}.box{background:var(--card);border:1px solid var(--line);border-radius:18px;padding:20px 24px;margin:28px 0}
footer{margin-top:70px;padding-top:24px;border-top:1px solid var(--line);font-size:.9rem}
</style></head><body><main><a class="back" href="./index.html">← Cognitive Ecology</a><div class="eyebrow">PRACTICAL GUIDE</div><h1>AIと収入をつなぐ前に、誰の何を楽にするか決める</h1>
<p class="lead">AIで稼ぐ、では範囲が広すぎます。収入につながるのは、AIそのものより「誰かの困りごとを、以前より速く・安く・分かりやすく解決できること」です。</p>
<h2>先に困りごとを見る</h2><p>文章整理、調査、資料化、画像制作、定型作業など、自分がAIを使って短縮できる作業と、実際に他人が必要としている作業の重なりを探します。</p>
<div class="box"><b>検証の順番</b><ol><li>困っている人を具体化</li><li>成果物を1つ決める</li><li>小さく提供する</li><li>反応と支払い意思を確認</li><li>売れた部分だけ強化する</li></ol></div>
<h2>大量制作から始めない</h2><p>商品を何十個も作る前に、一つの需要を確かめます。売れない理由が需要なのか、見せ方なのか、価格なのかを分けて学べるからです。</p>
<footer>Cognitive Ecology — 人 × 環境 × 道具 × 情報 × 時間</footer></main></body></html>
'@

foreach ($name in $pages.Keys) {
  Set-Content -Path (Join-Path $root $name) -Value $pages[$name] -Encoding UTF8
}

$indexPath = Join-Path $root "index.html"
$index = Get-Content $indexPath -Raw

$routes = @{
  "仕事・集中" = "focus.html"
  "AI×仕事" = "ai-work.html"
  "在宅・副業" = "remote-work.html"
  "人間関係" = "relationships.html"
  "生活" = "life.html"
  "AI×収入" = "ai-income.html"
}

foreach ($label in $routes.Keys) {
  $file = $routes[$label]
  $escaped = [regex]::Escape($label)
  if ($index -notmatch [regex]::Escape($file)) {
    $index = [regex]::Replace(
      $index,
      "(<[^>]+>[^<]*$escaped[^<]*</[^>]+>)",
      "<a href=`"./$file`" style=`"color:inherit;text-decoration:none`">$1</a>",
      1
    )
  }
}
Set-Content -Path $indexPath -Value $index -Encoding UTF8

Write-Host "CONTENT_CREATED: 6"
Write-Host "HOME_LINK_UPDATE_ATTEMPTED"

powershell -ExecutionPolicy Bypass -File ".\.phase2\publish-cognitive-ecology.ps1"
