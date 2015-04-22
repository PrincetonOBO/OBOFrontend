//
//  OBOUserProfile.m
//  OBO
//
//  Created by Catherine Wu on 4/21/15.
//  Copyright (c) 2015 teamOBO. All rights reserved.
//

#import "OBOUserProfile.h"

@implementation OBOUserProfile

- (instancetype)initWithInfo:(NSDictionary *)info {
    self = [super init];
    if (self) {
        self.name = info[@"name"];
        self.contactInfo = info[@"contactInfo"];
    }
    return self;
}

@end
