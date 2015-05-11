//
//  OBOUserProfile.h
//  Created by PrincetonOBO
//
//  Header file for OBOUserProfile.m
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OBOUserProfile : NSObject

- (instancetype)initWithInfo:(NSDictionary*)info;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *contactInfo;
@property (strong, nonatomic) NSString *location;
@end
