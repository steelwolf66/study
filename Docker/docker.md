# docker 笔记

## 1.Dockerfile

### 1)build上下文

所谓的 build 上下文就是 docker build 命令的 PATH 或 URL 指定的路径中的文件的集合。在镜像 build 过程中可以引用上下文中的任何文件，比如我们要介绍的 COPY 和 ADD 命令，就可以引用上下文中的文件。



### 2）ADD 命令和COPY 的区别

COPY 和 ADD 命令不能拷贝上下文之外的本地文件

这两个命令，在拷贝文件夹时，需重新指定外层文件夹名称；

eg:

/app下有两个文件夹

/app/file1/

/app/file2/

执行COPY /app .

那么，容器内就只会有file1和file2,而不会有上层的/app

ADD /app /app会解决该问题

------

ADD区别于COPY的两个功能 ：

1）解压压缩文件并把它们添加到镜像中

2）从url拷贝文件到镜像中（不推荐使用）