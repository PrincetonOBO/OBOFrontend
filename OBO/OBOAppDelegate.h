#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface OBOAppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) double longitude;
@property (nonatomic) double latitude;


@end
