#import <UIKit/UIKit.h>

@class OBOItemObject;

@interface OBOItemEditViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) OBOItemObject *object;

@end
