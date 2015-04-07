#import "OBOAccountTableViewCell.h"
#import "OBOYourItemsObject.h"

@interface OBOAccountTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@end
@implementation OBOAccountTableViewCell

- (void)prepareWithItem:(OBOYourItemsObject *)item {
    self.nameLabel.text = item.name;
}

@end
