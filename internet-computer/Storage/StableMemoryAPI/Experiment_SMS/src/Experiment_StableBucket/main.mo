import Blob "mo:base/Blob";
import D "mo:base/Debug";
import N32 "mo:base/Nat32";
import S "mo:base/ExperimentalStableMemory";
import T "mo:base/Text";

/**
*   Experimental Stable Memory API Example
*/


actor{

    let metadata = Blob.fromArray([0x11, 1:Nat8, 1:Nat8]); // 3 byte
    let size = N32.fromNat(metadata.size());
    // 测试用的函数，验证自己的内存模型建立的是否准确
    // public func grow() : async Nat32{ S.grow(65536:Nat32) };
     public func grow1() : async Nat32{ S.grow(2:Nat32) };
    public func store() : async (){
        S.storeBlob(65534:Nat32, metadata);
    };
    public func read() : async (){
        D.print(debug_show(S.loadBlob(65534,3)))
    };
    public func load() : async (){
        D.print(switch(T.decodeUtf8(S.loadBlob(1, N32.toNat(size)))){
            case null { "load error" };
            case (?t){ t };
        })
    };
    public func offset_store() : async (){
        S.storeBlob((1+size):Nat32, metadata)
    };
    public func offset_load() : async (){
        D.print(switch(T.decodeUtf8(S.loadBlob(1+size, N32.toNat(size)))){
            case null { "load error" };
            case (?t){ t };
        })
    };
    public func multi_load() : async (){
        D.print(switch(T.decodeUtf8(S.loadBlob(1, N32.toNat(size+size)))){
            case null { "load error" };
            case (?t){ t };
        })
    };


}