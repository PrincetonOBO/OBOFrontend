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
@property (strong, nonatomic) NSString *item_id;

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
    self.item_id = self.object.item_id;
    
}
- (IBAction)submitChanges:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Item Updated" message:@"YAY" delegate:self cancelButtonTitle:@"Return" otherButtonTitles:nil];
    [alertView show];
    self.object.name = self.itemNameTextField.text;
    self.object.price = self.itemPriceTextField.text;
    self.object.size = self.itemSizeTextField.text;
    self.object.details = self.itemDescriptionTextField.text;
    
    NSString *user_id = @"5539c7e817aad86cf1000006";
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/users/%@/items/%@", user_id, self.item_id];
    
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    NSString *json = [NSString stringWithFormat:@"{ \"description\": \"%@\", \"price\": \"%@\"}", self.itemDescriptionTextField.text, self.itemPriceTextField.text];
    
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    [restRequest setHTTPBody:jsonData];
    [restRequest setHTTPMethod:@"PUT"];
    [restRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: restRequest returningResponse: &resp error: &err];
    
    NSString * itemResponse = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"Edited item: %@", itemResponse);
    
}

@end
