####　Motoko 创建Canister， 可以使用class actor : 

``` rust
public shared(installer) actor class canister() = this{···}
```

```rust
var canister_ = await canister.canister();
```

#### Motoko更新Canister的Controller， 或者更新内存使用情况， 计算能力分配， 需要调用[management canister](./code.mo)

具体参数参考 ： [Here](https://sdk.dfinity.org/docs/interface-spec/index.html#ic-management-canister)

参考代码 ： [Code](https://github.com/Di-Box/Storage/blob/dfbb035fcd10c8580267c9e72c2d4622a2b7a88d/Container/src/Container/Container/Container.mo#L112)

#### 从Text 类型的Principal获取到Canister访问指针 ：

示例代码中， main.mo为调用方， canister.mo为被调用方

从Principal类型的Canister Principal 或者 Text类型的Principal值中得到canister“指针”：

示例代码：[Here](https://forum.dfinity.org/t/how-to-call-a-canister-by-using-canister-principal-in-a-canister/7386/3?u=c-b-elite)

核心即 :

```rust
actor (Text) : actor_Interface
```

其中actor_interface是被调用的canister的接口Interface， 即示例代码中的

```
    private type testCanister = actor{
        test : query() -> async Text;
    };
```

#### 跨Canister调用

只需要 await canister.function_name(params) 即可