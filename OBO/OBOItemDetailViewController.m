#import "OBOItemDetailViewController.h"
#import "OBOItemObject.h"

@interface OBOItemDetailViewController()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemLocationLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemDescriptionLabel;

@end

@implementation OBOItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"red-dress.jpg"];
    self.itemImageView.image = image;
    self.itemNameLabel.text = self.object.name;
    self.itemPriceLabel.text = [NSString stringWithFormat:@"%lu",(unsigned long)self.object.price];
    self.itemSizeLabel.text = self.object.size;
    self.itemLocationLabel.text = self.object.size;
    self.itemDescriptionLabel.text = self.object.details;
    
}


@end
