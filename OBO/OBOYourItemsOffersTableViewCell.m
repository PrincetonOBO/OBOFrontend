#import "OBOYourItemsOffersTableViewCell.h"
#import "OBOItemOfferObject.h"

@interface OBOYourItemsOffersTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactInfoLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation OBOYourItemsOffersTableViewCell

- (void)prepareWithItem3:(OBOItemOfferObject *)offer {
    NSLog(@"PrepareWithItem3: %@", offer);
    self.nameLabel.text = offer.name;
    NSLog(@"Offer name: %@", offer.name);

    self.contactInfoLabel.text = offer.contactInfo;
    NSLog(@"Offer contact: %@", offer.contactInfo);
    
    self.priceLabel.text = offer.price;
    NSLog(@"Offer price: %@", offer.price);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
