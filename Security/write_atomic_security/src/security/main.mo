actor {
    
    /**
    *   Actor x 原子性安全测试
    *   首先， block function 运行， await 别的actor， 进行block， 这里对多个actor进行await， 以便测试 
    *   然后， 在本地快速调用attack func ， 破坏原子性， 看对全局变量的更改结果
    *   
    */


    private var globalVar : Int = 3;
    private type Canister = actor{
        block_func : shared() -> async Nat; 
    };
    private let text = "lkt4f-6qaaa-aaaai-qavra-cai";
    private let callee = actor (text) : Canister;

    /**
    *   思路：
    *       使用一个新的变量保存全局变量的状态
    *       await 别的actor
    *       最后将新的变量赋值给全局变量
    */
    public shared(msg) func block_func() : async Int{
        //let preVal = globalVar;
        // globalVar should be
        globalVar += (await callee.block_func());
        globalVar
    };

    public shared(msg) func attack_func() : async Int{
        //should be 0
        globalVar := globalVar - 3;
        globalVar
    };

    public shared func update_getVal() : async Int{
        globalVar
    };

    public query func getVal() : async Int{
        globalVar
    };  


    public shared func reset() : async (){
        globalVar := 3;
    };

};
