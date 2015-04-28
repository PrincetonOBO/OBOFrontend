//
//  OBOUserProfile.h
//  OBO
//
//  Created by Catherine Wu on 4/21/15.
//  Copyright (c) 2015 teamOBO. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OBOUserProfile : NSObject

- (instancetype)initWithInfo:(NSDictionary*)info;

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *contactInfo;
@property (strong, nonatomic) NSString *location;
@end
