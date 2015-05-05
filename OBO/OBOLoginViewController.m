//
//  OBOLoginViewController.m
//  OBO
//
//  Created by Christine Li on 5/4/15.
//  Copyright (c) 2015 teamOBO. All rights reserved.
//

#import "OBOLoginViewController.h"

@interface OBOLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userEmailField;
@property (weak, nonatomic) IBOutlet UITextField *userPasswordField;

@end

@implementation OBOLoginViewController

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
