//
//  OBOYourOffersTableViewCell.m
//  Created by Princeton OBO
//
//  A UITableViewCell that holds an offer that the user made. Displays item name and offer amount. 
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//


#import "OBOItemOfferObject.h"
#import "OBOYourOffersTableViewCell.h"

@interface OBOYourOffersTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation OBOYourOffersTableViewCell

- (void)prepareWithItem4:(OBOItemOfferObject *)offer {
    NSLog(@"PrepareWithItem4: %@", offer);
    self.nameLabel.text = offer.name;
    NSLog(@"Offer name: %@", offer.name);
    
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
