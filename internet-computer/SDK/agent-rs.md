# 一些关于agent-rs的学习，记录和思考
- Update Call
  - update call可以分为call + read_state
  - call通过将本地的http payload封装为ic boundary node认同的格式，用reqwest或者hyper传给boundary node
  - read state负责读取canister执行结果的返回值，