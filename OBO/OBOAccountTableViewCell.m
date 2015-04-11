#import "OBOAccountTableViewCell.h"
#import "OBOItemObject.h"

@interface OBOAccountTableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
@implementation OBOAccountTableViewCell

- (void)prepareWithItem2:(OBOItemObject *)item {
    self.nameLabel.text = @"this";//item.name;
    NSLog(@"yay");
}
- (IBAction)showDeleteAlert:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Delete" message:@"Are you sure you want to delete this item? This action cannot be undone" delegate:self cancelButtonTitle:@"No, keep this item" otherButtonTitles:@"Yes, delete this item", nil];
    [alertView show];
}


@end
