//
//  APPItemDetailsTableViewCell.m
//  RSSreader
//
//  Created by Christine Li on 3/22/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "APPItemDetailsTableViewCell.h"
#import "APPItemObject.h"

@interface APPItemDetailsTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemLabel;

@end
@implementation APPItemDetailsTableViewCell

- (void)prepareWithItem:(APPItemObject *)item {
    self.itemLabel.text = item.name;
    UIImage *image = [UIImage imageNamed:@"red-dress.jpg"];
    self.itemImageView.image = image;
}

@end
