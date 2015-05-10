#import "OBOBuyItemsDetailViewController.h"
#import "OBOItemObject.h"

@interface OBOBuyItemsDetailViewController()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemDescriptionLabel;
@property (weak, nonatomic) IBOutlet NSString *item_id;

@end

@implementation OBOBuyItemsDetailViewController

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
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Submit Offer" message:@"Please enter offer amount in $" preferredStyle:UIAlertControllerStyleAlert];
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
        textField.placeholder = @"placeholder text";
    }];
    
    UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"Submit offer" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *priceField = alertController.textFields.firstObject;
        NSUInteger price = [priceField.text integerValue];
        [self networkStuff:price];
    }];
    [alertController addAction:alertAction];
    [self presentViewController:alertController animated:YES completion:NULL ];
}

- (void)networkStuff:(NSUInteger)price {
    NSLog(@"Offer price: %lu", price);
    
    NSString *user_id = @"5539c7e817aad86cf1000006";
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/items/%@/offer/users/%@", self.item_id, user_id];
    
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    NSString *json = [NSString stringWithFormat:@"{ \"price\": %ul , \"user\": {\"name\": \"Walker Davis\", \"net_id\": \"wcdavis@princeton.edu\", \"pickup_loc\": \"Witherspoon Hall\"} }", price];
    
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

    
}



@end
