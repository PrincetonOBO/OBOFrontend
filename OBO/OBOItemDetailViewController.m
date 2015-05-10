#import "OBOItemDetailViewController.h"
#import "OBOItemObject.h"

@interface OBOItemDetailViewController()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemDescriptionLabel;
@property (weak, nonatomic) IBOutlet NSString *item_id;

@end

@implementation OBOItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = self.object.image;
    self.itemImageView.image = image;
    self.itemNameLabel.text = self.object.name;
    self.itemPriceLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.object.price];
    self.itemSizeLabel.text = self.object.size;
    //self.itemLocationLabel.text = self.object.location;
    self.itemDescriptionLabel.text = self.object.details;
    self.item_id = self.object.item_id;
    
}
- (IBAction)getContactInfo:(id)sender {
//    UIAlertView *alertView = [[UIAlertView alloc]
//                              initWithTitle:@"Delete" message:@"Are you sure you want to contact this seller? The seller will be notified" delegate:self cancelButtonTitle:@"No, I am not interested" otherButtonTitles:@"Yes, I am interested", nil];
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Submit Offer" message:@"Please enter offer amount in USD" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Submit", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [alertView show];
    
    UITextField * alertTextField = [alertView textFieldAtIndex:0];
    NSLog(@"Entered: %@",[alertTextField text]);
    
    NSString *user_id = @"5539c7e817aad86cf1000006";
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/items/%@/offer/users/%@", self.item_id, user_id];
    
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    NSString *json = [NSString stringWithFormat:@"{ \"price\": 10 , \"user\": {\"name\": \"Walker Davis\", \"net_id\": \"wcdavis@princeton.edu\", \"pickup_loc\": \"Witherspoon Hall\"} }", [alertTextField text]];
    
    NSLog(@"offer json: %@", json);
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    [restRequest setHTTPBody:jsonData];
    [restRequest setHTTPMethod:@"POST"];
    [restRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];

    
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: restRequest returningResponse: &resp error: &err];
    
    NSString * itemResponse = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"Made offer:%@", itemResponse);

    
    //[alertView release];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"Entered: %@",[[alertView textFieldAtIndex:0] text]);
}


@end
