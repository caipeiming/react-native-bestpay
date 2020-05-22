
#import "RNBestpay.h"
#import "BestpaySDK.h"
#import "BestpayNativeModel.h"

@implementation RNBestpay

RCT_EXPORT_MODULE(RNBestpay)

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleOpenURL:) name:@"RCTOpenURLNotification" object:nil];
    }
    self.schemeStr = nil;
    NSArray *urlTypes = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleURLTypes"];
    if (urlTypes != nil && urlTypes.count > 0) {
        NSArray *urlSchemes = [urlTypes.firstObject objectForKey:@"CFBundleURLSchemes"];
        if(urlSchemes.count > 0) {
            self.schemeStr = [urlSchemes firstObject];
        }
    }
    return self;
}

+ (BOOL)requiresMainQueueSetup{
  return YES;
}

- (NSArray<NSString *> *)supportedEvents
{
    return @[@"BestPay_Response"];
}

- (BOOL)handleOpenURL:(NSNotification *)aNotification
{
    NSString * aURLString =  [aNotification userInfo][@"url"];
    NSURL * aURL = [NSURL URLWithString:aURLString];
    [BestpaySDK processOrderWithPaymentResult:aURL standbyCallback:^(NSDictionary *resultDic){
        NSMutableDictionary *body = [[NSMutableDictionary alloc]init];
        [body setValue:resultDic forKey:@"result"];
        [self sendEventWithName:@"BestPay_Response" body:body];
    }];
    return YES;
}

RCT_EXPORT_METHOD(pay:(NSString*)orderStr :(NSString*)keyboardLicense)
{
    //当获得的tn不为空时，调用支付接口
    if (orderStr != nil && orderStr.length > 0){
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            UIViewController *rootViewController = window.rootViewController;
            BestpayNativeModel *order = [[BestpayNativeModel alloc] init];
            order.orderInfo = orderStr;
            order.keyboardLicense = keyboardLicense;
            order.scheme = self.schemeStr;
            [BestpaySDK payWithOrder:order fromViewController:rootViewController callback:^(NSDictionary *resultDic){
                NSLog(@"result == %@", resultDic);
            }];
        });
    }
}

@end
