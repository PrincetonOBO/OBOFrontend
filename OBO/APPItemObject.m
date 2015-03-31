//
//  APPItemObject.m
//  RSSreader
//
//  Created by Christine Li on 3/22/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "APPItemObject.h"

@implementation APPItemObject

- (instancetype)initWithInfo:(NSDictionary *)info {
    self = [super init];
    if (self) {
        self.name = info[@"name"];
        self.price = [info[@"price"] integerValue];
        self.size = info[@"size"];
        self.details = info[@"details"];
        self.imageUrl = info[@"imageUrl"];
    }
    return self;
}

@end
