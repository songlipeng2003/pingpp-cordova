/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */

var btnArr;
var obj = {"charge 或 order"};
var app = {
  // Application Constructor
  initialize: function () {
    // document.addEventListener('deviceready', this.onDeviceReady.bind(this), false);
    btnArr = document.getElementsByClassName("payBtn")
    for (var i = 0; i < btnArr.length; i++) {

      btnArr[i].addEventListener("click", this.pay);
    }

    document.getElementById("setDebug").addEventListener("click", this.setDebugMode);
    document.getElementById("getVersion").addEventListener("click", this.getVersion);

  },
  pay: function () {

    
    navigator.pingpp.createPayment(obj
        , function (result, error) {
      alert(result);
      alert(error);
    });


  },
  setDebugMode: function () {
    pingpp.setDebugMode(true);
  },
  getVersion:function () {
    pingpp.getVersion(function (version) {
      alert(version);
    });

  }
};

app.initialize();