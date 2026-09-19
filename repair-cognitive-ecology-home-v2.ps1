$ErrorActionPreference="Stop"
$root=(Get-Location).Path
$index=Join-Path $root "index.html"
if(-not(Test-Path $index)){throw "INDEX_NOT_FOUND"}

$html=@'
<!doctype html>
<html lang="ja">
<head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1">
<title>Cognitive Ecology｜自分に合う生き方・働き方を探す</title>
<style>
:root{--bg:#f6f5ef;--ink:#17201d;--green:#174f3b;--mint:#dcece2;--line:#d7d9d2}
*{box-sizing:border-box}body{margin:0;background:var(--bg);color:var(--ink);font-family:system-ui,-apple-system,"Noto Sans JP",sans-serif;line-height:1.7}
header{position:sticky;top:0;background:#f6f5efee;border-bottom:1px solid var(--line);backdrop-filter:blur(10px);z-index:5}
.nav,.wrap{max-width:1080px;margin:auto;padding-left:20px;padding-right:20px}.nav{padding-top:14px;padding-bottom:14px;display:flex;justify-content:space-between;align-items:center}
.brand{font-weight:800}.tag{font-size:13px;color:#53615b}.hero{padding:82px 0 46px}.eyebrow{color:var(--green);font-weight:750}
h1{font-size:clamp(36px,7vw,76px);line-height:1.05;max-width:900px;margin:12px 0 20px;letter-spacing:-.04em}.lead{font-size:18px;max-width:720px;color:#45534d}
.chips{display:flex;gap:10px;flex-wrap:wrap;margin:30px 0}.chip{display:inline-block;border:1px solid #bfc9c2;background:#fff;border-radius:999px;padding:12px 17px;font-weight:650;color:inherit;text-decoration:none}
.chip:hover{background:var(--green);color:#fff;border-color:var(--green)}section{padding:52px 0}.head{display:flex;justify-content:space-between;gap:20px;align-items:end;margin-bottom:22px}
.head h2{font-size:30px;margin:0}.head p{margin:0;color:#617069}.grid{display:grid;grid-template-columns:repeat(3,1fr);gap:14px}
.card{display:block;background:#fff;border:1px solid var(--line);border-radius:20px;padding:22px;min-height:190px;color:inherit;text-decoration:none}.card:hover{transform:translateY(-2px)}
.card small{color:var(--green);font-weight:800}.card h3{margin:10px 0 8px;font-size:20px}.card p{margin:0;color:#52615a}
.context{background:var(--ink);color:#f7f8f5;border-radius:28px;padding:32px}.context h2{margin-top:0}.context-grid{display:grid;grid-template-columns:repeat(5,1fr);gap:10px}.context-grid div{border:1px solid #52615a;border-radius:15px;padding:18px 12px;text-align:center}
.signal{background:var(--mint);border-radius:24px;padding:28px}.community{display:grid;grid-template-columns:1.2fr .8fr;gap:16px}.plain{background:#fff;border:1px solid var(--line);border-radius:20px;padding:28px}
.member{background:var(--green);color:#fff;border-radius:24px;padding:28px}.member strong{font-size:34px}footer{padding:40px 20px 70px!important;color:#6a746f;font-size:13px}
@media(max-width:760px){.grid{grid-template-columns:1fr}.context-grid{grid-template-columns:1fr 1fr}.community{grid-template-columns:1fr}.hero{padding-top:55px}.head{display:block}}
</style></head>
<body>
<header><div class="nav"><div class="brand">Cognitive Ecology</div><div class="tag">人 × 環境 × 道具 × 情報 × 時間</div></div></header>
<main class="wrap">
<section class="hero"><div class="eyebrow">自分に合う組み合わせを探す場所</div><h1>今日は、何に困っていますか？</h1>
<p class="lead">生きづらさを「自分の問題」だけにしない。環境・道具・情報・時間との組み合わせから、今より楽に動ける条件を探します。</p>
<div class="chips">
<a class="chip" href="./focus.html">集中できない</a><a class="chip" href="./relationships.html">人間関係で疲れる</a><a class="chip" href="./ai-work.html">AIを使ってみたい</a><a class="chip" href="./remote-work.html">副業・在宅</a><a class="chip" href="./life.html">生活を整えたい</a><a class="chip" href="./ai-income.html">AIと収入</a>
</div></section>

<section><div class="head"><h2>みんなの工夫</h2><p>正解ではなく、試せる選択肢。</p></div><div class="grid">
<a class="card" href="./focus.html"><small>仕事 × 集中</small><h3>集中を「気合い」から環境設計へ</h3><p>音、席、通知、時間帯。集中を邪魔する条件を分解する。</p></a>
<a class="card" href="./ai-work.html"><small>AI × 仕事</small><h3>AIを仕事の補助輪として使う</h3><p>文章整理、確認、下書き、手順化。苦手な工程だけAIへ渡す。</p></a>
<a class="card" href="./remote-work.html"><small>在宅 × 副業</small><h3>働き方を「特性」から逆算する</h3><p>割り込み、対人量、移動、締切の強さまで見る。</p></a>
<a class="card" href="./relationships.html"><small>人間関係</small><h3>会話で消耗する条件を見つける</h3><p>人数、場所、時間、即答要求。疲労をコミュ力だけにまとめない。</p></a>
<a class="card" href="./life.html"><small>生活 × 仕組み</small><h3>忘れない努力を減らす</h3><p>見える化・定位置・自動化で毎日の判断回数を減らす。</p></a>
<a class="card" href="./ai-income.html"><small>AI × 収入</small><h3>AI活用を収入につなげる前に</h3><p>作れるものより、誰のどんな面倒を減らせるかから考える。</p></a>
</div></section>

<section><div class="context"><div class="eyebrow">CONTEXT MAPPER</div><h2>「自分」だけでなく、組み合わせを見る。</h2><div class="context-grid"><div>PERSON<br><small>特性・状態</small></div><div>ENVIRONMENT<br><small>場所・人</small></div><div>TOOL<br><small>AI・道具</small></div><div>INFORMATION<br><small>量・形式</small></div><div>TIME<br><small>時間・周期</small></div></div></div></section>

<section><div class="signal"><div class="eyebrow">WORLD SIGNAL</div><h2>社会の変化を、自分の生活まで翻訳する。</h2><p>AI、働き方、制度、道具の変化をニュースで終わらせず、「自分に何が使えるか」へつなげる補助レイヤーです。</p></div></section>

<section class="community"><div class="plain"><small>COMMUNITY</small><h2>見るだけでもいい。</h2><p>診断の有無で線を引かず、自己開示も強制しません。誰かの経験を読む → 自分に合いそうな方法を試す → また共有する。経験を知恵として残します。</p></div>
<div class="member"><small>MEMBER</small><h2>深く使いたい人へ</h2><strong>¥980</strong><span> / 月</span><p>決済導線が正式接続されるまで課金は開始しません。</p></div></section>
</main>
<footer class="wrap">Cognitive Ecology — 人と環境の組み合わせから、生き方・働き方を探す。</footer>
</body></html>
'@

Set-Content $index -Value $html -Encoding UTF8
$required=@("focus.html","ai-work.html","remote-work.html","relationships.html","life.html","ai-income.html")
$check=Get-Content $index -Raw
foreach($f in $required){if($check -notmatch [regex]::Escape("href=`"./$f`"")){throw "LINK_FAILED:$f"}}
if(($check | Select-String 'href=""' -AllMatches).Matches.Count -gt 0){throw "EMPTY_LINK_FOUND"}
Write-Host "HOME_REPAIR_OK"
Write-Host "LINKS_OK: 6/6"
powershell -ExecutionPolicy Bypass -File ".\.phase2\publish-cognitive-ecology.ps1"
