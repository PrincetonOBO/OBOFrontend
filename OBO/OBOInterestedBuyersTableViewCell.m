#import "OBOInterestedBuyersTableViewCell.h"
#import "OBOItemOfferObject.h"

@interface OBOInterestedBuyersTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation OBOInterestedBuyersTableViewCell

- (void)prepareWithItem3:(OBOItemOfferObject *)offer {
    self.nameLabel.text = offer.name;
    self.contactInfoLabel.text = offer.contactInfo;
    self.priceLabel.text = offer.price;

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
