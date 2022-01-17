## Gateway

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