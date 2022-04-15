## Delete 原理
- 先写好可以转cycle的cansiter的wasm
- 将原来的canister删除，然后将支持转cycle的canister的wasm下载到被删除的cansiter
- 调用下载好的wasm的transfer cycle函数到应该给的wallet中
- 调用management canister删除canister
