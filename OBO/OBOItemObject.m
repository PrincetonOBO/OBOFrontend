#import "OBOItemObject.h"


@implementation OBOItemObject

- (instancetype)initWithInfo:(NSDictionary *)info {
    self = [super init];
    if (self) {
        self.name = info[@"name"];
        self.price = [info[@"price"] integerValue];
        self.size = info[@"size"];
        self.details = info[@"details"];
        self.imageUrl = info[@"imageUrl"];
        //self.longitude = info[@"longitude"];
        //self.latitude = info[@"latitude"];
        
    }
    return self;
}

@end
