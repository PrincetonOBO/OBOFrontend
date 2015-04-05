//
//  APPItemDetailsTableViewCell.h
//  RSSreader
//
//  Created by Christine Li on 3/22/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@class APPItemObject;

@interface APPItemDetailsTableViewCell : UITableViewCell

- (void)prepareWithItem:(APPItemObject *)item;

@end
