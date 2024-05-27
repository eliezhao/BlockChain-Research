# Blockchain Research
我的区块链学习与思考
- InternetComputer： ICP网络
  - Introduction of internet computer文件夹中有对ICP网络的中英文介绍PDF（个人制作，随意使用，如果使用时能附上本github链接或者给个小star则不胜感谢）
  - 核心在Storage部分，之前在ICP上构建了MetaBox（去中心化存储聚合器，包括to c个人隐私存储和to b去中心化存储聚合器），因此积累了一些关于IC存储的经验。章节主要包括WebAssembly内存，IC-WebAssembly内存模型和管理，StableMemory内存模型和管理
  - Canister：
    - 介绍怎么在一个Canister中调用另外一个Canister
    - 以及调用ledger，使icp转为cycle的例子
  - Security： IC Canister写入具有原子性问题，因为Canister是异步的，细节在相应文件夹中。
  - SDK： 
    - 主要在与dfx是如何删除canister时回收cycle的。其实就是先reinstall要删除的canister, 新的canister wasm是cycle wallet canister，然后再调用这个canister，让他自己把cycle转出来就行了。这个用到了[ICAN 项目-Canister管理平台](https://github.com/Primlabs/ican)
    - agent-rs中关于update call的调用。对update call调用的研究用到了metabox 项目的上传的优化中[MetaBox 个人隐私存储，去中心化存储聚合器](https://ha5vw-uqaaa-aaaao-aapoq-cai.ic0.app)
  - HashTree: 在ICP网络中，使用了一个自定义的具有MerkleTree Digest功能的Tree，主要在CertifiedData的使用与验证中应用。
  - 其他文件夹是一些学习与了解的相关资料与总结。
- ZKP： 零知识证明