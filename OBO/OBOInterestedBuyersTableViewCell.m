//
//  OBOInterestedBuyersTableViewCell.m
//  OBO
//
//  Created by Catherine Wu on 4/21/15.
//  Copyright (c) 2015 teamOBO. All rights reserved.
//

#import "OBOInterestedBuyersTableViewCell.h"

@interface OBOInterestedBuyersTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *contactInfoLabel;

@end

@implementation OBOInterestedBuyersTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
