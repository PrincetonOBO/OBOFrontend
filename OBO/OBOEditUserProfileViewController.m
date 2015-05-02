//
//  OBOEditUserProfileViewController.m
//  OBO
//
//  Created by Catherine Wu on 4/20/15.
//  Copyright (c) 2015 teamOBO. All rights reserved.
//

#import "OBOEditUserProfileViewController.h"

@interface OBOEditUserProfileViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *userContactInfoField;

@end

@implementation OBOEditUserProfileViewController


- (IBAction)submit:(id)sender {
    NSLog(@"Submit button pressed");
    
    NSLog(@"New name: %@", self.userNameField.text);
    
    // Make RESTful URL
    NSString *user_id = @"5539c7e817aad86cf1000006";
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/manage/users/%@", user_id];
    
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    NSString *json = [NSString stringWithFormat:@"{ \"first_name\": \"%@\", \"last_name\": \"%@\", \"net_id\": \"%@\" }", self.userNameField.text, self.userNameField.text, self.userContactInfoField.text ];
    
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    [restRequest setHTTPBody:jsonData];
    [restRequest setHTTPMethod:@"PUT"];
    [restRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: restRequest returningResponse: &resp error: &err];
    
    NSString * itemResponse = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"response: %@", itemResponse);
    
    
    // Do any additional setup after loading the view.

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userNameField.text = @"Name here";
    self.userContactInfoField.text = @"netid@princeton.edu";
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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
