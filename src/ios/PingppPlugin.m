#import "PingppPlugin.h"
#import "Pingpp.h"

@implementation PingppPlugin
    NSDictionary *object ;
#pragma mark - 调用 支付 SDK
- (void)createPayment:(CDVInvokedUrlCommand*)command
    {
        self.myCallbackId = command.callbackId;
        object = [[command arguments] objectAtIndex:0];
        NSString* URLScheme = [self getURLScheme];
        UIViewController * __weak weakSelf = self.viewController;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [Pingpp createPayment:object viewController:weakSelf
                     appURLScheme: URLScheme
                   withCompletion:^(NSString *result, PingppError *error) {
                       [self callbackResult: result  error:error];
                   }];
        });
    }
#pragma mark - 开启/关闭 Ping++ Dubug 模式
-(void)setDebugMode:(CDVInvokedUrlCommand *)command{
    bool enabled = [[[command arguments] objectAtIndex:0] boolValue];
    [Pingpp setDebugMode:enabled];
    if (enabled) {
        NSLog(@"开启 Ping++ Dubug Mode");
    }else{
        NSLog(@"关闭 Ping++ Dubug Mode");
    }
    
}
#pragma mark - 获取当前 SDK 版本号
- (void) getVersion:(CDVInvokedUrlCommand*)command{
    self.myCallbackId = command.callbackId;
    NSString *version = [Pingpp version];
    CDVPluginResult* pluginResult = nil;
    pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:version];
    NSLog(@"当前 Ping++ SDK 版本号为: %@",version);
    [self.commandDelegate sendPluginResult:pluginResult callbackId:self.myCallbackId];
}
    
- (void)handleOpenURL:(NSNotification*)notification
    {
        NSURL* url = [notification object];
        NSLog(@"handleOpenURL: %@", [url description]);
        if (![url isKindOfClass:[NSURL class]]) {
            return;
        }
        [Pingpp handleOpenURL:url withCompletion:^(NSString* result, PingppError* error) {
            [self callbackResult:result error:error];
        }];
    }
    
- (void) callbackResult:(NSString*)result error:(PingppError*) error
    {
        CDVPluginResult* pluginResult = nil;
        NSMutableDictionary * responseDic = [NSMutableDictionary dictionary];
        NSLog(@"result:%@",result);
        [responseDic setValue:result forKey:@"result"];
        [responseDic setValue:[error getMsg] forKey:@"error"];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:responseDic];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:self.myCallbackId];
    }
-(NSString *)getURLScheme{
    
    NSArray *urlSchemeList = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleURLTypes"];
    if ([urlSchemeList count] == 0) {
        NSLog(@"URL Scheme 为空，请在 plugin.xml 添加。");
        return nil;
    }
    NSDictionary *urlSchemeType = [urlSchemeList objectAtIndex:0];
    NSArray *schemes = [urlSchemeType objectForKey:@"CFBundleURLSchemes"];
    if ([schemes count] == 0) {
        NSLog(@"URL Scheme 为空，请在 plugin.xml 添加。");
        return nil;
    }
    NSString *scheme = [schemes objectAtIndex:0];
    return scheme;
}
    
    @end
