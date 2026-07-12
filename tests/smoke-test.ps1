$ErrorActionPreference='Stop'
$root=Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$required='index.html','styles.css','app.js','manifest.webmanifest','sw.js','README.md','icons/icon-192.svg','icons/icon-512.svg'
foreach($file in $required){if(-not(Test-Path (Join-Path $root $file))){throw "Missing file: $file"}}
$html=Get-Content (Join-Path $root 'index.html') -Raw
$js=Get-Content (Join-Path $root 'app.js') -Raw
$manifest=Get-Content (Join-Path $root 'manifest.webmanifest') -Raw
$sw=Get-Content (Join-Path $root 'sw.js') -Raw
foreach($id in 'menuGrid','noteInput','summaryDialog','summaryContent','copyButton','shareButton','clearButton'){if($html -notmatch "id=`"$id`""){throw "Missing DOM id: $id"}}
$eat='奶油火鸡面','新疆炒米粉','火锅','烧烤','烤肉','海底捞','公瑾爆蛋','番茄滑肉','牛肉','辣椒炒肉','家庭厨房','原味鸡','麦当劳','塔斯汀','汉堡','韩式拌饭','粥','大碗先生','盛香亭','三文鱼','鸡胸肉','小龙虾','日料','滨寿司','大萝家泡菜','邵阳米粉','炸鸡腿','食货青年','烤鸭','馄饨'
$drink='古茗','一点点','喜茶','库迪','新佳宜','可乐','果茶','啤酒','白酒','清酒','牛奶','草莓奶昔','草莓芭乐','鸡尾酒','咖啡','果汁'
$fruit='荔枝','西瓜','榴莲','甜品','蛋糕'
if($eat.Count-ne 30 -or $drink.Count-ne 16 -or $fruit.Count-ne 5){throw 'Unexpected menu counts'}
foreach($item in $eat+$drink+$fruit){if($js -notmatch [regex]::Escape($item)){throw "Missing menu item: $item"}}
foreach($icon in 'icon-192.svg','icon-512.svg'){if($manifest -notmatch $icon){throw "Manifest missing $icon"};if($sw -notmatch $icon){throw "Service worker missing $icon"}}
foreach($asset in 'index.html','styles.css','app.js','manifest.webmanifest'){if($sw -notmatch [regex]::Escape($asset)){throw "Service worker missing $asset"}}
Write-Output 'Smoke test passed'
