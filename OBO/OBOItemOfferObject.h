//
//  OBOItemOfferObject.h
//  OBO
//
//  Created by Christine Li on 4/26/15.
//  Copyright (c) 2015 teamOBO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OBOItemOfferObject : NSObject

- (instancetype)initWithInfo:(NSDictionary *)info;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *contactInfo;

@end
