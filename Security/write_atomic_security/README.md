# security dmeo
## 测试内容
写的代码模拟的是存钱-取钱系统的攻击：
利用的原理是： IC Blockchain：  shared函数（函数1）进行await时会暂时挂起，同时释放函数体内全局变量的写锁。其他函数可以修改其使用的全局变量。

## 模拟攻击Canister环境：
* 本金500
* 先存钱 100， 存钱函数await另外的canister， 存钱函数挂起。
* 取钱 500， 取钱函数不await，执行后返回

## 关键攻击漏洞：
* 被攻击的函数（block_func）内对全局变量使用了一份先前状态的copy（preVal）， 导致出问题 

## 测试结论：
* IC Blockchain 函数内await后会释放全局变量写锁。 [官方文档说明, WARNNING 部分](https://sdk.dfinity.org/docs/language-guide/actors-async.html#_using_await_to_consume_async_futures)
* 全局变量的执行结果以最后执行完的函数结果来定，而不是根据调用时间来定。

## 建议：
资产敏感类函数调用后需要用assert来判断全局变量值是否和预期一样。

* 需要下载Parallel 包
* ``` sudo apt install paraller ```
* 测试命令：
* ```  cat test.sh | parallel -j 2 ```
* 测试完后需要Reset， 否则就需要记住之前的状态。 初始状态globalVal 值为 3
* 查询globalval命令：
* ``` dfx canister --network ic call main getVal ```
* reset globalVal 命令：
* ``` dfx canister --network ic call main reset ```

我的测试 （2021.10.15 22:42）：
测试环境 ： 
* OS : Ubuntu 20.04
* dfx : 0.8.1
* vpn : expressvpn（可能影响网络传输时间 所以在shell命令中打印了attack / block命令的执行时间）

测试结果
* attack 2021-10-15 22:41:42.484
* (0 : int)
* attack 2021-10-15 22:41:46.483
* block 2021-10-15 22:41:42.480
* (8 : int)
* block 2021-10-15 22:41:45.839
* (8 : int)
* eval : dfx canister --network ic call main getVal
* (8 : int)
