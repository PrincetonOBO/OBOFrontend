#import "OBOItemEditViewController.h"
#import "OBOItemObject.h"

@interface OBOItemEditViewController()

@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemSizeLabel;
@property (weak, nonatomic) IBOutlet UITextField *itemNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *itemPriceTextField;
@property (weak, nonatomic) IBOutlet UITextField *itemSizeTextField;
@property (weak, nonatomic) IBOutlet UITextField *itemDescriptionTextField;


@end

@implementation OBOItemEditViewController
- (IBAction)editItemPrice:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"red-dress.jpg"];
    self.itemImageView.image = image;
    
    self.itemNameTextField.text = self.object.name;
    self.itemPriceTextField.text =[NSString stringWithFormat:@"%lu",(unsigned long)self.object.price];
    self.itemSizeTextField.text = self.object.size;
    self.itemDescriptionTextField.text = self.object.details;
    
}
- (IBAction)submitChanges:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Item Update Successful" message:nil delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
    [alertView show];
    self.object.name = self.itemNameTextField.text;
    self.object.price = self.itemPriceTextField.text;
    self.object.size = self.itemSizeTextField.text;
    self.object.details = self.itemDescriptionTextField.text;
}

@end
