// 获取 metadata
#let get-var(name) = query(label(name)).first().value

// 设置 metadata
#let set-var(name, value) = [#metadata(value) #label(name)]

// 图标
#let svg-icon(path) = context {
  let theme-color = get-var("theme-color")
  let box-base-line = get-var("box-base-line")

  let svg = read(path)
  svg = svg.replace(regex("fill=\".*?\""), "") // 先把旧的 fill 全删掉
  svg = svg.replace("<path", "<path fill=\"" + theme-color.to-hex() + "\"")

  box(
    baseline: box-base-line,
    height: 1.0em,
    width: 1.25em,
    align(center + horizon, image.decode(svg)),
  )
}

// Font Awesome
#let fa-bilibili = svg-icon("icons/fa-bilibili.svg")
#let fa-code = svg-icon("icons/fa-code.svg")
#let fa-envelope = svg-icon("icons/fa-envelope.svg")
#let fa-github = svg-icon("icons/fa-github.svg")
#let fa-graduation-cap = svg-icon("icons/fa-graduation-cap.svg")
#let fa-link = svg-icon("icons/fa-link.svg")
#let fa-phone = svg-icon("icons/fa-phone.svg")
#let fa-weixin = svg-icon("icons/fa-weixin.svg")
#let fa-work = svg-icon("icons/fa-work.svg")
#let fa-wrench = svg-icon("icons/fa-wrench.svg")

// 隐私
#let privacy(body) = context {
  let anonymous = get-var("anonymous")
  let box-base-line = get-var("box-base-line")

  if (anonymous) {
    let size = measure(body)
    // 用黑块挡住
    box(
      fill: black,
      baseline: box-base-line,
      width: size.width,
      height: size.height
    )
  } else {
    body
  }
}

// 设置
#let resume(
  body,

  margin-top: 1.5cm,
  margin-bottom: 2cm,
  margin-left: 2cm,
  margin-right: 2cm,
  page-numbering: none,
  fonts: ("Noto Sans SC",),
  text-size: 10pt,
  theme-color: rgb(38, 38, 125),
  box-base-line: 0.15em,
  name-size: 1.4em,
  par-leading: 0.4em,

  name: "名字",
  phone: "(+86) 123-4567-8910",
  wechat: "wechat",
  email: "mail@gmail.com",
  github: "github",
  sites: ("site.com",),
  anonymous: false,
) = {
  // 页面设置
  set page(paper: "a4", numbering: page-numbering, margin: (
    top: margin-top,
    bottom: margin-bottom,
    left: margin-left,
    right: margin-right,
  ))

  // 字体设置
  set text(font: fonts, size: text-size, lang: "zh", cjk-latin-spacing: auto)

  // 标题颜色
  show heading: set text(theme-color)

  // 二级标题下加一条横线
  show heading.where(level: 2): it => stack(
    // v(-0.2em),
    it,
    v(0.6em),
    line(length: 100%, stroke: 0.05em + theme-color),
  )

  // 链接颜色和下划线
  show link: it => {
    set text(fill: theme-color)
    underline(it)
  }

  // 段落设置
  show par: set block(spacing: 0.5em) // 段间距，但似乎没用？？
  set par(justify: true, leading: par-leading) // 行间距

  // 全局变量，某些函数会用到
  set-var("theme-color", theme-color)
  set-var("box-base-line", box-base-line)
  set-var("par-leading", par-leading)
  set-var("anonymous", anonymous)

  // 标题
  heading(text(name-size, privacy(name)))

  // 基本信息
  grid(
    columns: (1fr, 1fr, auto),
    align: (left, left, left),
    row-gutter: 0.25em,

    [#fa-phone #privacy(phone)],
    [#fa-weixin #privacy(wechat)],
    [#fa-envelope #privacy(link("mailto:" + email, email))],
    [#fa-github #link("https://github.com/" + github, "github.com/" + github)],
    if (sites.len() > 0) [#fa-link #link("https://" + sites.at(0), sites.at(0))],
    if (sites.len() > 1) [#fa-link #link("https://" + sites.at(1), sites.at(1))],
  )

  // 正文
  body
}

// Section
#let section(title, body, icon: none) = [
  == #if (icon != none) { icon } #title

  #body
]

// 事件信息
#let event-info(title, time, ..body) = context {
  let par-leading = get-var("par-leading")

  grid(
    columns: (auto, 1fr),
    align: (left, right),
    row-gutter: par-leading,

    // 第一行标题和时间，时间的颜色调灰
    title, text(fill: rgb(90, 90, 90), time),
    // 后面 n 行正文
    ..body.pos().map(it => grid.cell(it, colspan: 2)),
  )
}

// 教育
#let education(..body, school: "学校", major: "专业", degree: "学位", start-time: "开始时间", end-time: "结束时间") = event-info(
  [*#school* · #major · #degree],
  [#start-time \~ #end-time],
  ..body
)

// 工作
#let work(..body, company: "公司", job: "职位", start-time: "开始时间", end-time: "结束时间") = event-info(
  [*#company* · #job],
  [#start-time \~ #end-time],
  ..body
)

// 项目
#let project(name, ..body, time: "", github: false, bv: none) = {
  let proj-title = if (github) [
    #fa-github #link("https://github.com/" + name, [*#name*])
  ] else [
    *#name*
  ]

  let bilibili-link = if (bv != none) [
    · #fa-bilibili #link("https://www.bilibili.com/video/" + bv + "/", bv)
  ]

  event-info([#proj-title #bilibili-link], time, ..body)
}
