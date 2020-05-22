#import <React/RCTBridgeModule.h>
#import "RCTEventEmitter.h"

@interface RNBestpay : RCTEventEmitter <RCTBridgeModule>

@property NSString* schemeStr;

@end
