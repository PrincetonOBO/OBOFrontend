//
//  OBOUserProfileViewController.m
//  Created by PrincetonOBO
//
//  Creates a UIView where the user's profile is displayed. This includes name, contact information, and pickup location. 
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

#import "OBOUserProfile.h"
#import "OBOUserProfileViewController.h"
#import "OBOUserProfileEditViewController.h"

@interface OBOUserProfileViewController ()
@property (strong, nonatomic) OBOUserProfile *profile;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userContactInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLocationLabel;

@end

@implementation OBOUserProfileViewController


// load the user profile
- (void)viewDidLoad {
    [super viewDidLoad];
//<<<<<<< HEAD
//    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"prof"
//                                                         ofType:@"json"];
//    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
//    NSError *error = nil;
//    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
//                                                         options:kNilOptions
//                                                           error:&error];
//    self.profile = [[OBOUserProfile alloc] initWithInfo:json];
//    NSLog(@"%@",self.profile.name);
//    self.userNameLabel.text = self.profile.name;
//    self.userContactInfoLabel.text = self.profile.contactInfo;
//    self.userLocationLabel.text = self.profile.location;
//=======
    NSLog(@"Profile view did load");
    
    // Make RESTful URL
    //NSString *user_id = @"5539c7e817aad86cf1000006";
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"user.json"];
    
    NSData *user_data = [[NSFileManager defaultManager] contentsAtPath:filePath];
    NSDictionary *user_dict = [NSJSONSerialization JSONObjectWithData:user_data options: NSJSONReadingMutableLeaves error:nil];
    NSLog(@"user data: %@", user_dict);
    NSString *user_id = user_dict[@"user"][@"id"];
    NSLog(@"user id: %@", user_id);

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
        self.profile = [[OBOUserProfile alloc] initWithInfo:jsonDict];
        NSLog(@"Dictionary: %@", jsonDict);
    }

    // Populate with results of GET request
    //self.profile = [[OBOUserProfile alloc] initWithInfo:json];
    self.userNameLabel.text = [jsonDict objectForKey:@"name"];
    self.userContactInfoLabel.text = [jsonDict objectForKey:@"net_id"];
    self.userLocationLabel.text = [jsonDict objectForKey:@"pickup_loc"];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    
    NSLog(@"view will appear");
    // Make RESTful URL
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"user.json"];
    
    NSData *user_data = [[NSFileManager defaultManager] contentsAtPath:filePath];
    NSDictionary *user_dict = [NSJSONSerialization JSONObjectWithData:user_data options: NSJSONReadingMutableLeaves error:nil];
    NSString *user_id = user_dict[@"user"][@"id"];
    NSLog(@"user id: %@", user_id);

    //NSString *user_id = @"5539c7e817aad86cf1000006";
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
        self.profile = [[OBOUserProfile alloc] initWithInfo:jsonDict];
        NSLog(@"Dictionary: %@", jsonDict);
    }
    
    // Populate with results of GET request
    //self.profile = [[OBOUserProfile alloc] initWithInfo:json];
    self.userNameLabel.text = [jsonDict objectForKey:@"name"];
    self.userContactInfoLabel.text = [jsonDict objectForKey:@"net_id"];
    self.userLocationLabel.text = [jsonDict objectForKey:@"pickup_loc"];
    // Do any additional setup after loading the view.

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// bring user to a new page that allows user to edit user's profile
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ToUserProfileEdit"]) {
        OBOUserProfileEditViewController *dest = segue.destinationViewController;
        dest.user = self.profile;
    }
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
