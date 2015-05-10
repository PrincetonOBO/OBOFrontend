#import "OBOItemDetailsTableViewCell.h"
#import "OBOItemObject.h"

@interface OBOItemDetailsTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemTimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *itemSoldImageView;

@end
@implementation OBOItemDetailsTableViewCell

- (void)prepareWithItem:(OBOItemObject *)item {
//    self.itemNameLabel.text = item.name;
    UIImage *image = item.image;
    self.itemNameLabel.text = item.name;
    self.itemPriceLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)item.price];
    self.itemTimeLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)item.time];
    self.itemImageView.image = image;
    UIImage *soldimage = [UIImage imageNamed:@"sold-overlay.png"];
    // check to see if item is sold and print correct thing
    if (item.sold) {
        self.itemSoldImageView.image = soldimage;
    }

    //check to see if user contacted regarding
//    UIImage *starImage = [UIImage imageNamed:@"star.jpg"];
//    self.starImage.image = starImage;
}

@end
