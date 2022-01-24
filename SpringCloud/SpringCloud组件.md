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


#### 一、基础概念

1.路由（Route）

​	网关的基础构建块。由ID、目标URL、一组断言、和一组过滤器定义 。

​	如果断言为真，则路由匹配

- Predicate（断言） 

  输入类型为 ServerWebExchange ，用来匹配Http请求中的内容，例如header中的参数等

- Filter（过滤器）

  Gateway中的过滤器分为两种

  - Gateway Filter

  - Global Filter

    在过滤器中，可以对请求和响应进行处理

    ------

    

#### 二、配置文件

1.yml配置文件

spring:
  application:
    name: gateway-server # 应用名称
  cloud:
    gateway:
      routes:
        - id: shop-goods                  # 路由 ID,唯一
          uri: http://localhost:9101/     # 目标URI,路由到微服务的地址（也就是最终转发地址）
          predicates:                     # 断言(判断条件)
          

            - Path=/goods/**              # 匹配对应 URL 的请求,将匹配到的请求追加在目标 URI 之后
          
              ------


​              

#### 三、过滤器

##### 1.两种类型过滤器

 pre和post

- pre:这种过滤器在请求被路由之前调用。可以利用这个过滤器实现身份验证、操作日志。
- post：这种过滤器在路由到服务器之后执行。这种过滤器可用来为响应添加HTTP Header、统计信息和指标、响应从微服务发送给客户端等

##### 2.GatewayFilter和GlobalFilter

支持自定义filter，可以在filter中写自己的应用逻辑

- GlobalFilter应用到所有路由

- GatewayFilter 应用到指定路由或者一个分组路由

  gatewayFilter开发完成后，需要重新注册（yml或者写配置类来注册）

  globalFilter不需要

#### 四、动态路由

依赖nacos-config 

代码中配置nacos listener，动态监听在nacos中的配置，并写到gateway服务的配置类里，从而达到动态路由的效果

这样就可以在不重启网关服务的情况下，实现请求转发和处理。
## 4.Sentinel

流量控制、熔断降级、系统负载保护

支持回调函数

![img](https://img-blog.csdnimg.cn/20191130203727708.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L25vYW1hbl93Z3M=,size_16,color_FFFFFF,t_70)



```
hikari
```



公共组件

mybatis