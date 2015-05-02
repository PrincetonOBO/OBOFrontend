//
//  OBOUserProfileViewController.m
//  OBO
//
//  Created by Catherine Wu on 4/20/15.
//  Copyright (c) 2015 teamOBO. All rights reserved.
//

#import "OBOUserProfileViewController.h"

@interface OBOUserProfileViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userContactInfoLabel;

@end

@implementation OBOUserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Profile view did load");
    
    // Make RESTful URL
    NSString *user_id = @"5539c7e817aad86cf1000006";
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/manage/users/%@", user_id];
    
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    
    [restRequest setHTTPMethod:@"GET"];
    [restRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: restRequest returningResponse: &resp error: &err];
    
    NSError *error = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:response options:kNilOptions error:&error];
    
    if (error != nil) {
        NSLog(@"Error parsing JSON.");
    }
    else {
        NSLog(@"Dictionary: %@", jsonDict);
    }

    // Populate with results of GET request
    NSString *first_name = [jsonDict objectForKey:@"first_name"];
    NSString *last_name = [jsonDict objectForKey:@"last_name"];
    self.userNameLabel.text = [NSString stringWithFormat: @"%@ %@", first_name, last_name];
    self.userContactInfoLabel.text = [jsonDict objectForKey:@"net_id"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
