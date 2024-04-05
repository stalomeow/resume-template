#import "../template.typ": *

#show: resume.with(
  margin-top: 1cm,
  margin-bottom: 1cm,
  margin-left: 2cm,
  margin-right: 2cm,
  fonts: ("Noto Sans SC",),
  text-size: 10pt,

  name: "ChatGPT",
  phone: "(+86) 123-4567-8910",
  wechat: "chatgpt",
  email: "chatgpt@gmail.com",
  github: "chatgpt",
  sites: ("chat.openai.com",),
  anonymous: false,
)

#section("教育经历", icon: fa-graduation-cap)[
  #education(
    school: "北京大学",
    major: "计算机科学与技术",
    degree: "硕士研究生",
    start-time: "2022-09",
    end-time: "2024-06",
  )
  #education(
    school: "北京大学",
    major: "计算机科学与技术",
    degree: "本科",
    start-time: "2018-09",
    end-time: "2022-06",
  )
]

#section("实习经历", icon: fa-work)[
  #work(company: "ABC 科技有限公司", job: "实习 Unity 开发工程师", start-time: "2023-07", end-time: "2023-09")[
    - 参与公司 AR 游戏项目的开发和优化，负责核心功能模块的实现和性能优化。
    - 优化了 AR 游戏的图像识别算法，将识别速度提升了 40%，用户体验得到了明显改善。
    - 完成了游戏中新功能的开发，增加了用户互动性，使用户留存率提高了 20%。
  ]
]

#section("个人项目", icon: fa-code)[
  #project("chatgpt/space-demo", time: "2023-06", github: true, bv: "BV00000")[
    开发一款科幻冒险游戏，玩家扮演宇航员探索未知星球，面对外星生物和危险环境，利用科技装备求生存。
    - 设计并实现游戏核心功能，包括角色控制、任务系统、武器装备等。
    - 优化游戏性能，确保在各种设备上流畅运行。
  ]

  #project("虚拟化学实验室", time: "2023-04")[
    开发一款虚拟化学实验应用，让学生通过虚拟环境进行化学实验，提高实验操作技能和安全意识。
    - 制定项目计划和开发路线图。
    - 编写核心代码和实验模块。
    - 负责项目演示和用户反馈收集。
  ]
]

#section("技能", icon: fa-wrench)[
  - Unity 游戏开发：
    - 熟练掌握 Unity 引擎，具备扎实的 C\# 编程能力。
    - 能够独立完成游戏逻辑设计与开发，包括 UI 设计、游戏机制实现、碰撞检测等。
    - 对 Unity 中的光照、动画、特效等功能有较深入的了解和应用经验。

  - 跨平台开发：
    - 熟悉将游戏移植到不同平台的过程和技巧，包括 PC、移动设备等。
    - 熟练使用 Unity 的跨平台特性和工具，确保游戏在不同设备上的性能和稳定性。

  - 人工智能与游戏：
    - 在研究生阶段深入学习人工智能与游戏领域，了解游戏智能算法和技术应用。

  - 团队协作：
    - 在多个团队项目中担任开发者和协调者角色，具备良好的沟通和团队合作能力。
    - 能够理解和分析项目需求，按时高效地完成工作并参与团队讨论与改进。
]
