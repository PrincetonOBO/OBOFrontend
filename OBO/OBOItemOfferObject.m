//
//  OBOItemOfferObject.m
//  OBO
//
//  Created by Christine Li on 4/26/15.
//  Copyright (c) 2015 teamOBO. All rights reserved.
//

#import "OBOItemOfferObject.h"

@implementation OBOItemOfferObject

- (instancetype)initWithInfo:(NSDictionary *)info {
    self = [super init];
    if (self) {
        self.name = info[@"user"][@"name"];
        NSLog(@"offer name: %@", self.name);
        self.contactInfo = info[@"user"][@"net_id"];
        NSLog(@"offer contact: %@", self.contactInfo);
        self.price = info[@"price"];
        NSLog(@"offer price: %@", self.price);

    }
    return self;
}

@end
