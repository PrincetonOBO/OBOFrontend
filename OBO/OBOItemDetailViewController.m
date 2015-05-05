#import "OBOItemDetailViewController.h"
#import "OBOItemObject.h"

@interface OBOItemDetailViewController()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemDescriptionLabel;

@end

@implementation OBOItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = self.object.image;
    self.itemImageView.image = image;
    self.itemNameLabel.text = self.object.name;
    self.itemPriceLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.object.price];
    self.itemSizeLabel.text = self.object.size;
    self.itemLocationLabel.text = self.object.size;
    self.itemDescriptionLabel.text = self.object.details;
    
}
- (IBAction)getContactInfo:(id)sender {
//    UIAlertView *alertView = [[UIAlertView alloc]
//                              initWithTitle:@"Delete" message:@"Are you sure you want to contact this seller? The seller will be notified" delegate:self cancelButtonTitle:@"No, I am not interested" otherButtonTitles:@"Yes, I am interested", nil];
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Submit Offer" message:@"Please enter offer amount in USD" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Submit", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertView show];
    
    //UITextField * alertTextField = [alertView textFieldAtIndex:0];
    //NSLog(@"Entered: %@",[alertTextField text]);
    //[alertView release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);
}


@end
