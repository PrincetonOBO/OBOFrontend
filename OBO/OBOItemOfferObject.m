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
        
        self.contactInfo = info[@"user"][@"net_id"];
        self.price = info[@"price"];
    }
    return self;
}

@end
