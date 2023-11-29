#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@import CoreLocation;
@import CoreTelephony;
@import LocalAuthentication;

//! Project version number for FPDiOS_ObjC.
FOUNDATION_EXPORT double FPDiOS_ObjCVersionNumber;

//! Project version string for FPDiOS_ObjC.
FOUNDATION_EXPORT const unsigned char FPDiOS_ObjCVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <FPDiOS_ObjC/PublicHeader.h>


// In this header, you should import all the public headers of your framework using statements like #import <FPDiOS/PublicHeader.h>

//@interface FPDiOS : UIDevice, CLLocationManagerDelegate
@interface FPDiOSACH : NSObject  <CLLocationManagerDelegate>

@property (nonatomic,strong) CLLocationManager *locationManager;
@property (nonatomic,strong) NSMutableDictionary *vSummary;
@property (nonatomic,strong) NSMutableString *vSumIPAddress;
@property (nonatomic,strong) NSMutableString *vSumOperativeSystem;
@property (nonatomic,strong) NSMutableString *vSumScreenResolution;
@property (nonatomic,strong) NSMutableString *vSumClientTimeStamp;
@property (nonatomic,strong) NSMutableString *vSumDeviceID;
@property (nonatomic,strong) NSMutableDictionary *vSumNavigPluginList;
@property (nonatomic,strong) NSMutableArray *vSumNavigPluginListArr;
//@property (nonatomic,strong) NSMutableString *vSumPhoneNumber;
@property (nonatomic,strong) NSMutableDictionary *vGeoLocation;
@property (nonatomic,strong) NSMutableString *vGeoPostalCode;
@property (nonatomic,strong) NSMutableString *vGeoContinent;
@property (nonatomic,strong) NSMutableString *vGeoCountry;
@property (nonatomic,strong) NSMutableString *vGeoRegion;
@property (nonatomic,strong) NSMutableString *vGeoCity;
@property (nonatomic,strong) NSMutableString *vGeoTimeZone;
@property (nonatomic,strong) NSMutableString *vGeoISP;
@property (nonatomic,strong) NSMutableString *vGeoLatitude;
@property (nonatomic,strong) NSMutableString *vGeoLongitude;
@property (nonatomic,strong) NSMutableDictionary *vJSData;
@property (nonatomic,strong) NSMutableString *vJSDDeviceBrand;
@property (nonatomic,strong) NSMutableString *vJSDDeviceModel;
@property (nonatomic,strong) NSMutableString *vJSDDeviceOS;
@property (nonatomic,strong) NSMutableString *vJSDDeviceOSVersion;
@property (nonatomic,strong) NSMutableString *vJSDAppName;
@property (nonatomic,strong) NSMutableString *vJSDAppVersion;
@property (nonatomic,strong) NSMutableString *vJSDKernel;
@property (nonatomic,strong) NSMutableString *vJSDLanguage;
@property (nonatomic,strong) NSMutableString *vJSDGeolocation;
@property (nonatomic,strong) NSMutableString *vJSDFingerPrint;
@property (nonatomic,strong) NSMutableDictionary *vFPD;
@property (nonatomic,strong) NSMutableString *vFPDID;
@property (nonatomic,strong) NSMutableString *vGeoIP;

-(FPDiOSACH *)init;
-(NSString *)getFPDWithAppAction:(NSString*) appAction;
@end
