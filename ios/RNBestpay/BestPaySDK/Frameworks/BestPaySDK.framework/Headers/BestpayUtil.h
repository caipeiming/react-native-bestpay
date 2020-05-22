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
/**
 @brief 回调结果block
 
 @param resultDic 结果数组，参考接入文档
 */
typedef void(^CompletionBlock)(NSDictionary *resultDic);


@interface BestpayUtil : NSObject

/// 拉起翼支付收银台
/// @param order 支付订单 (支持字典  或者 key=value&key=value字符串)
/// @param merchantScheme 商户APPscheme,以供回调
/// @param hostvc 源控制器,用于拉起H5收银台
/// @param keyboardLicense 键盘授权证书
/// @param completionBlock 完成回调
+ (void)payWithOrderInfo:(id)order
          merchantScheme:(NSString *)merchantScheme
      fromViewController:(UIViewController *)hostvc
         keyboardLicense:(NSString *)keyboardLicense
                callback:(CompletionBlock)completionBlock;

/**
 @brief 回调处理
 
 @param resultUrl 回调URL
 @param completionBlock 回调结果block
 */
+(void)processOrderWithPaymentResult:(NSURL *)resultUrl
                     standbyCallback:(CompletionBlock)completionBlock;

//获取当前SDK版本号
+ (NSString *)getSdkVersion;

@end
