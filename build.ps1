$products = @(
    @{ id=1; category='零食'; name='特級洋芋片'; price=50; image='images/snack_chips.png'; desc='酥脆可口的特級洋芋片，每一口都是滿滿的馬鈴薯香氣，是追劇、聚會的最佳良伴。' },
    @{ id=2; category='零食'; name='焦糖爆米花'; price=65; image='images/snack_popcorn.png'; desc='手工熬煮的濃郁焦糖，完美包覆每一顆爆米花，香甜不膩口。' },
    @{ id=3; category='零食'; name='香脆蝴蝶餅'; price=40; image='images/snack_pretzels.png'; desc='經典美式休閒零嘴，烘烤至金黃酥脆，帶有淡淡的鹽味，越嚼越香。' },
    @{ id=4; category='零食'; name='綜合堅果罐'; price=150; image='images/snack_nuts.png'; desc='嚴選頂級杏仁、腰果、核桃等，低溫烘焙保留營養，健康又美味。' },
    @{ id=5; category='糖果'; name='彩虹小熊軟糖'; price=45; image='images/candy_gummy.png'; desc='色彩繽紛、果汁風味濃郁的小熊軟糖，Q彈有嚼勁。' },
    @{ id=6; category='糖果'; name='頂級黑巧克力'; price=80; image='images/candy_gummy.png'; desc='75%純可可脂製作，口感絲滑，苦甜適中，享受極致奢華。' },
    @{ id=7; category='糖果'; name='復古水果糖'; price=30; image='images/candy_gummy.png'; desc='多種水果口味的硬糖，晶瑩剔透，喚起童年的甜蜜回憶。' },
    @{ id=8; category='糖果'; name='七彩棒棒糖'; price=25; image='images/candy_gummy.png'; desc='夢幻旋轉花紋的大波板糖，拍照打卡必備的甜蜜單品。' },
    @{ id=9; category='玩具'; name='炫光溜溜球'; price=120; image='images/snack_chips.png'; desc='專業級金屬材質，轉動時帶有酷炫燈光效果，適合各種花式技巧。' },
    @{ id=10; category='玩具'; name='益智魔術方塊'; price=85; image='images/snack_chips.png'; desc='經典三階魔術方塊，轉動滑順不卡頓，挑戰你的大腦極限。' },
    @{ id=11; category='玩具'; name='超級英雄公仔'; price=250; image='images/snack_chips.png'; desc='精緻塗裝的收藏級公仔，關節可動，還原經典英雄姿態。' },
    @{ id=12; category='玩具'; name='極速迴力車'; price=60; image='images/snack_chips.png'; desc='合金車身，擬真設計，只需輕輕往後拉，就能極速衝刺。' },
    @{ id=13; category='其它'; name='清涼氣泡水'; price=35; image='images/snack_popcorn.png'; desc='無糖無負擔的氣泡水，氣泡綿密，解渴首選。' },
    @{ id=14; category='其它'; name='天然礦泉水'; price=20; image='images/snack_popcorn.png'; desc='源自深山純淨水源，富含礦物質，為身體補充所需水分。' },
    @{ id=15; category='其它'; name='質感筆記本'; price=90; image='images/snack_popcorn.png'; desc='簡約設計，紙質優良不暈墨，適合記錄生活點滴與靈感。' },
    @{ id=16; category='其它'; name='彩色原子筆組'; price=45; image='images/snack_popcorn.png'; desc='一組五色，書寫滑順，滿足各種筆記與標示需求。' }
)

$headerTemplate = @"
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>零食樂園 Snack Paradise | {{TITLE}}</title>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="index.css">
</head>
<body>
    <header>
        <div class="nav-container">
            <a href="index.html" class="logo-container">
                <img src="images/logo.png" alt="零食樂園 Logo" id="logo-img" onerror="this.src='https://via.placeholder.com/50'">
                <span class="logo-text">Snack Paradise</span>
            </a>
            <nav>
                <ul>
                    <li><a href="index.html" class="{{nav_index}}">首頁</a></li>
                    <li><a href="about.html" class="{{nav_about}}">公司簡介</a></li>
                    <li><a href="snacks.html" class="{{nav_snacks}}">零食</a></li>
                    <li><a href="candies.html" class="{{nav_candies}}">糖果</a></li>
                    <li><a href="toys.html" class="{{nav_toys}}">玩具</a></li>
                    <li><a href="others.html" class="{{nav_others}}">其它類</a></li>
                    <li><a href="contact.html" class="{{nav_contact}}">聯絡我們</a></li>
                </ul>
            </nav>
        </div>
    </header>
    <main>
"@

$footerTemplate = @"
    </main>
    <footer>
        <p>&copy; 2026 零食樂園 Snack Paradise. 保留所有權利。</p>
    </footer>
</body>
</html>
"@

function Get-Header ($title, $activePage) {
    $header = $headerTemplate.Replace("{{TITLE}}", $title)
    $pages = @('index', 'about', 'snacks', 'candies', 'toys', 'others', 'contact')
    foreach ($p in $pages) {
        if ($p -eq $activePage) {
            $header = $header.Replace("{{nav_$p}}", "active")
        } else {
            $header = $header.Replace("{{nav_$p}}", "")
        }
    }
    return $header
}

function Render-ProductGrid ($productsList) {
    $html = '<section class="products-grid animate-in">'
    foreach ($p in $productsList) {
        $html += @"
            <div class="product-card">
                <span class="category-tag">$($p.category)</span>
                <img src="$($p.image)" alt="$($p.name)" class="product-image" onerror="this.src='https://via.placeholder.com/200'">
                <h3 class="product-title">$($p.name)</h3>
                <div class="product-price">$($p.price)</div>
                <a href="product$($p.id).html" class="btn">查看詳情</a>
            </div>
"@
    }
    $html += '</section>'
    return $html
}

# Write Category Pages
$categories = @(
    @{ file='snacks.html'; title='零食'; key='snacks'; filter='零食' },
    @{ file='candies.html'; title='糖果'; key='candies'; filter='糖果' },
    @{ file='toys.html'; title='玩具'; key='toys'; filter='玩具' },
    @{ file='others.html'; title='其它類'; key='others'; filter='其它' }
)

foreach ($cat in $categories) {
    $content = Get-Header $cat.title $cat.key
    $content += "<div class=`"page-container animate-in`"><h2>$($cat.title)區</h2></div>"
    $filteredProducts = $products | Where-Object { $_.category -eq $cat.filter }
    $content += Render-ProductGrid $filteredProducts
    $content += $footerTemplate
    $content | Out-File -FilePath ".\$($cat.file)" -Encoding utf8
}

# Write About Page
$aboutContent = Get-Header '公司簡介' 'about'
$aboutContent += @"
<div class="page-container animate-in">
    <h2>關於零食樂園</h2>
    <p style="font-size: 1.1rem; line-height: 1.8; margin-bottom: 1.5rem;">我們成立於 2026 年，致力於為全世界的零食愛好者提供最高品質、最新鮮的休閒食品。我們相信，一點點甜蜜與驚喜，就能點亮每一個平凡的日子。</p>
    <p style="font-size: 1.1rem; line-height: 1.8; margin-bottom: 1.5rem;">我們的產品涵蓋各式各樣的進口零食、手工糖果、趣味玩具以及實用周邊，保證讓大朋友小朋友都能找到屬於自己的快樂。</p>
</div>
"@
$aboutContent += $footerTemplate
$aboutContent | Out-File -FilePath ".\about.html" -Encoding utf8

# Write Contact Page
$contactContent = Get-Header '聯絡我們' 'contact'
$contactContent += @"
<div class="page-container animate-in">
    <h2>聯絡我們</h2>
    <form class="contact-form" action="#" method="POST">
        <div class="form-group">
            <label for="name">姓名</label>
            <input type="text" id="name" name="name" required placeholder="請輸入您的姓名">
        </div>
        <div class="form-group">
            <label for="email">電子郵件</label>
            <input type="email" id="email" name="email" required placeholder="請輸入您的電子信箱">
        </div>
        <div class="form-group">
            <label for="message">訊息內容</label>
            <textarea id="message" name="message" rows="5" required placeholder="請輸入您的問題或建議"></textarea>
        </div>
        <button type="button" class="btn" onclick="alert('感謝您的來信，我們將盡快回覆！')">送出訊息</button>
    </form>
</div>
"@
$contactContent += $footerTemplate
$contactContent | Out-File -FilePath ".\contact.html" -Encoding utf8

# Write Product Pages
foreach ($p in $products) {
    $pContent = Get-Header $p.name ''
    $pContent += @"
    <div class="product-detail-container animate-in">
        <div class="product-detail-image">
            <img src="$($p.image)" alt="$($p.name)" onerror="this.src='https://via.placeholder.com/400'">
        </div>
        <div class="product-detail-info">
            <span class="category-tag" style="position: relative; display: inline-block; width: max-content; margin-bottom: 1rem; top: 0; right: 0;">$($p.category)</span>
            <h1>$($p.name)</h1>
            <div class="price">$$($p.price)</div>
            <p>$($p.desc)</p>
            <div style="display: flex; gap: 1rem; margin-top: 2rem;">
                <input type="number" value="1" min="1" style="width: 80px; padding: 0.8rem; border-radius: 10px; border: 2px solid #ddd; font-size: 1.1rem; text-align: center;">
                <button class="btn" onclick="alert('已加入購物車！')">加入購物車</button>
            </div>
        </div>
    </div>
"@
    $pContent += $footerTemplate
    $pContent | Out-File -FilePath ".\product$($p.id).html" -Encoding utf8
}

Write-Host "All pages generated successfully."
