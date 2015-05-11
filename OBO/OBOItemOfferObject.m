//
//  OBOItemOfferObject.m
//  Created by PrincetonOBO
//
//  UIObject that holds the fields of the json representation of an offer that is returned by the database. The fields include a name, contact information, and a price. 
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

#import "OBOItemOfferObject.h"

@implementation OBOItemOfferObject

- (instancetype)initWithInfo:(NSDictionary *)info {
    self = [super init];
    if (self) {
        NSLog(@"Making offer object with dict: %@", info);
        self.name = info[@"user"][@"name"];
        NSLog(@"offer name: %@", self.name);
        self.contactInfo = info[@"user"][@"net_id"];
        NSLog(@"offer contact: %@", self.contactInfo);
        self.price = [NSString stringWithFormat:@"%@", info[@"price"]];
        NSLog(@"offer price: %@", self.price);

    }
    return self;
}

@end
