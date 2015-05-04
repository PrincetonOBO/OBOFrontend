#import "OBOEditUserProfileViewController.h"
#import "OBOUserProfile.h"

@interface OBOEditUserProfileViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *userContactInfoField;
@property (weak, nonatomic) IBOutlet UITextField *userLocationField;

@end

@implementation OBOEditUserProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userNameField.text = self.user.name;
    self.userContactInfoField.text = self.user.contactInfo;
    self.userLocationField.text = self.user.location;
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
