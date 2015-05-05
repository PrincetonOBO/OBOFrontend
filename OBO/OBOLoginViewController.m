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
