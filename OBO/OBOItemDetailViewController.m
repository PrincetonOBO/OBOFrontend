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
    UIImage *image = [UIImage imageNamed:@"red-dress.jpg"];
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
                              initWithTitle:@"Seller Contact Information" message:@"[Insert Contact Information here]" delegate:self cancelButtonTitle:@"Return to Item View" otherButtonTitles:nil];
    [alertView show];
    
}


@end
