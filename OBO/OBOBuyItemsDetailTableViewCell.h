//
//  OBOBuyItemsDetailTableViewCell.h
//  Created by PrincetonOBO
//
//  Header file for OBOBuyItemsDetailTableViewCell.m
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OBOItemObject;

@interface OBOBuyItemsDetailTableViewCell : UITableViewCell

- (void)prepareWithItem:(OBOItemObject *)item;

@end
