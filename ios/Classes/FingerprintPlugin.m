#import "FingerprintPlugin.h"
#import "FPDiOS_ObjC_ach.h"

@implementation FingerprintPlugin



FPDiOSACH *fingerPrint;
NSString *jsonFingerprint = @"";


+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"fingerprint"
            binaryMessenger:[registrar messenger]];
  FingerprintPlugin* instance = [[FingerprintPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if([@"initialize" isEqualToString:call.method]){
      fingerPrint = [[FPDiOSACH alloc] init];
  } else if([@"generate" isEqualToString:call.method]){
      @try {
          jsonFingerprint = [fingerPrint getFPDWithAppAction:@"9vyxHBWPNcCvN7I"];
          result(jsonFingerprint);
      }
      @catch (NSException *exception) {
          NSLog(@"%@", [exception callStackSymbols]);
      }
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
