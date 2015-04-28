#import "OBOUserProfile.h"
#import "OBOUserProfileViewController.h"

@interface OBOUserProfileViewController ()
@property (strong, nonatomic) OBOUserProfile *profile;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userContactInfoLabel;

@end

@implementation OBOUserProfileViewController

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.userNameLabel.text = @"name here";
//    self.userContactInfoLabel.text = @"netid@princeton.edu";
//    // Do any additional setup after loading the view.
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"prof"
                                                         ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];
    NSDictionary *profJSON = [json[@"prof"] objectAtIndex:0];
    self.profile = [[OBOUserProfile alloc] initWithInfo:profJSON];
    self.userNameLabel.text = self.profile.name;
    self.userContactInfoLabel.text = self.profile.contactInfo;
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
