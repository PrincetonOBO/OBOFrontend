//
//  OBOBuyItemsDetailTableViewCell.m
//  Created by Princeton OBO
//
//  A UITableViewCell that holds an item that is being sold within a certain radius. Displays a small thumbnail photo, the name of the item, and the price. 
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

#import "OBOBuyItemsDetailTableViewCell.h"
#import "OBOItemObject.h"

@interface OBOBuyItemsDetailTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemTimeLabel;
@property (weak, nonatomic) IBOutlet UIImageView *itemSoldImageView;

@end
@implementation OBOBuyItemsDetailTableViewCell

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
