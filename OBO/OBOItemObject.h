#import <Foundation/Foundation.h>

@interface OBOItemObject : NSObject

- (instancetype)initWithInfo:(NSDictionary *)info;

@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSUInteger price;
@property (strong, nonatomic) NSString *size;
@property (strong, nonatomic) NSString *details;
@property (strong, nonatomic) NSString *imageUrl;
@property (strong, nonatomic) NSArray *offers;

@end
