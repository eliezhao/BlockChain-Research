# P2P Lyaer

官方视频介绍链接 ： [Reference](https://www.youtube.com/watch?v=HOQb0lKIy9I&t=4s)

* 总体设计：

![image-20211107162319412](assets\image-20211107162319412.png)

* 子网节点可能会出现的问题 - 被拜占庭节点包围：

![image-20211107170417474](assets\image-20211107170417474.png)

1. 拜占庭节点包围：
   1. 增加request请求次数，达到阈值则认为正确
   2. 密码学，阈值签名
2. 错误信息传递：
   1. 签名验证
   2. 
3. bandwidth浪费 ： 
   1. 优化 ： 增加Message Pool中artifact的字段
   2. 还需要再看视频介绍， 配合着源码理解

![image-20211107170739695](assets/image-20211107170739695.png)
