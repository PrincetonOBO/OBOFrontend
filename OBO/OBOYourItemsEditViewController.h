#import <UIKit/UIKit.h>

@class OBOItemObject;

@interface OBOYourItemsEditViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) OBOItemObject *object;

@end
