//
//  OBOInterestedBuyersTableViewController.h
//  Created by PrincetonOBO
//
//  Header file for OBOInterestedBuyersTableViewController.m
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OBOItemObject.h"

@interface OBOYourItemsOffersTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) OBOItemObject *object;

@end
