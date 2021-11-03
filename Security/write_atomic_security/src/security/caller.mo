import sha256 "SHA256";
import Array "mo:base/Array";
import Text "mo:base/Text";

actor {

    public shared func serise_block() : async Nat{
        var array : [[Nat]] = [];
        let metadata = "计算20个字符串的数组sha256， 并对数组进行不断的copy"; 
        var flag = 0;
        label result : (Nat) loop{
            let new = sha256.sha256(Text.encodeUtf8(metadata));
            array := Array.append(array, [new]);
            flag := flag + 1;
            if(flag == 5){
                break result(array.size())
            }
        }
    };

};