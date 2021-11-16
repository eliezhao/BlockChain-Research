# Consensus





## Block Receiver :  出块时间片

![image-20211116144759837](Consensus.assets/image-20211116144759837.png)

从rank 0 - rank n ，依次分配时间片接受区块。如果超时未接收，就到下面的rank block

几个问题 ： 如果因为网络传输原因没有收到block怎么办



block接收者拿到block后签名，通过gossip给别的replica， 每个replica在本地聚合签名。