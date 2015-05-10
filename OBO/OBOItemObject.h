#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>



@interface OBOItemObject : NSObject

- (instancetype)initWithInfo:(NSDictionary *)info;

@property (strong, nonatomic) NSString *name;
@property (nonatomic) NSUInteger price;

@property (strong, nonatomic) NSString *size;
@property (strong, nonatomic) NSString *details;
@property (strong, nonatomic) NSString *imageUrl;
@property (strong, nonatomic) NSString *longitude;
@property (strong, nonatomic) NSString *latitude;
@property (strong, nonatomic) NSString *item_id;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSArray *offers;
@property (nonatomic) UIImage *image;
@property (nonatomic, assign) BOOL *sold;
@property (nonatomic) NSUInteger time;

@end
