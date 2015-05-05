#import "OBOItemDetailsTableViewCell.h"
#import "OBOItemObject.h"

@interface OBOItemDetailsTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemSoldLabel;
@property (weak, nonatomic) IBOutlet UIImageView *starImage;


@end
@implementation OBOItemDetailsTableViewCell

- (void)prepareWithItem:(OBOItemObject *)item {
    self.itemNameLabel.text = item.name;
    UIImage *image = [UIImage imageNamed:@"red-dress.jpg"];
    self.itemImageView.image = image;
    // check to see if item is sold and print correct thing
    if (!item.sold) {
        self.itemSoldLabel.text = @"";
    }
    //check to see if user contacted regarding
//    UIImage *starImage = [UIImage imageNamed:@"star.jpg"];
//    self.starImage.image = starImage;
}

@end
