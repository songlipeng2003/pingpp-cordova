  /**
   * ping++, cordova, module
   * */

  module.exports = {
    /**
     * 开启/关闭 Ping++ debug 模式
     * @param boolean true|false
     */
    setDebugMode: function (enabled) {
      cordova.exec(function () {
      }, null, "PingppPlugin", "setDebugMode", [enabled]);
    },
    /**
     * 获取当前SDK的版本号
     * @param {Function} successCallback (version)
     */
    getVersion: function (successCallback) {
      cordova.exec(successCallback, function () {
      }, "PingppPlugin", "getVersion", []);
    },
    /**
     * 调用支付
     * @param object {"object":"charge 或 order" }
     * @param function completionCallback  支付结果回调 (result, error)
     */
    createPayment: function (object, successCallback) {
      cordova.exec(function (response) {
        successCallback(response.result, response.error);
      },null, "PingppPlugin", "createPayment", [object]);
    }
  };