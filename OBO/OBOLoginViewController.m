//
//  OBOLoginViewController.m
//  Created by PrincetonOBO
//
//  Creates a UIViewController where the user can login with email and password
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

#import "OBOLoginViewController.h"

@interface OBOLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userEmailField;
@property (weak, nonatomic) IBOutlet UITextField *userPasswordField;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userContactInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLocationLabel;


@end

@implementation OBOLoginViewController

/*
- (IBAction)submit:(id)sender {    NSLog(@"Submit button pressed");
    
    //NSLog(@"New name: %@", self.userNameField.text);
    
    // Make RESTful URL
    NSString *user_id = @"5539c7e817aad86cf1000006";
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/manage/users/%@", user_id];
    
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    NSString *json = [NSString stringWithFormat:@"{ \"name\": \"%@\", \"net_id\": \"%@\", \"pickup_loc\": \"%@\" }", self.userNameField.text, self.userContactInfoField.text, self.userLocationField.text ];
    
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    [restRequest setHTTPBody:jsonData];
    [restRequest setHTTPMethod:@"POST"];
    [restRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: restRequest returningResponse: &resp error: &err];
    
    NSString * itemResponse = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"response: %@", itemResponse);
    
    [self.navigationController popViewControllerAnimated:TRUE];
    // Do any additional setup after loading the view.
    
    
}
 */

// load the login page
- (void)viewDidLoad {
    [super viewDidLoad];
    _userPasswordField.secureTextEntry = YES;
    
    UIImage *backgroundImage = [UIImage imageNamed:@"login.png"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// following two methods control making sure the keyboard disappears when typing completes
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
    
}

- (bool)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
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
