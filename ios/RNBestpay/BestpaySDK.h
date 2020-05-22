//
//  BestpaySDK.h
//  H5ContainerFramework
//
//  Created by jackzhou on 08/03/15.
//  Copyright (c) 2015 tydic. All rights reserved.
//
/**
 翼支付商户SDK API
 */


#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "BestpayNativeModel.h"

#ifdef __OPTIMIZE__
#define BPDebugLog(...)
#else
#define BPDebugLog(fmt, ...) {NSLog((@"" fmt), ##__VA_ARGS__);}  //debug
#endif

#define SDKVersion @"4.0.0"


/**
 @brief 回调结果block
 
 @param resultDic 结果数组，参考接入文档
 */
typedef void(^CompletionBlock)(NSDictionary *resultDic);


@interface BestpaySDK : NSObject


/**
 @brief 拉起翼支付收银台调用（支付订单调用H5接口方法）
 
 @param order 支付订单所需的数据模型
 @param hostvc 源ViewController，用于加载H5收银台
 @param completionBlock 回调结果block
 */
+(void)payWithOrder:(BestpayNativeModel *)order fromViewController:(UIViewController *)hostvc callback:(CompletionBlock)completionBlock;


/**
 @brief 回调处理
 
 @param resultUrl 回调URL
 @param completionBlock 回调结果block
 */
+(void)processOrderWithPaymentResult:(NSURL *)resultUrl
                     standbyCallback:(CompletionBlock)completionBlock;

@end
