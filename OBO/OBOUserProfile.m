//
//  OBOUserProfile.m
//  Created by PrincetonOBO
//
//  UIObject that holds the fields of the json representation of an profile that is returned by the database. The fields include name, contact information, and location. 
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//



#import "OBOUserProfile.h"

@implementation OBOUserProfile

// object to save fields of a user profile
- (instancetype)initWithInfo:(NSDictionary *)info {
    self = [super init];
    if (self) {
        self.name = info[@"name"];
        self.contactInfo = info[@"net_id"];
        self.location = info[@"pickup_loc"];
    }
    return self;
}

@end
