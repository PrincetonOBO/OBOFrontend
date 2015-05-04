#import "OBOUserProfile.h"
#import "OBOUserProfileViewController.h"
#import "OBOEditUserProfileViewController.h"

@interface OBOUserProfileViewController ()
@property (strong, nonatomic) OBOUserProfile *profile;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *userContactInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLocationLabel;

@end

@implementation OBOUserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"prof"
                                                         ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];
    self.profile = [[OBOUserProfile alloc] initWithInfo:json];
    NSLog(@"%@",self.profile.name);
    self.userNameLabel.text = self.profile.name;
    self.userContactInfoLabel.text = self.profile.contactInfo;
    self.userLocationLabel.text = self.profile.location;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ToUserProfileEdit"]) {
        OBOEditUserProfileViewController *dest = segue.destinationViewController;
        dest.user = self.profile;
    }
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
