
#import "RNBestpay.h"
#import <BestPaySDK/BestpayUtil.h>

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
    [BestpayUtil processOrderWithPaymentResult:aURL standbyCallback:^(NSDictionary *resultDic) {
        //回调结果可在这边处理,也可在调起支付方法处理
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
            [BestpayUtil payWithOrderInfo:orderStr
                           merchantScheme:self.schemeStr
                       fromViewController:rootViewController
                          keyboardLicense:keyboardLicense
                                 callback:^(NSDictionary *resultDic) {
                //结果回调
                NSLog(@"result == %@", resultDic);
            }];
        });
    }
}

@end
