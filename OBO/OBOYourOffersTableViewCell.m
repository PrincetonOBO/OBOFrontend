//
//  OBOYourOffersTableViewCell.m
//  Created by Princeton OBO
//
//  A UITableViewCell that holds an offer that the user made. Displays item name and offer amount. 
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//


#import "OBOYourItemOfferObject.h"
#import "OBOYourOffersTableViewCell.h"

@interface OBOYourOffersTableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) NSString *item_id;

@end

@implementation OBOYourOffersTableViewCell

// prepare the cells of the table view with offers
- (void)prepareWithItem4:(OBOYourItemOfferObject *)offer {
    self.nameLabel.text = offer.name;
    self.priceLabel.text = offer.price;
    self.item_id = offer.item_id;
}

- (void)awakeFromNib {
    // Initialization code
}

// delete an offer from the database
- (IBAction)deleteOffer:(id)sender {
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Offer Deleted" message:@"Your item has been successfully deleted. Please refresh to see the changes." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
    [alertView show];
    
    // Make RESTful URL
    //NSString *user_id = @"5539c7e817aad86cf1000006";
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"user.json"];
    
    NSData *user_data = [[NSFileManager defaultManager] contentsAtPath:filePath];
    NSDictionary *user_dict = [NSJSONSerialization JSONObjectWithData:user_data options: NSJSONReadingMutableLeaves error:nil];
    NSString *user_id = user_dict[@"user"][@"id"];

    NSString *item_id = self.item_id;
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/items/%@/offer/users/%@", item_id, user_id];
    
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    
    [restRequest setHTTPMethod:@"DELETE"];
    [restRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: restRequest returningResponse: &resp error: &err];
    
    NSString * itemResponse = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"response: %@", itemResponse);
    
    
    /* Write new item set to file */
    restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/manage/users/%@/offers", user_id];
    
    restURL = [NSURL URLWithString:restCallString];
    restRequest = [NSMutableURLRequest requestWithURL:restURL];
    
    [restRequest setHTTPMethod:@"GET"];
    [restRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    resp = nil;
    err = nil;
    
    response = [NSURLConnection sendSynchronousRequest: restRequest returningResponse: &resp error: &err];
    itemResponse = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:@"offers.json"]];
    NSLog(@"path: %@", databasePath);
    NSString *writeString = [NSString stringWithFormat:@"{ \"offers\":%@ }", itemResponse];
    NSLog(@"%@", writeString);
    [writeString writeToFile:databasePath atomically:YES];
    
    NSLog(@"Wrote file");
    
    //NSLog(@"response: %@", itemResponse);
    paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    documentsDirectory = [paths objectAtIndex:0];
    
    filePath = [documentsDirectory stringByAppendingPathComponent:@"offers.json"];
    NSString *fileContent = [[NSString alloc] initWithContentsOfFile:filePath];
    
    //NSLog(@"Print from file: %@", fileContent);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
