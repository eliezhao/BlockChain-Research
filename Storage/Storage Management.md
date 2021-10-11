# Garbage Collection

现在moc中还有一个测试CLI 命令， 可以在平时禁用GC， 待upgrade的时候再GC

## 使用方法

### DFX （0.8.1 +）

DFX 0.8.1 更新指定GC方法： 

DFX 0.8.1 创建的项目中， dfx.json 文件中， build 目录下新增 `"args": ""` 栏， 可在此指定GC算法

具体步骤 ： 在项目dfx.json中:

```"build" : {
"build" : {
"args" : "",
"packtool" : ""
}
```

修改为：

``` "build" : {
"build" : {
"args" : "--compacting-gc",
"packtool" : ""
}
```

即可从Motoko默认的Coping GC转换为Compacting GC， Compacting GC详细介绍参考上文Compacting GC， Coping GC请参考IC Storage（本层文件夹下另一Markdown文件）

#### DFX Memory Management

* dfx 将在编译CLI命令中提供新的flag --- 指定GC（Garbage Collection 运行时垃圾回收）方式， 现阶段Motoko GC 算法为Copying算法（Minor GC）， 导致Motoko编译的Canister可使用运行时内存（WASM RTS Memory， 主要是Heap Memory）为2G。新增加的flag中会增加选择GC方式： 新增的GC算法为Compacting GC，可使Motoko编译的Canister可访问4G的运行时内存。[2]

    * moc 中flag可选 --compacting gc 来更换coping gc

* dfx 0.8.1 以上版本 ：

    * 在 dfx.json 中

    * ``````json
        "build":{
            "args" : "--compacting-gc"
        }
        ``````

    * 通过如上方式可以更改copying gc 到 compacting gc

* dfx指定内存管理：

    * dfx --memory-allocation
    * Reserved : Canister自动管理内存， 但是不会超过最大限制， 收费按照12G(Stable+RTS)来算
    * Best-effort ： Canister默认使用所有内存， 可能会超过子网最大内存， 会有风险

*   操作

*   在创建Canister的时候 ： ``` dfx canister create xxx``` 可以使用 ``` --memory-allocation ``` flag 指定Canister的内存使用方案。

    如果已经创建了canister， 可以使用 ``` dfx canister update-settings ``` 来指定。

    e.g. :

    * 创建一个使用 1 MB 的 canister ： ``` dfx canister create --memory-allocation "1 MiB"  ```
    * 升级canister ：``` dfx canister update-settings --memory-allocation "1 MiB" hello ```

    

### Moc

moc 工具是将.mo文件编译为.wasm文件， 生成.did文件的， 平时是在dfx build时运行。

 生成compacting gc 的 Canister：

首先， 使用dfx build Canister， 编译的文件在dfx.json所在的文件夹， .dfx/local/canisters中， dfx build 生成.wasm， .did等文件。

将需要用compacting gc的Canister的.wasm文件从.dfx/local/canisters/canister_name/文件夹下删除

在.dfx/local/canisters/canister_name/文件夹下使用： `moc --compacting-gc motoko_file（motoko文件所在地址）-o ./canister_name.wasm（生成的canister的名字，也就是之前删除的canister.wasm的canister名）` 生成.wasm文件

P.S.  如果更改了源码， 仅仅用moc生成.wasm文件是不行的， 还需要用moc文件生成.did文件。

moc使用方法文档 ： https://sdk.dfinity.org/docs/language-guide/compiler-ref.html

moc的可执行文件在`~/.cache/dfinity/versions/0.8.1/` （版本号可变）



## Motoko， Rust 获取Canister存储状态

### Motoko

## Prim.mo 提供访问运行时内存的API

RTS : Run Time System 运行时系统， 包含GC， 序列化（通信传输用）， low-level 库（底层分配内存等）的调用

**rts_memory_size: () -> Nat** ：当前WASM的内存， 不是使用了多少的内存， 而是已经分配了的堆内存 

**rts_heap_size: () -> Nat** ： 当前实际堆内存大小

**rts_max_live_size : () -> Nat** ： 从上次GC到现在堆最大的大小【这个比较有用， RTS_Memory应该为RTS_HEAP_SIZE + 196108byte(比rts运行时组件稍微大一些)】

rts_total_allocation: () -> Nat;

rts_version : **()** -> Text  

 rts_reclaimed : **()** -> Nat;

 rts_max_live_size : **()** -> Nat;

#### 更新动态：

* Motoko将提供使用32bit stable 内存的API， 并且访问stable内存的大小将随着stable内存的扩容（32bit -> 子网所有stable内存）而扩容[2]


### Rust

* 使用IC "aaaaa-aa" Actor可以访问IC.status， 也可以返回上面说到的内存数据
* Rust可以在非Upgrade时期， 通过cdk中提供的API直接操作Stable内存（TODO）[1] 

* * https://forum.dfinity.org/t/memory-allocation-explained/7761#ic-storage-basics-2)



## TODO： 

* 实验评估Coping GC 与 Compacting GC ： Cycles的消耗和速度对比
* Motoko Compacting GC触发内存大小





