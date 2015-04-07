#import "OBOAccountTableViewCell.h"
#import "OBOItemObject.h"

@interface OBOAccountTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *editButton;
@property (weak, nonatomic) IBOutlet UIButton *deleteButton;

@end
@implementation OBOAccountTableViewCell

- (void)prepareWithItem:(OBOItemObject *)item {
    self.nameLabel.text = item.name;
}

@end
