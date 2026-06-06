# gen-index.ps1 - generates index.html UTF-8 no BOM
$Out = "H:\12.HTML\Wbsite\index.html"
$utf8 = New-Object System.Text.UTF8Encoding $false
$L = New-Object System.Collections.Generic.List[string]
function W([string]$s){[void]$L.Add($s)}
function WB([string[]]$a){foreach($x in $a){[void]$L.Add($x)}}

# --- Data: real medical equipment focus ---
$products = @(
  @{id='ct';cat='imaging';name='高端 CT 扫描仪';img='https://images.unsplash.com/photo-1579684385127-1ef15d508118?w=900&q=80';desc='256 排宽体探测器，0.25s 转速，支持 cardiac 一站式与低剂量迭代重建，满足急诊卒中与肿瘤随访高频检查需求。';clinical='缩短卒中黄金窗口评估时间，帮助临床更快决策。';experts=@()},
  @{id='mri';cat='imaging';name='MRI 磁共振系统';img='https://images.unsplash.com/photo-1516549655169-df83a0774514?w=900&q=80';desc='3.0T 超导磁体，70cm 大孔径，AI 智能扫描协议与全数字化谱仪，支持神经与体部高分辨率成像。';clinical='提升神经与肿瘤早期检出能力，改善患者检查舒适度。';experts=@('张伟 · 神经影像')},
  @{id='us';cat='imaging';name='医用超声设备';img='https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=900&q=80';desc='128 物理通道，弹性成像与 4D 容积探头，内置 AI 切面识别，覆盖门诊、急诊与床旁 POCUS 场景。';clinical='让基层与床旁场景获得可靠实时影像支持。';experts=@()},
  @{id='robot';cat='surgery';name='手术机器人系统';img='https://images.unsplash.com/photo-1551601651-2a8555f1a136?w=900&q=80';desc='7 自由度机械臂，3D 内窥镜视觉与力反馈主从控制，支持泌尿、肝胆、胸外等多术式模块化配置。';clinical='降低微创术式创伤，缩短住院日与恢复周期。';experts=@()},
  @{id='ai';cat='digital';name='AI 影像诊断系统';img='https://images.unsplash.com/photo-1559757175-5700dde675bc?w=900&q=80';desc='肺结节、脑卒中、冠脉等多场景辅助诊断，输出可解释性报告，与 PACS / HIS 深度集成。';clinical='辅助医生降低漏诊率，提升高危病例识别效率。';experts=@('李明远 · AI 医学影像','Dr. James Mitchell · Harvard Medical School')},
  @{id='cloud';cat='digital';name='医疗云平台';img='https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=900&q=80';desc='区域影像中心、设备远程质控、临床路径与患者全周期档案管理，满足等保三级与多院协同。';clinical='降低跨院协作成本，让优质影像资源触达更多患者。';experts=@()}
)

$deviceCats = @(
  @{id='imaging';label='影像诊断'},
  @{id='surgery';label='手术系统'},
  @{id='digital';label='数字平台'}
)

$globalHubs = @(
  @{left=78;top=42;city='上海';tag='全球总部';hq=$true},
  @{left=27;top=38;city='波士顿';tag='北美服务中心'},
  @{left=52;top=35;city='法兰克福';tag='欧洲服务中心'},
  @{left=59;top=46;city='迪拜';tag='中东服务中心'},
  @{left=32;top=62;city='圣保罗';tag='拉美服务中心'},
  @{left=87;top=67;city='悉尼';tag='大洋洲服务中心'}
)

$cases = @(
  @{title='AI 肺结节筛查项目';hospital='复旦大学附属中山医院';device='AI 影像诊断系统';img='https://images.unsplash.com/photo-1551076805-e1869033e561?w=900&q=80';effect='部署后阳性检出率提升 18%，假阳性率下降 27%。';value='帮助高危人群更早发现早期肺癌，减少无效随访。';team='放射科 王主任团队'},
  @{title='机器人辅助肝段切除';hospital='北京协和医院';device='手术机器人系统';img='https://images.unsplash.com/photo-1551601651-2a8555f1a136?w=900&q=80';effect='平均出血量降低 35%，住院日缩短 2.1 天。';value='以更小创伤完成复杂肝段切除，加速患者康复。';team='肝胆外科 李教授团队'},
  @{title='CT 冠脉一站式评估';hospital='四川大学华西医院';device='高端 CT 扫描仪';img='https://images.unsplash.com/photo-1579684385127-1ef15d508118?w=900&q=80';effect='冠脉评估完整率 98.2%，辐射剂量下降 40%。';value='一次检查完成高危患者冠脉评估，减少重复曝光。';team='心血管影像中心'}
)

$impactStories = @(
  @{title='医疗可及性提升';img='https://images.unsplash.com/photo-1576091160550-2173dba999ef?w=900&q=80';body='便携式超声与移动影像方案进入县域医共体，让基层患者无需长途转诊即可获得初筛。';value='缩短从症状到诊断的路径，提高基层首诊能力。'},
  @{title='偏远地区设备支持';img='https://images.unsplash.com/photo-1516549655169-df83a0774514?w=900&q=80';body='向西部与边疆地区医院交付 CT / 超声系统，并提供远程培训与质控支持。';value='让偏远地区医院具备与中心城市相当的影像诊断基础。'},
  @{title='患者真实受益';img='https://images.unsplash.com/photo-1551076805-e1869033e561?w=900&q=80';body='早期筛查项目帮助数万患者完成肺结节与卒中风险评估，显著降低延误诊断比例。';value='技术价值最终体现在每一位患者更早、更准地获得治疗。'},
  @{title='降低医疗成本';img='https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?w=900&q=80';body='区域影像云与 AI 辅助诊断减少重复检查与无效转诊，优化医院设备利用率。';value='在保障质量的前提下，降低患者与医保系统的综合支出。'}
)

$resources = @(
  @{title='医疗设备白皮书';type='PDF'},
  @{title='临床验证论文集';type='PDF'},
  @{title='CE / FDA / ISO 认证';type='ZIP'},
  @{title='产品手册 Global';type='PDF'}
)

$css = [System.IO.File]::ReadAllText("H:\12.HTML\Wbsite\_css.txt", [System.Text.Encoding]::UTF8)
$js  = [System.IO.File]::ReadAllText("H:\12.HTML\Wbsite\_app.js.txt", [System.Text.Encoding]::UTF8)

WB @('<!DOCTYPE html>','<html lang="zh-CN">','<head>','<meta charset="UTF-8">','<meta name="viewport" content="width=device-width, initial-scale=1.0">','<meta name="description" content="示例公司 — 高端医疗设备企业，专注 CT、MRI、超声、手术机器人与 AI 影像诊断。">','<title>示例公司 | Example Medical Technology</title>','<link rel="preconnect" href="https://fonts.googleapis.com">','<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+SC:wght@400;500;600;700;800&display=swap" rel="stylesheet">',"<style>$css</style>",'</head>','<body>')

# Header
WB @(
'<header class="site-header" id="site-header">',
'  <div class="container header-inner">',
'    <a href="#hero" class="logo"><span class="logo-mark">E</span><span class="logo-text">示例公司 Example Medical</span></a>',
'    <nav class="nav" aria-label="主导航">',
'      <a class="nav-link" href="#global">全球布局</a>',
'      <a class="nav-link" href="#products">医疗设备</a>',
'      <a class="nav-link" href="#cases">临床案例</a>',
'      <a class="nav-link" href="#impact">社会价值</a>',
'      <button type="button" class="btn btn-secondary" id="resource-open">资料中心</button>',
'      <a class="nav-link nav-cta btn btn-primary" href="#contact">联系</a>',
'    </nav>',
'    <button class="mobile-toggle" type="button" aria-label="菜单" id="mobile-toggle">&#9776;</button>',
'  </div>',
'</header>'
)

# Hero
WB @(
'<section id="hero">',
'  <div class="hero-bg-wrap"><img src="https://images.unsplash.com/photo-1579684385127-1ef15d508118?w=1920&q=85" alt="医院 CT 影像科室" width="1920" height="1080"></div>',
'  <div class="hero-overlay"></div>',
'  <div class="container hero-content">',
'    <p class="hero-eyebrow">MEDICAL IMAGING &amp; CLINICAL INNOVATION</p>',
'    <h1 class="hero-title">Innovation For Life</h1>',
'    <p class="hero-title-cn">源自中国 · 服务全球</p>',
'    <p class="hero-sub">以真实医疗设备与临床价值，构建可信赖的全球健康解决方案。</p>',
'    <div class="hero-actions">',
'      <a href="#products" class="btn btn-primary">探索医疗设备</a>',
'      <a href="#contact" class="btn btn-outline">合作咨询</a>',
'    </div>',
'  </div>',
'</section>'
)

# Global — map + stats ONLY
$landRegions = @(
  @{cx=165;cy=148;rx=78;ry=98;step=9},@{cx=198;cy=362;rx=44;ry=78;step=9},
  @{cx=512;cy=152;rx=52;ry=42;step=8},@{cx=538;cy=292;rx=48;ry=88;step=9},
  @{cx=748;cy=168;rx=118;ry=76;step=9},@{cx=705;cy=272;rx=42;ry=34;step=8},
  @{cx=848;cy=382;rx=44;ry=32;step=8},@{cx=378;cy=118;rx=22;ry=18;step=8}
)
$landDotList = New-Object System.Collections.Generic.List[object]
$dotRnd = [System.Random]::new(7)
foreach ($reg in $landRegions) {
  for ($x = $reg.cx - $reg.rx; $x -le $reg.cx + $reg.rx; $x += $reg.step) {
    for ($y = $reg.cy - $reg.ry; $y -le $reg.cy + $reg.ry; $y += $reg.step) {
      $dx = ($x - $reg.cx) / $reg.rx; $dy = ($y - $reg.cy) / $reg.ry
      if (($dx * $dx + $dy * $dy) -le 1.02) {
        $jx = [math]::Round($x + ($dotRnd.NextDouble() - 0.5) * 5, 1)
        $jy = [math]::Round($y + ($dotRnd.NextDouble() - 0.5) * 5, 1)
        if ($jx -ge 24 -and $jx -le 976 -and $jy -ge 24 -and $jy -le 476) {
          [void]$landDotList.Add(@{x=$jx;y=$jy;r=[math]::Round(1.1+$dotRnd.NextDouble()*.7,1);o=[math]::Round(0.35+$dotRnd.NextDouble()*.35,2)})
        }
      }
    }
  }
}
W '<section id="global" class="section">'
W '  <div class="container">'
W '    <div class="section-head center reveal"><span class="eyebrow">Global Presence</span><h2>全球医疗设备服务网络</h2><p>在六大洲建立装机、培训与临床支持体系，以真实医院场景验证设备价值。</p></div>'
W '    <div class="map-panel reveal"><div class="map-visual">'
W '      <svg class="map-svg" viewBox="0 0 1000 500" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">'
W '        <rect width="1000" height="500" fill="#EEF2F7"/>'
W '        <g>'
foreach ($d in $landDotList) { W "          <circle cx=""$($d.x)"" cy=""$($d.y)"" r=""$($d.r)"" fill=""rgba(148,163,184,$($d.o))""/>" }
W '        </g></svg><div class="map-markers">'
foreach($hub in $globalHubs){
  $hq = if($hub.hq){' map-pin-hq'}else{''}
  W "          <div class=""map-pin$hq"" style=""left:$($hub.left)%;top:$($hub.top)%""><i></i><span>$($hub.city) · $($hub.tag)</span></div>"
}
W '        </div></div></div>'
W '    <div class="map-legend"><span><i class="hq"></i>全球总部</span><span><i></i>区域服务中心</span></div>'
W '    <div class="impact-stats reveal">'
W '      <div class="impact-stat"><div class="num" data-count="120" data-suffix="+">0</div><div class="label">服务国家与地区</div></div>'
W '      <div class="impact-stat"><div class="num" data-count="4800" data-suffix="+">0</div><div class="label">装机医院</div></div>'
W '      <div class="impact-stat"><div class="num" data-count="18" data-suffix="M+">0</div><div class="label">年影像检查量</div></div>'
W '      <div class="impact-stat"><div class="num" data-count="8600" data-suffix="+">0</div><div class="label">临床工程师</div></div>'
W '    </div></div></section>'

# Products — medical devices ONLY
W '<section id="products" class="section"><div class="container">'
W '  <div class="section-head center reveal"><span class="eyebrow">Medical Devices</span><h2>医疗设备</h2><p>每一款产品均以真实临床场景为设计起点，聚焦诊断精度、手术安全与患者获益。</p></div>'
W '  <div class="device-hub reveal" data-device-hub>'
W '    <div class="device-tabs" role="tablist">'
$ci=0
foreach($dc in $deviceCats){
  $act = if($ci -eq 0){' is-active'}else{''}
  W "      <button type=""button"" class=""device-tab$act"" role=""tab"" data-cat=""$($dc.id)"">$($dc.label)</button>"
  $ci++
}
W '    </div><div class="device-body">'
W '      <nav class="device-nav" aria-label="设备列表">'
foreach($pr in $products){
  W "        <button type=""button"" class=""device-nav-item"" data-cat=""$($pr.cat)"" data-device=""$($pr.id)"">$($pr.name)</button>"
}
W '      </nav><div class="device-stage">'
foreach($pr in $products){
  $chips = ''
  if($pr.experts.Count -gt 0){
    $chipHtml = ($pr.experts | ForEach-Object { "<span class=""expert-chip"">$_</span>" }) -join ''
    $chips = "<div class=""expert-chips""><span class=""expert-chip"" style=""border:none;background:transparent;padding-left:0;font-size:.72rem"">研发与临床支持：</span>$chipHtml</div>"
  }
  W "        <div class=""device-pane"" data-device=""$($pr.id)"" data-cat=""$($pr.cat)""><div class=""device-layout""><div class=""device-media""><img src=""$($pr.img)"" alt=""$($pr.name)"" loading=""lazy"" width=""900"" height=""675""></div><div class=""device-copy""><h3>$($pr.name)</h3><p class=""device-desc"">$($pr.desc)</p><div class=""device-clinical""><strong>临床价值</strong>$($pr.clinical)</div>$chips</div></div></div>"
}
W '      </div></div></div></div></section>'

# Cases
W '<section id="cases" class="section"><div class="container">'
W '  <div class="section-head reveal"><span class="eyebrow">Clinical Evidence</span><h2>临床案例</h2><p>来自真实三甲医院的装机与使用记录，以临床结果验证设备价值。</p></div>'
W '  <div class="split-view reveal" data-split-view id="cases-split"><div class="split-list">'
$ki=0
foreach($cs in $cases){
  W "    <button type=""button"" class=""media-item"" data-detail-id=""case-$ki""><img src=""$($cs.img)"" alt=""$($cs.title)"" loading=""lazy"" width=""88"" height=""64""><div><p class=""tag"">$($cs.hospital)</p><h3>$($cs.title)</h3></div></button>"
  $ki++
}
W '  </div><aside class="split-detail"><div class="split-detail-head"><h3>案例详情</h3><button type="button" class="split-close btn btn-ghost">收起</button></div>'
$ki=0
foreach($cs in $cases){
  W "    <div class=""split-detail-pane"" id=""case-$ki"" hidden><img src=""$($cs.img)"" alt=""$($cs.title)"" loading=""lazy""><p class=""meta"">$($cs.hospital) · 使用设备：$($cs.device)</p><h4>$($cs.title)</h4><p><strong>临床效果：</strong>$($cs.effect)</p><div class=""case-value"">$($cs.value)</div><p class=""case-team"">$($cs.team)</p></div>"
  $ki++
}
W '  </aside></div></div></section>'

# Impact — narrative, no number wall
W '<section id="impact" class="section"><div class="container">'
W '  <div class="section-head center reveal"><span class="eyebrow">Human Impact</span><h2>社会价值</h2><p>技术的意义，在于让更多患者获得可及、可负担、可信赖的医疗服务。</p></div>'
W '  <div class="impact-grid reveal">'
foreach($st in $impactStories){
  W "    <article class=""impact-card""><img src=""$($st.img)"" alt=""$($st.title)"" loading=""lazy"" width=""900"" height=""560""><div class=""impact-card-body""><h3>$($st.title)</h3><p>$($st.body)</p><div class=""impact-value"">$($st.value)</div></div></article>"
}
W '  </div></div></section>'

# Contact
W '<section id="contact" class="section"><div class="container">'
W '  <div class="section-head center reveal"><span class="eyebrow">Contact</span><h2>联系我们</h2><p>产品咨询、临床合作与全球装机服务。</p></div>'
W '  <div class="contact-grid">'
W '    <div class="contact-info reveal">'
W '      <p>示例公司 Example Medical Technology<br>高端医疗设备与临床解决方案</p>'
W '      <div class="contact-block"><strong>中国总部</strong>上海市浦东新区张江高科技园区示例路 888 号</div>'
W '      <div class="contact-block"><strong>电话</strong>+86 21 8888 0000</div>'
W '      <div class="contact-block"><strong>商务</strong>contact@example-medtech.com</div>'
W '      <div class="contact-block"><strong>临床支持</strong>clinical@example-medtech.com</div>'
W '    </div>'
W '    <form class="contact-form reveal" id="contact-form">'
W '      <div class="form-row"><input type="text" name="name" placeholder="姓名" required><input type="email" name="email" placeholder="邮箱" required></div>'
W '      <select name="topic"><option value="product">设备咨询</option><option value="clinical">临床合作</option><option value="service">装机与服务</option><option value="partner">渠道合作</option></select>'
W '      <textarea name="message" rows="4" placeholder="留言内容" required></textarea>'
W '      <button type="submit" class="btn btn-primary">提交</button>'
W '    </form>'
W '  </div></div></section>'

# Resource drawer
W '<div class="drawer-overlay" id="resource-drawer" aria-hidden="true" role="dialog" aria-labelledby="drawer-title">'
W '  <div class="drawer-panel"><div class="drawer-head"><h2 id="drawer-title">资料下载 Center</h2><button type="button" class="drawer-close" id="resource-close" aria-label="关闭">&times;</button></div>'
W '    <div class="drawer-body"><ul class="resource-list">'
foreach($rs in $resources){
  W "      <li><a href=""#"" onclick=""return false"">$($rs.title)<span>$($rs.type)</span></a></li>"
}
W '    </ul><p style="font-size:.78rem;color:var(--text-muted);margin-top:1rem;line-height:1.6">如需完整技术文档与临床资料，请联系 clinical@example-medtech.com。</p></div>'
W '  </div></div>'

# Footer
W '<footer class="site-footer"><div class="container footer-inner">'
W '  <div class="footer-brand"><div class="logo"><span class="logo-mark">E</span><span class="logo-text">示例公司</span></div>'
W '  <p>源自中国，服务全球。以医疗设备与临床价值为核心。<br>上海市浦东新区张江高科技园区示例路 888 号</p></div>'
W '  <div class="footer-meta"><div>© 2026 Example Medical Technology</div><div>沪ICP备00000000号</div></div>'
W '</div></footer>'

W '<script>'; W $js; W '</script>'; W '</body>'; W '</html>'

[System.IO.File]::WriteAllLines($Out, $L, $utf8)
Write-Host "Generated $Out with $($L.Count) lines"
