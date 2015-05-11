//
//  OBOYourOffersTableViewCell.m
//  Created by Princeton OBO
//
//  A UITableViewCell that holds an offer that the user made. Displays item name and offer amount. 
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//


#import "OBOYourItemOfferObject.h"
#import "OBOYourOffersTableViewCell.h"

@interface OBOYourOffersTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation OBOYourOffersTableViewCell

// prepare the cells of the table view with offers
- (void)prepareWithItem4:(OBOYourItemOfferObject *)offer {
    NSLog(@"PrepareWithItem4: %@", offer);
    self.nameLabel.text = offer.name;
    NSLog(@"Offer name: %@", offer.name);
    
    self.priceLabel.text = offer.price;
    NSLog(@"Offer price: %@", offer.price);
}

- (void)awakeFromNib {
    // Initialization code
}

// delete an offer from the database
- (IBAction)deleteOffer:(id)sender {
    //IMPLEMENT DELETE OFFER
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Delete" message:@"Are you sure you want to delete this offer? This action cannot be undone" delegate:self cancelButtonTitle:@"No, keep this offer" otherButtonTitles:@"Yes, delete this offer", nil];
    [alertView show];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
