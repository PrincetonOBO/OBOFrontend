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
    self.userNameLabel.text = @"name here";
    self.userContactInfoLabel.text = @"netid@princeton.edu";
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
