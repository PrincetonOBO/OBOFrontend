//
//  OBOHomeScreenViewController.m
//  OBO
//
//  Created by Catherine Wu on 5/4/15.
//  Copyright (c) 2015 teamOBO. All rights reserved.
//

#import "OBOHomeScreenViewController.h"

@interface OBOHomeScreenViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end

@implementation OBOHomeScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        UIImage *backgroundImage = [UIImage imageNamed:@"OBOhomescreen4.png"];
    UIImageView *backgroundImageView=[[UIImageView alloc]initWithFrame:self.view.frame];
    backgroundImageView.image=backgroundImage;
    [self.view insertSubview:backgroundImageView atIndex:0];
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
