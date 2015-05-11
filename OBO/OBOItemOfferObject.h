//
//  OBOItemOfferObject.h
//  Created by PrincetonOBO
//
//  Header file for OBOItemOfferObject.m
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OBOItemOfferObject : NSObject

- (instancetype)initWithInfo:(NSDictionary *)info;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *contactInfo;
@property (strong, nonatomic) NSString *price;

@end
