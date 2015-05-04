#import "OBOItemObject.h"


@implementation OBOItemObject

- (instancetype)initWithInfo:(NSDictionary *)info {
    self = [super init];
    if (self) {
        self.name = info[@"description"];
        self.price = [info[@"price"] integerValue];
        self.size = info[@"size"];
        self.details = info[@"description"];
        self.imageUrl = info[@"imageUrl"];
        self.offers = info[@"offers"];
        self.sold = [info[@"sold"] boolValue];
        self.item_id = info[@"id"];
        //self.longitude = info[@"longitude"];
        //self.latitude = info[@"latitude"];
    }
    return self;
}

@end
