#import "OBOYourItemsObject.h"

@implementation OBOYourItemsObject

- (instancetype)initWithInfo:(NSDictionary *)info {
    self = [super init];
    if (self) {
        self.name = info[@"name"];
    }
    return self;
}

@end
