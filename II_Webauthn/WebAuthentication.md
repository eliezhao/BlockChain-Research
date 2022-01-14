# 学习与思考



## W3C Standard : 

​	https://www.w3.org/TR/webauthn-2/





## WebAuthn 简要学习

1.   主要技术：

     1.   Second Factor(双因素验证)
     2.   非对称密码
     3.   通信层主要是HTTPS（TLS）

     



2.   支持设备：

     Windows：Edge，Firefox，Chrome

     Linux  ：Firefox，Chrome

     MacOS  ：Safari，Firefox，Chrome

     Android：Firefox，Chrome

     iOS    ：Brave，Firefox，Chrome

     Windows上的Microsoft Edge，使用Windows Hello（带面部识别，指纹识别器或PIN）

     MacOS上的Chrome使用Touch ID指纹识别器

     Android上的Chrome，使用指纹识别器





3.   运行流程

     1.   Client 发送注册信息（可能需要通过用户名密码或者验证码等方式证明用户是一个合法用户）
     2.   服务端发送challenge code（一般是大于等于16 byte的码）
     3.   浏览器调用认证器（Authenticator），认证器通过发起验证：用户输入Pin码， 或者face id， 或者指纹， yubikey等。 
     4.   认证通过后， 认证器生成公私钥， 私钥安全保存。
     5.   认证器返回公钥， 全局唯一的凭证ID， 凭证数据给浏览器
     6.   浏览器打包信息：包括公钥， 认证凭证（包含可以证明当前公钥和注册的用户是相连的）， 客户端数据。
     7.   Server收到消息后，验签， 比对challenge等数据， 确定用户身份以及公钥是否正确。

     ![img](https://pics1.baidu.com/feed/b03533fa828ba61e9117a9323293260c314e595b.png?token=05e17a0f683261da7dc9228453db1eba) 





参考：

[1] https://baijiahao.baidu.com/s?id=1667228882303147989&wfr=spider&for=pc



