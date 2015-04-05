//
//  APPItemObject.h
//  RSSreader
//
//  Created by Christine Li on 3/22/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPItemObject : NSObject

- (instancetype)initWithInfo:(NSDictionary *)info;

@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSUInteger price;
@property (strong, nonatomic) NSString *size;
@property (strong, nonatomic) NSString *details;
@property (strong, nonatomic) NSString *imageUrl;

@end
