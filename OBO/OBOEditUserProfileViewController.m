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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userNameField.text = @"name here";
    self.userContactInfoField.text = @"netid@princeton.edu";
    // Do any additional setup after loading the view.
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
