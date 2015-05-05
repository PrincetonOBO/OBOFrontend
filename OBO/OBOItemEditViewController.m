#import "OBOItemEditViewController.h"
#import "OBOItemObject.h"

@interface OBOItemEditViewController()
{
    CGFloat originalY;
}

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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"jeans.jpg"];
    self.itemImageView.image = image;
    
    self.itemNameTextField.text = self.object.name;
    self.itemPriceTextField.text =[NSString stringWithFormat:@"%lu",(unsigned long)self.object.price];
    self.itemSizeTextField.text = self.object.size;
    self.itemDescriptionTextField.text = self.object.details;
    self.item_id = self.object.item_id;
    
    self.itemNameTextField.delegate = self;
    self.itemPriceTextField.delegate = self;
    self.itemSizeTextField.delegate = self;
    self.itemDescriptionTextField.delegate = self;
    
    originalY = self.view.frame.origin.y;
}
- (IBAction)submitChanges:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Item Update Successful" message:nil delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
    [alertView show];
    self.object.name = self.itemNameTextField.text;
    self.object.price = self.itemPriceTextField.text;
    self.object.size = self.itemSizeTextField.text;
    self.object.details = self.itemDescriptionTextField.text;
    
    NSString *user_id = @"5539c7e817aad86cf1000006";
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/users/%@/items/%@", user_id, self.item_id];
    
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    NSString *json = [NSString stringWithFormat:@"{ \"title\": \"%@\", \"description\": \"%@\", \"price\": \"%@\"}", self.itemNameTextField, self.itemDescriptionTextField.text, self.itemPriceTextField.text];
    
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


-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //Be informed of keyboard
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardDidHideNotification object:nil];
}

#pragma mark keyboard

- (void)keyboardDidShow:(NSNotification *)notification
{
    //NSDictionary *userInfo = [notification userInfo];
    //CGSize size = [[userInfo objectForKey: UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
    //    CGRect frame = CGRectMake(self.view.frame.origin.x,
    //                              self.view.frame.origin.y  - size.height,
    //                              self.view.frame.size.width,
    //                              self.view.frame.size.height);
    //self.view.frame = frame;
    
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    //    NSDictionary *userInfo = [notification userInfo];
    //    CGSize size = [[userInfo objectForKey: UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    //    self.view.frame = CGRectMake(self.view.frame.origin.x,
    //                                 self.view.frame.origin.y - size.height,
    //                                 self.view.frame.size.width,
    //                                 self.view.frame.size.height);
    //
    //    NSLog(@"%f", size.height);
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    CGRect frameRect = textField.frame;
    NSLog(@"%f", self.view.frame.origin.y);
    if (frameRect.origin.y > self.view.frame.size.height/2) {
        CGRect frame = CGRectMake(self.view.frame.origin.x,
                                  -frameRect.origin.y/2.0,
                                  self.view.frame.size.width,
                                  self.view.frame.size.height);
        self.view.frame = frame;
    }
    NSLog(@"%f", frameRect.origin.y);
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    CGRect frame = CGRectMake(self.view.frame.origin.x,
                              originalY,
                              self.view.frame.size.width,
                              self.view.frame.size.height);
    self.view.frame = frame;
    NSLog(@"ugh hi");
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //NSLog(@"ugh hi");
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (bool)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"ugh hi");
    [self.view endEditing:YES];
    return YES;
}

@end


