cordova.define('cordova/plugin_list', function(require, exports, module) {
module.exports = [
    {
        "id": "cordova-plugin-pingpp.pingpp",
        "file": "plugins/cordova-plugin-pingpp/www/pingpp.js",
        "pluginId": "cordova-plugin-pingpp",
        "clobbers": [
            "Pingpp"
        ]
    }
];
module.exports.metadata = 
// TOP OF METADATA
{
    "cordova-plugin-whitelist": "1.3.2",
    "cordova-plugin-pingpp": "1.0.0"
};
// BOTTOM OF METADATA
});