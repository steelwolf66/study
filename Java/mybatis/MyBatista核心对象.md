# MyBatista核心对象

### 1.Configuration

配置信息

### 2.SqlSessionFactoryBuilder
主要是用来创建SessionFactory
而且是创建之后，这个Builder就会被销毁；所以这个类的作用于最好是方法内或者局部变量

### 3.SqlSessionFactory
用来创建SqlSession对象，factory的作用域是application；所以单例模式最适合SqlSessionFactory;
通过factory的openSession（）方法，创建SqlSession对象，Boolean类型传参，true代表自动提交；false手动提交；缺省值为true;

### 4.SqlSession

是用来执行持久化操作的对象；类似JDBC中的connection；提供了面向数据库的所有方法，可以通过SqlSession直接执行已经映射了的SQL；

---

SqlSession对应一次数据库会话，数据库会话不可能是一直存在的，所以SqlSession的生命周期也应该是一样的（注意：不是一个对象只能执行一次SQL，是可以执行多次的）；

---

每个线程，都会有个单独的SqlSession对象，不能共享，也是线程不安全的。所以，SqlSession的作用于应该是方法范围或者request级别（最好就是request，因为Spring处理http请求，就是每个请求，创建一个线程）；当然，每个request被处理之后，SqlSession 也要被关闭，所以SqlSession 的close（）方法，最好是在finally代码块中执行。

---