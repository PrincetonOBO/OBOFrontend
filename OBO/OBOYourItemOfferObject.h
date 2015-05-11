//
//  OBOYourItemOfferObject.h
//  OBO
//
//  Created by Catherine Wu on 5/11/15.
//  Copyright (c) 2015 teamOBO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OBOYourItemOfferObject : NSObject

- (instancetype)initWithInfo:(NSDictionary *)info;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *price;

@end
