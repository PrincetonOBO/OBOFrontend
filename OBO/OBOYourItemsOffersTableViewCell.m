//
//  OBOYourItemsOffersTableViewCell.m
//  Created by PrincetonOBO
//
//  A UITableViewCell that holds each offer that your item has received. The cell includes the name and contact information of the user who made an offer, along with the offer amount. 
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

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
