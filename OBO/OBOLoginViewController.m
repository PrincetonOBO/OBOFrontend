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
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *userEmailField;
@property (weak, nonatomic) IBOutlet UITextField *userPasswordField;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userContactInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLocationLabel;


@end

@implementation OBOLoginViewController


// load the login page
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"user.json"];
    NSError *error = nil;
    
    //NSString *writeString = [NSString stringWithFormat:@"{ \"items2\":%@ }", itemResponse];
    //[writeString writeToFile:filePath atomically:YES];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if([fileManager fileExistsAtPath:filePath])
    {
        NSLog(@"User.json exists");
        [self performSegueWithIdentifier:@"toApp" sender:self];
    }

    
    UIImage *backgroundImage = [UIImage imageNamed:@"login.png"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createUser:(id)sender {
    
    NSLog(@"name: %@", self.userNameField.text);
    NSLog(@"email: %@", self.userEmailField.text);
    NSLog(@"location: %@", self.userPasswordField.text);
    
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/manage/users/"];
    
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    NSString *json = [NSString stringWithFormat:@"{ \"name\": \"%@\", \"net_id\": \"%@\", \"pickup_loc\": \"%@\" }", self.userNameField.text, self.userEmailField.text, self.userPasswordField.text ];
    
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    [restRequest setHTTPBody:jsonData];
    [restRequest setHTTPMethod:@"POST"];
    [restRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: restRequest returningResponse: &resp error: &err];
    
    NSString * itemResponse = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"response: %@", itemResponse);

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"user.json"];
    NSError *error = nil;
    
    NSString *writeString = [NSString stringWithFormat:@"{ \"user\":%@ }", itemResponse];
    [writeString writeToFile:filePath atomically:YES];


    
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

@end
