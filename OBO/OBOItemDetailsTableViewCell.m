#import "OBOItemDetailsTableViewCell.h"
#import "OBOItemObject.h"

@interface OBOItemDetailsTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemSoldLabel;
@property (weak, nonatomic) IBOutlet UIImageView *starImage;


@end
@implementation OBOItemDetailsTableViewCell

- (void)prepareWithItem:(OBOItemObject *)item {
    self.itemLabel.text = item.name;
    UIImage *image = [UIImage imageNamed:@"red-dress.jpg"];
    self.itemImageView.image = image;
    // check to see if item is sold and print correct thing
    self.itemSoldLabel.text = @"sold x min ago";
    
    //check to see if user contacted regarding
    UIImage *starImage = [UIImage imageNamed:@"star.jpg"];
    self.starImage.image = starImage;
}

@end
