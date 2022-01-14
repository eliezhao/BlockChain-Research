# Canister Safe Upgrade

## 相关连接

https://github.com/dfinity/motoko/issues/2692





## 检查升级前后是否会造成data loss

`moc --stable-types foo.mo` will write the stable signature of an actor(class) to file `foo.most`.
`moc --stable-compatible old.most new.most` will check that the stable interface can evolve form old.most to new.most in a type safe way without unintentional data loss.