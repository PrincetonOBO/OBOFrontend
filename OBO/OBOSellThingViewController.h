#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface OBOSellThingViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate, NSXMLParserDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *itemPicImageView;
@property (strong, nonatomic) UIImage *chosenImage;
@property (strong, nonatomic) UIImagePickerController *imagePicker;


@end
