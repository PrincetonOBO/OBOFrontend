#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface OBOSellItemsViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *itemPicImageView;
@property (strong, nonatomic) UIImage *chosenImage;
@property (strong, nonatomic) UIImagePickerController *imagePicker;


@end
