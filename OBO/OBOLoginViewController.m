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

@end

@implementation OBOLoginViewController

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
