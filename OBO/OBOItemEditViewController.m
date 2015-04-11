//
//  OBOItemEditViewController.m
//  OBO
//
//  Created by Catherine Wu on 4/7/15.
//  Copyright (c) 2015 teamOBO. All rights reserved.
//

#import "OBOItemEditViewController.h"
#import "OBOItemObject.h"

@interface OBOItemEditViewController()

@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemSizeLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemLocationLabel;

@end

@implementation OBOItemEditViewController
- (IBAction)editItemPrice:(id)sender {
}

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
