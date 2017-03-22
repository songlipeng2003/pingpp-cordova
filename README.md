# Cordova Plugin Pingpp
Ping++ 是为移动端应用以及 PC 网页量身打造的下一代支付系统，通过一个 SDK 便可以同时支持移动端以及 PC 端网页的多种主流支付渠道，你只需要一次接入即可完成多个渠道的接入。 Ping++ SDK 包括 Client SDK 和 Server SDK 两部分，支持主流的七种后端开发语言，适配了 Android，iOS 和 HTML5 三种移动端平台以及 PC 端网页。

#### 支持以下渠道支付
1. 支付宝 (alipay)
2. 微信支付 (wx)
3. 银联支付(upacp)
4. QQ钱包 (qpay)

## 插件安装
```sh
$ cordova plugin add https://git.coding.net/pingplusplus/pingpp-cordova.git
```

### 使用方法
```js
/** 
 * 调用支付
 * @param object {"object":"charge 或 order" , "urlScheme":"YOU-URLSCHEME"}
 * @param function completionCallback  支付结果回调 (result, error)
 */
Pingpp.createPayment(object, function (result, error) {
    alert(result);
    alert(error);
});

// 开启debug模式
Pingpp.setDebugMode(enabled) // [true] or [false];

/**
 * 获取当前SDK的版本号
 * @param Function successCallback (version)
 */
Pingpp.getVersion(function(version){
    alert("当前SDK版本号是:" + version);
});
```


#### 官方 SDK
[pingpp-ios](https://github.com/PingPlusPlus/pingpp-ios)

[pingpp-android](https://github.com/PingPlusPlus/pingpp-android)

### 问题
[问题](https://coding.net/u/pingplusplus/p/pingpp-cordova/topic)

**关于如何使用 SDK 请参考 [开发者中心](https://www.pingxx.com/docs/index) **
