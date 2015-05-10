//
//  OBOInterestedBuyersTableViewController.h
//  OBO
//
//  Created by Catherine Wu on 4/21/15.
//  Copyright (c) 2015 teamOBO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OBOItemObject.h"

@interface OBOInterestedBuyersTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) OBOItemObject *object;

@end
