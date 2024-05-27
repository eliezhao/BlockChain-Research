# Iner canister query call

## roadmap reference

https://forum.dfinity.org/t/inter-canister-query-calls-community-consideration/6754



## 总结

社区对跨canister查询， query -> query 查询有比较大的需求。

当前canister团队主要重心在 ： 

​	canister security sandbox & sandboxing processing (和阈值ECDSA，和BTC， ETH交互有关)

​	提升canister 内存

​	Canister和磁盘IO交互性能提升 ： https://www.youtube.com/watch?v=NWSeM8YgGv4&t=471s



我的思考：

​	1. 如果认为query在canister内执行是同步的， 那么对于子网内跨canister query而言， canister应该做的是在节点本地进行跨canister actor通信， 这样才可以尽可能的避免由于网络路由造成的时间损失。

 2.    IC团队可能考虑的是： canister返回的信息需要是安全的， 并且尝试从底层上尽可能优化，以满足连环认证query call。 现在只有update call可以向外发送消息， 除了我上一条说的同步原因， 还有一个原因可能是认证数据，即本条说的"canister应该返回安全的数据"。

       我认为IC团队应该可以做到对得到最终一致性的数据进行query call 访问的， 对连环query得到的数据， 可以用类似zk-rollup的方式将query的数据的merkle path通过roll up的方式roll起来，然后将结果发送给用户， 用户可以通过zk验证query途中的数据的正确性。和现在用户验证IC发送的消息一样。

       