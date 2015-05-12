//
//  OBOYourItemOfferObject.m
//  OBO
//
//  Created by Catherine Wu on 5/11/15.
//  Copyright (c) 2015 teamOBO. All rights reserved.
//

#import "OBOYourItemOfferObject.h"

@implementation OBOYourItemOfferObject

// intialize object with name and offer amount 
- (instancetype)initWithInfo:(NSDictionary *)info {
    self = [super init];
    if (self) {
        NSLog(@"Making offer object with dict: %@", info);
        
        //BOOL isDict = [info isKindOfClass:[NSDictionary class]];
        //NSLog(isDict ? @"Yes" : @"No");
        
        //BOOL isDict2 = [info[@"offers"] isKindOfClass:[NSDictionary class]];
        //NSLog(isDict2 ? @"Yes" : @"No");
        
        
        self.name = info[@"offers"][0][@"user"][@"name"];
        //self.name = @"Walker Davis";
        NSLog(@"offer name: %@", self.name);
        
        
        self.price = [NSString stringWithFormat:@"%@", info[@"offers"][0][@"price"]];
        //self.price = @"ugh";
        NSLog(@"offer price: %@", self.price);
        self.item_id = info[@"id"];

        
    }
    return self;
}

@end
