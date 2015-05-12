//
//  OBOBuyItemsDetailViewController.m
//  Created by PrincetonOBO
//
//  Creates a UIView where the details of the selected item are displayed. This includes a bigger image, the item name, price, size, and description. It also allows the user to make an offer on the item. 
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

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

// Display details of the item user is interested in
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

// make an offer on the item
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

// send the offer information to the backend
- (void)networkStuff:(NSUInteger)price {
    NSLog(@"Offer price: %lu", price);
    
    //NSString *user_id = @"5539c7e817aad86cf1000006";
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"user.json"];
    
    NSData *user_data = [[NSFileManager defaultManager] contentsAtPath:filePath];
    NSDictionary *user_dict = [NSJSONSerialization JSONObjectWithData:user_data options: NSJSONReadingMutableLeaves error:nil];
    NSString *user_id = user_dict[@"user"][@"id"];
    NSString *user_name = user_dict[@"user"][@"name"];
    NSString *user_netid = user_dict[@"user"][@"net_id"];
    NSString *user_pickup = user_dict[@"user"][@"pickup_loc"];


    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/items/%@/offer/users/%@", self.item_id, user_id];
    
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    NSString *json = [NSString stringWithFormat:@"{ \"price\": %lu , \"user\": {\"name\": \"%@\", \"net_id\": \"%@\", \"pickup_loc\": \"Witherspoon Hall\"} }", (unsigned long)price, user_name, user_netid, user_pickup];
    
    NSLog(@"offer json: %@", json);
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    [restRequest setHTTPBody:jsonData];
    [restRequest setHTTPMethod:@"POST"];
    [restRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];

    
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: restRequest returningResponse: &resp error: &err];
    
    NSString * itemResponse = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    if ([itemResponse  isEqual: @"You've already made an offer."]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Offer Not Made"
                                                        message:@"Sorry, you have already made an offer on this item."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
    NSLog(@"Made offer:%@", itemResponse);

    
}



@end
