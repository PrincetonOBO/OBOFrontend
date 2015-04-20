#import "OBOItemDetailsTableViewCell.h"
#import "OBOItemObject.h"

@interface OBOItemDetailsTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;

@end
@implementation OBOItemDetailsTableViewCell

- (void)prepareWithItem:(OBOItemObject *)item {
    self.itemLabel.text = item.name;
    UIImage *image = [UIImage imageNamed:@"red-dress.jpg"];
    self.itemImageView.image = image;
}

@end
