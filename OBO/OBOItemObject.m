//
//  OBOItemObject.m
//  Created by PrincetonOBO
//
//  UIObject that holds the fields of the json representation of the items being sold that is returned by the database. The fields include the item name, price, size, description, and image. 
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

#import "OBOItemObject.h"


@implementation OBOItemObject

// initialize an object with details and location
- (instancetype)initWithInfo:(NSDictionary *)info {
    self = [super init];
    if (self) {
        self.name = info[@"title"];
        self.price = [info[@"price"] integerValue];
        self.size = info[@"size"];
        self.details = info[@"description"];
        self.imageUrl = info[@"thumbnail"][@"image"];

        if (self.imageUrl != nil)
        {
            NSData *data = [[NSData alloc]initWithBase64EncodedString:self.imageUrl
                        options:NSDataBase64DecodingIgnoreUnknownCharacters];
            self.image = [UIImage imageWithData:data];
        }


        self.item_id = info[@"id"];
        self.longitude = info[@"longitude"];
        self.latitude = info[@"latitude"];
        self.offers = info[@"offers"];
        self.sold = [info[@"sold"] boolValue];
        self.location = @"";
    }
    return self;
}

@end
