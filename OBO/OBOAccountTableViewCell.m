#import "OBOAccountTableViewCell.h"
#import "OBOItemObject.h"

@interface OBOAccountTableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) NSString *item_id;


@end
@implementation OBOAccountTableViewCell

- (void)prepareWithItem2:(OBOItemObject *)item {
    self.nameLabel.text = item.name;
    self.item_id = item.item_id;
}

- (IBAction)showDeleteAlert:(id)sender {

    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Delete" message:@"Are you sure you want to delete this item? This action cannot be undone" delegate:self cancelButtonTitle:@"No, keep this item" otherButtonTitles:@"Yes, delete this item", nil];
    [alertView show];
    
    // Make RESTful URL
    NSString *user_id = @"5539c7e817aad86cf1000006";
    NSString *item_id = self.item_id;
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/users/%@/items/%@", user_id, item_id];
    
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
    restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/users/%@/items", user_id];
    
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
    NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:@"items3.json"]];
    NSLog(@"path: %@", databasePath);
    NSString *writeString = [NSString stringWithFormat:@"{ \"items2\":%@ }", itemResponse];
    NSLog(@"%@", writeString);
    [writeString writeToFile:databasePath atomically:YES];

    NSLog(@"Wrote file");

    //NSLog(@"response: %@", itemResponse);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"items3.json"];
    NSString *fileContent = [[NSString alloc] initWithContentsOfFile:filePath];
    
    //NSLog(@"Print from file: %@", fileContent);


    
    
    

    
}


@end
