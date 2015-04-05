#import <UIKit/UIKit.h>

@interface OBOSellThingViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *itemPicImageView;
@property (strong, nonatomic) UIImage *chosenImage;
@property (strong, nonatomic) UIImagePickerController *imagePicker;

@end
