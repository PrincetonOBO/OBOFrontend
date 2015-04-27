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
        self.name = info[@"name"];
        self.contactInfo = info[@"contactInfo"];
    }
    return self;
}

@end
