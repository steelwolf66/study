下面这份 1 个月（4 周 × 7 天）面试复习路线，专为「7 年 Java 后端开发」设计，目标是「高频考点 + 实战项目亮点 + 面试表达」三位一体。  
每天 2～3 小时即可，工作日利用碎片时间刷题与记忆，周末整块时间做系统梳理与模拟面试。

————————————————  
总原则  
1. 以 JD 为靶：先收集 5–8 份意向岗位 JD，把关键词（微服务、高并发、分布式、云原生）标红。  
2. 面试=“八股文”+“项目亮点”+“场景题”：三者权重 4:4:2。  
3. 所有复习输出必须落到「一页 A4」：面试前 5 分钟可快速过一遍。  
————————————————  

Week 1  基础 + Java 8/11 新特性  
Day1  Java 语言核心  
• 重读《Effective Java》第 2、3 章：对象创建、泛型、枚举。  
• 手写 5 个代码片段：深拷贝、不可变对象、泛型擦除示例、try-with-resources、自定义注解解析。  

Day2  集合 & JCF  
• 思维导图：ArrayList/LinkedList、HashMap/ConcurrentHashMap、TreeMap 底层演进（JDK7→8→17）。  
• 手写：自己实现一个简化版 HashMap（开放地址法），面试可讲思路。  

Day3  并发基础  
• 三件套：JMM、CAS、AQS；把 AbstractQueuedSynchronizer 源码目录手画一遍。  
• 手写：手写一个可重入锁（基于 AQS），输出“为什么需要 state 前 16 位存重入次数”。  

Day4  Java 8/11 新特性  
• Stream 源码：map/filter/reduce 如何懒加载，Spliterator 角色。  
• Optional、CompletableFuture、var、HttpClient、新版 GC（ZGC、Shenandoah）。  
• 面试回答模板：新特性带来的“代码可维护性提升 + 性能对比数据”。  

Day5  JVM & GC  
• 把 JVM 内存区域画成 5 层蛋糕图，每层写最大容量参数。  
• 准备 3 个案例：Young GC 频繁、Full GC 过长、MetaSpace OOM，各给定位步骤 + 日志截图。  

Day6  类加载 & 字节码  
• 双亲委派手写实现（URLClassLoader 演示热加载）。  
• ASM 读写字节码：实现一个 @Log 注解，输出方法耗时。  

Day7  Week1 复盘  
• 用 1 张 A4 画「Java 工程师核心知识地图」。  
• 30 min 模拟面试：让朋友挑 5 个问题，录音回听找口头禅。  

————————————————  

Week 2  框架 & 数据库  
Day8  Spring IOC & AOP  
• 画 Bean 生命周期泳道图（定位 8 个扩展点）。  
• 手写 AOP：JDK 动态代理 vs CGLIB，输出“为什么 SpringBoot 2.x 默认用 CGLIB”。  

Day9  Spring Boot & 自动配置  
• debug 走一遍 EnableAutoConfiguration 加载流程，总结 3 个排除重复 Bean 的技巧。  
• 准备 1 个“starter 开发”案例：公司短信 SDK 封装。  

Day10  Spring Cloud 微服务  
• 画“微服务 5 大件”思维导图：注册中心、配置中心、熔断、链路追踪、网关。  
• 各挑 1 个场景题：  
  ‑ Nacos CP/AP 模式切换对 CAP 影响？  
  ‑ Sentinel 滑动窗口算法源码级讲解。  

Day11  MySQL 索引 & 事务  
• 画 B+Tree 三层高度图，计算 2000w 行数据需要几次 IO。  
• 手写：RR 隔离级别下 next-key lock 导致的死锁案例 SQL。  

Day12  MySQL 性能调优  
• 准备 3 份「慢 SQL + 执行计划 + 优化后对比」截图。  
• 重点背：join buffer、MRR、ICP、覆盖索引。  

Day13  ORM & 连接池  
• MyBatis 一二级缓存穿透解决方案。  
• HikariCP 为什么快？准备 3 个参数（maximumPoolSize、idleTimeout、leakDetectionThreshold）。  

Day14  Week2 复盘  
• 把 Spring 全家桶 + MySQL 高频面试题整理成 20 张闪卡（Anki）。  
• 参加一次线上技术沙龙直播，找差距。  

————————————————  

Week 3  分布式 & 中间件  
Day15  Redis 数据结构 & 线程模型  
• 画 Redis 6 种底层编码转换图。  
• 场景题：bitmap 统计 1 亿用户日活占多少内存？  

Day16  Redis 高可用  
• 主从+哨兵 vs Cluster 槽位迁移原理。  
• 手写：Redisson 分布式锁“看门狗”失效怎么办？  

Day17  消息队列（Kafka 或 RocketMQ 选一个）  
• 画“消息刷盘 + 同步复制”时序图。  
• 准备 2 个故障 case：消息积压、顺序消费被打乱。  

Day18  分布式事务  
• 2PC、TCC、Saga、MQ 最终一致性各画 1 张流程图。  
• 手写：Seata AT 模式 undo log 记录格式。  

Day19  高并发场景  
• 用 4 张图讲清楚你的系统：  
  ‑ 流量漏斗（接入层 Nginx → 网关 → 服务 → DB）  
  ‑ 热点 Key 发现 & 本地缓存 Caffeine 两级缓存  
  ‑ 分库分表 sharding 策略  
  ‑ 全链路压测报告截图  

Day20  性能调优工具  
• arthas：watch/trace 命令演示一次 CPU 飙高排查。  
• JMH：写 1 个基准测试，对比 synchronized/LongAdder 性能。  

Day21  Week3 复盘  
• 把分布式场景题整理成「STAR」模板（Situation-Task-Action-Result）。  
• 录屏 5 min：用画图软件完整讲一遍你的秒杀系统设计。  

————————————————  

Week 4  项目梳理 & 面试冲刺  
Day22  项目亮点提炼  
• 选 1 个你最熟悉的核心业务，写一页「项目价值公式」：  
  节省成本 = 原耗时 × 单价 − 新耗时 × 单价 − 开发人日 × 单价。  
• 准备 3 个数字：QPS 提升、接口 RT、服务器缩容比例。  

Day23  场景题 & 开放题  
• 把常见场景题分类：限流、幂等、灰度、数据迁移。  
• 每类各写 3 个“一句话思路 + 一张图 + 一段落地代码”。  

Day24  系统设计（DDD + 云原生）  
• 画 C4 Model：System Context → Container → Component → Code。  
• 准备一个“老系统上 K8s”迁移方案：滚动升级、ConfigMap、HPA。  

Day25  手写算法 & LeetCode  
• 只刷面试最高频 20 题：LRU、TopK、链表反转、二叉树层序遍历。  
• 现场面试时，先写可运行伪代码，再解释复杂度。  

Day26  行为面试（BQ）  
• 用 CARL 模型（Context-Action-Result-Learning）准备 6 个故事：  
  冲突解决、技术推动、线上故障、跨团队协作、带新人、技术选型。  

Day27  模拟面试 & 查漏补缺  
• 找 2 位同事做 45 min 全真模拟：自我介绍 → 项目 → 技术 → 手写代码 → 反问。  
• 记录问题清单，当晚 fix。  

Day28  冲刺复盘  
• 打印「一页 A4 核心知识地图」+「项目亮点数字」+「行为面试故事」。  
• 调整作息：面试周 23:30 前睡觉，保证大脑缓存命中率。  

————————————————  
资料清单  
• 书籍：  
  ‑《Java 并发编程实战》  
  ‑《深入理解 JVM 虚拟机》  
  ‑《MySQL 技术内幕》  
  ‑《Redis 设计与实现》  
• 课程：  
  ‑ 极客时间《Java 面试 40 讲》  
  ‑ 阿里技术公众号「中间件团队」系列文章  
• 工具：  
  ‑ Anki/Quizlet 做闪卡  
  ‑ Excalidraw/Draw.io 画图  
  ‑ Arthas + JMH + GCViewer  

祝 1 个月后 offer 多多！