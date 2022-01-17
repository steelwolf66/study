# Spring Cloud 组件

## 1.Nacos

nacos作为阿里的开源框架，尤其是在Spring Cloud Alibaba 的相关子项目 孵化完成后，成为了主流的注册中心。

与之对应的就是Spring Cloud 最开始支持的Eureka,Eureka已再早些时候停止更新，也更加促进了Nacos的推广步伐。

Nacos在整个架构中的主要职责分为两个，并且是可拆分的。

- 注册中心
- 配置中心

1. ##### 作为注册中心：

   在整个微服务架构中，注册中心的概念，是非常重要的，就类似于整个架构的登记手册，而且是实时更新的。

   其中Nacos提供的能力就是服务发现和服务治理。这里的服务治理是指，发现注册服务以及人工下线服务等操作，与Sentinel熔断机制不同。

2. ##### 作为配置中心

​      主要是以整个微服务架构的SpringBoot启动的配置文件为主，也可以作为其他应用的配置中心，例如作为Sentinel的数据源，也是可以的。

​	以Nacos作为注册中心的好处就是，不必手动修改具体项目中的配置文件，并重启服务，这样是比较慢也是比较影响用户体验的一种方式。在Nacos中修改配置，会将配置推送到具体服务，具体的服务会，进行刷新



集群配置：

CAP理论（一致性Consistency、高可用Availability、分区容错性Partition tolerance）

ps:在微服务架构中，不可能百分之百保证完全符合CAP理论，一般是CP和AP做取舍。

作为注册中心，一定是高可用的，所以，采用AP，一般生产都是要搭建Nacos集群来保证高可用

例如：共三个节点，其中的两个节点挂了，仍然有一个节点可以满足，那么就是高可用的一种实现。

## 2.Feign

作为整个架构中，各个服务之间调用的基础组件。

1. 可以更加快捷的帮助我们调用其他服务（相同注册中心）的Restful API
2. 本身Feign就是个开源项目，是个声明式WebService客户端，而Spring Cloud 将其整合，使得开发人员更加便捷的使用。
3. Spring Cloud 整合后的Feign组件，支持通过接口和注解的方式，来调用其他注册在注册中心的微服务

## 3.Gateway



## 4.Sentinel

流量控制、熔断降级、系统负载保护

支持回调函数

![img](https://img-blog.csdnimg.cn/20191130203727708.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L25vYW1hbl93Z3M=,size_16,color_FFFFFF,t_70)



