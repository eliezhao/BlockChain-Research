import sha256 "SHA256";
import Array "mo:base/Array";
import Text "mo:base/Text";

actor canister{
    /** 尽可能的让await时间长， 以让实验结果更鲜明 **/

    private type Caller = actor{
        serise_block : shared() -> async Nat; 
    };
    private let text = "lns2r-tiaaa-aaaai-qavrq-cai";
    private let caller = actor (text) : Caller;


    /**
    *   计算20个字符串的数组sha256， 并对数组进行不断的copy
    */
    public shared(msg) func block_func() : async Nat{
        var array : [[Nat]] = [];
        let metadata = "计算20个字符串的数组sha256， 并对数组进行不断的copy"; 
        var flag = 0;
        label result : (Nat) loop{
            let new = (await caller.serise_block());
            array := Array.append(array, [[new]]);
            flag := flag + 1;
            if(flag == 5){
                break result(array.size())
            }
        }
    };






};