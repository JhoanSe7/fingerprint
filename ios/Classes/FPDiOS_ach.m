#import <Foundation/Foundation.h>
#import "FPDiOS_ObjC_ach.h"
#include <CommonCrypto/CommonDigest.h>
#import <ifaddrs.h>
#import <arpa/inet.h>
#import <net/if.h>
#import <netdb.h>
#import <sys/utsname.h>
#import <sys/sysctl.h>
#import <CoreLocation/CoreLocation.h>
#import <CFNetwork/CFNetwork.h>
#import <CoreNFC/CoreNFC.h>

@implementation FPDiOSACH

@synthesize locationManager = _locationManager;
@synthesize vSummary = _vSummary;
@synthesize vSumIPAddress = _vSumIPAddress;
@synthesize vSumOperativeSystem = _vSumOperativeSystem;
@synthesize vSumScreenResolution  = _vSumScreenResolution;
@synthesize vSumClientTimeStamp =_vSumClientTimeStamp;
@synthesize vSumDeviceID = _vSumDeviceID;
@synthesize vSumNavigPluginList = _vSumNavigPluginList;
@synthesize vSumNavigPluginListArr = _vSumNavigPluginListArr;
@synthesize vGeoLocation = _vGeoLocation;
@synthesize vGeoPostalCode = _vGeoPostalCode;
@synthesize vGeoContinent = _vGeoContinent;
@synthesize vGeoCountry = _vGeoCountry;
@synthesize vGeoRegion = _vGeoRegion;
@synthesize vGeoCity = _vGeoCity;
@synthesize vGeoTimeZone = _vGeoTimeZone;
@synthesize vGeoISP = _vGeoISP;
@synthesize vGeoLatitude = _vGeoLatitude;
@synthesize vGeoLongitude = _vGeoLongitude;
@synthesize vJSData = _vJSData;
@synthesize vJSDDeviceBrand = _vJSDDeviceBrand;
@synthesize vJSDDeviceModel = _vJSDDeviceModel;
@synthesize vJSDDeviceOS = _vJSDDeviceOS;
@synthesize vJSDDeviceOSVersion = _vJSDDeviceOSVersion;
@synthesize vJSDAppName = _vJSDAppName;
@synthesize vJSDAppVersion = _vJSDAppVersion;
@synthesize vJSDKernel = _vJSDKernel;
@synthesize vJSDLanguage = _vJSDLanguage;
@synthesize vJSDGeolocation = _vJSDGeolocation;
@synthesize vJSDFingerPrint = _vJSDFingerPrint;
@synthesize vFPD = _vFPD;
@synthesize vFPDID = _vFPDID;

- (FPDiOSACH *)init {
    self = [super init];
    if (self) {
        
        NSString *tokenValue = @"9vyxHBWPNcCvN7I";
        NSString *myURLString = [NSString stringWithFormat:@"https://pro.ip-api.com/json/?key=%@", tokenValue];

        NSMutableURLRequest *urlRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:myURLString]];
        [urlRequest setHTTPMethod:@"GET"];
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            NSString *strResponse = [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
            
            NSData *data1 = [strResponse dataUsingEncoding:NSUTF8StringEncoding];
            id json = [NSJSONSerialization JSONObjectWithData:data1 options:0 error:nil];
            
            _vGeoCity = [json objectForKey:@"city"];
            _vGeoCountry = [json objectForKey:@"country"];
            _vSumIPAddress = [json objectForKey:@"query"];
            
            CTTelephonyNetworkInfo *netinfo = [[CTTelephonyNetworkInfo alloc] init];
            CTCarrier *carrier = [netinfo subscriberCellularProvider];
            
            _vGeoISP = [NSMutableString stringWithString: carrier.carrierName ? carrier.carrierName : @""];
        }];
        
        [dataTask resume];
    }
    return self;
}

-(NSString *)strTrimmer:(NSString*)input
{
    NSMutableString *returnResult = [[NSMutableString alloc] initWithString:@""];
    if (input == nil)
    {
        returnResult = [[NSMutableString alloc] initWithString:@"nil"];
    }
    else
    {
        returnResult = [[NSMutableString alloc] initWithString:input];
    }
    return returnResult;
}


-(NSString *)getFPDWithAppAction:(NSString*)appAction
{
    NSString *strName =  [[UIDevice currentDevice] name];
    NSString *returnResult;

    _vSumOperativeSystem  = [[NSMutableString alloc] initWithString:[self strTrimmer:[self getSumOperativeSystem]]];
    _vSumScreenResolution  = [[NSMutableString alloc] initWithString:[self strTrimmer:[self getSumScreenResolution]]];
    _vSumClientTimeStamp  = [[NSMutableString alloc] initWithString:[self strTrimmer:[self getSumClientTimeStamp]]];
    _vSumDeviceID  = [[NSMutableString alloc] initWithString:[self strTrimmer:[self getSumDeviceID]]];
    
    _vJSDDeviceBrand  = [[NSMutableString alloc] initWithString:[self strTrimmer:[self getJSDDeviceBrand]]];
    _vJSDDeviceModel  = [[NSMutableString alloc] initWithString:[self strTrimmer:[self getJSDDeviceModel]]];
    _vJSDDeviceOS  = [[NSMutableString alloc] initWithString:[self strTrimmer:[self getJSDDeviceOS]]];
    _vJSDDeviceOSVersion  = [[NSMutableString alloc] initWithString:[self strTrimmer:[self getJSDDeviceOSVersion]]];
    _vJSDAppName  = [[NSMutableString alloc] initWithString:[self strTrimmer:[self getJSDAppName]]];
    _vJSDAppVersion  = [[NSMutableString alloc] initWithString:[self strTrimmer:[self getJSDAppVersion]]];
    _vJSDKernel  = [[NSMutableString alloc] initWithString:[self strTrimmer:[self getJSDKernel]]];
    _vJSDLanguage  = [[NSMutableString alloc] initWithString:[self strTrimmer:[self getJSDLanguage]]];
    _vJSDGeolocation  = [[NSMutableString alloc] initWithString:[self strTrimmer:@"true"]];
    _vJSDFingerPrint  = [[NSMutableString alloc] initWithString:[self strTrimmer:[self getJSDFingerPrint]]];
    
    _vSummary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                 _vSumDeviceID, @"deviceId",
                 strName,@"hostname",
                 @"No Disponible",@"macAddress",
                 @"No Disponible",@"passiveId",
                 nil];
    
    _vGeoLocation = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                     _vGeoCountry, @"country",
                     _vGeoCity, @"city",
                     _vGeoISP, @"isp",
                     _vSumIPAddress, @"ip"
                     , nil];
    
    NSString *allforFPDID = [NSString stringWithFormat:@" %@%@%@%@%@%@%@%@%@",
                             _vJSDDeviceModel,
                             _vSumDeviceID,
                             _vGeoISP,
                             _vJSDDeviceBrand,
                             _vJSDDeviceOS,
                             _vJSDAppName,
                             _vJSDKernel,
                             _vJSDLanguage,
                             _vJSDFingerPrint
                             ];
    
    _vFPDID = [self sha256HashFor:allforFPDID];
    
    _vFPD = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
             _vFPDID,@"id"
             , nil];
    
    NSDictionary *allVarDictionary = [[NSDictionary alloc] initWithObjectsAndKeys:
                                      _vSummary,@"General",
                                      _vGeoLocation, @"Geolocation",
                                      _vFPD,@"Hash"
                                      , nil];
    
    NSData *jsonReturn = [NSJSONSerialization dataWithJSONObject:allVarDictionary options:NSJSONWritingPrettyPrinted error:nil];

    returnResult = [[NSString alloc] initWithData:jsonReturn encoding:NSUTF8StringEncoding];
    return returnResult;
}

-(NSMutableString*)sha256HashFor:(NSString*)input
{
    const char* str = [input UTF8String];
    unsigned char result[CC_SHA256_DIGEST_LENGTH];
    CC_SHA256(str, (CC_LONG)strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_SHA256_DIGEST_LENGTH; i++)
    {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}

-(NSString *)getSumOperativeSystem
{
    NSMutableString *returnResult = [NSMutableString stringWithString:[[UIDevice currentDevice] systemName]];
    return returnResult;
}

-(NSString *)getSumScreenResolution
{
    NSMutableString *returnResult;
    NSString *width = [NSString stringWithFormat:@"%.0f",[UIScreen mainScreen].bounds.size.width];
    NSString *height = [NSString stringWithFormat:@"%.0f",[UIScreen mainScreen].bounds.size.height];
    returnResult = [NSMutableString stringWithFormat:@"%@x%@",width,height];
    return returnResult;
}

-(NSString *)getSumClientTimeStamp
{
    NSString *returnResult;
    NSDate *date = [[NSDate alloc] init];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    returnResult = [NSString stringWithString:[formatter stringFromDate:date]];
    return returnResult;
}


-(NSString *)getSumDeviceID
{
    NSString *returnResult = [NSString stringWithString:[[[UIDevice currentDevice] identifierForVendor] UUIDString]];
    return returnResult;
}

-(NSString *)getJSDDeviceBrand
{
    NSString *returnResult = @"Apple Inc.";
    return returnResult;
}

-(NSString *)getJSDDeviceModel
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *code = [NSString stringWithUTF8String:systemInfo.machine];
    static NSDictionary *deviceNamesByCode;
    if (!deviceNamesByCode) {
        deviceNamesByCode = @{@"i386"      :@"Simulator",
                              @"iPod1,1"   :@"iPod Touch",
                              @"iPod2,1"   :@"iPod Touch",
                              @"iPod3,1"   :@"iPod Touch",
                              @"iPod4,1"   :@"iPod Touch",
                              @"iPhone1,1" :@"iPhone",
                              @"iPhone1,2" :@"iPhone",
                              @"iPhone2,1" :@"iPhone",
                              @"iPad1,1"   :@"iPad",
                              @"iPad2,1"   :@"iPad 2",
                              @"iPad3,1"   :@"iPad",
                              @"iPhone3,1" :@"iPhone 4",
                              @"iPhone3,3" :@"iPhone 4",
                              @"iPhone4,1" :@"iPhone 4S",
                              @"iPhone5,1" :@"iPhone 5",
                              @"iPhone5,2" :@"iPhone 5",
                              @"iPad3,4"   :@"iPad",
                              @"iPad2,5"   :@"iPad Mini",
                              @"iPhone5,3" :@"iPhone 5c",
                              @"iPhone5,4" :@"iPhone 5c",
                              @"iPhone6,1" :@"iPhone 5s",
                              @"iPhone6,2" :@"iPhone 5s",
                              @"iPhone7,1" :@"iPhone 6 Plus",
                              @"iPhone7,2" :@"iPhone 6",
                              @"iPad4,1"   :@"iPad Air",
                              @"iPad4,2"   :@"iPad Air",
                              @"iPad4,4"   :@"iPad Mini",
                              @"iPad4,5"   :@"iPad Mini"
                              };
    }
    
    NSString* deviceName = [deviceNamesByCode objectForKey:code];
    if (deviceName != nil && deviceName != nil) {
        if (!deviceName) {
            if ([code rangeOfString:@"iPod"].location != NSNotFound) {
                deviceName = @"iPod Touch";
            }
            else if([code rangeOfString:@"iPad"].location != NSNotFound) {
                deviceName = @"iPad";
            }
            else if([code rangeOfString:@"iPhone"].location != NSNotFound){
                deviceName = @"iPhone";
            }
        }
    } else {
        deviceName = @"null";
    }
    
    return deviceName;
    
}

-(NSString *)getJSDDeviceOS
{
    NSString *returnResult = [[NSString alloc] initWithString:[[UIDevice currentDevice] systemName]];
    return returnResult;
}

-(NSString *)getJSDDeviceOSVersion
{
    NSString *returnResult = [NSString stringWithString:[[UIDevice currentDevice] systemVersion]];
    return returnResult;
}

-(NSString *)getJSDAppName
{
    NSString *returnResult = [[[NSBundle mainBundle] infoDictionary] objectForKey:(id)kCFBundleExecutableKey];
    return returnResult;
}

-(NSString *)getJSDAppVersion
{
    NSString *returnResult =  [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return returnResult;
}

-(NSString *)getJSDKernel
{
    NSString *returnResult;
    int mib[2] = {CTL_KERN, KERN_OSVERSION};
    u_int namelen = sizeof(mib) / sizeof(mib[0]);
    size_t bufferSize = 0;
    
    sysctl(mib, namelen, NULL, &bufferSize, NULL, 0);
    
    u_char buildBuffer[bufferSize];
    int result = sysctl(mib, namelen, buildBuffer, &bufferSize, NULL, 0);
    
    if (result >= 0) {
        returnResult = [[NSString alloc] initWithBytes:buildBuffer length:bufferSize encoding:NSUTF8StringEncoding];
    }
    
    return returnResult;
}

-(NSString *)getJSDLanguage
{
    NSString *returnResult = [[NSLocale preferredLanguages] objectAtIndex:0];
    return returnResult;
}

-(NSString *)getJSDFingerPrint
{
    NSString *returnResult = @"";
    LAContext *context = [[LAContext alloc] init];
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:nil])
    {
        
        returnResult = @"true";
    }
    else
    {
        returnResult = @"false";
    }
    return returnResult;
}

@end
