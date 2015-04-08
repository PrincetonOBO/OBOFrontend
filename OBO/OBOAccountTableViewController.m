#import "OBOAccountTableViewCell.h"
#import "OBOItemEditViewController.h"
#import "OBOItemObject.h"
#import "OBOAccountTableViewController.h"

@interface OBOAccountTableViewController ()

@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation OBOAccountTableViewController

- (NSArray *)items {
    if (!_items) {
        _items = [[NSArray alloc]init];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"items2"
                                                         ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];
    NSArray *itemsJSON = json[@"items2"];
    for (NSDictionary *itemJSON in itemsJSON) {
        OBOItemObject *item = [[OBOItemObject alloc] initWithInfo:itemJSON];
        self.items = [self.items arrayByAddingObject:item];
    }
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[OBOAccountTableViewCell class] forCellReuseIdentifier:@"NameCell2"];
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OBOAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameCell2" forIndexPath:indexPath];
    
    [cell prepareWithItem:self.items[indexPath.row]];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"toItemEdit"]) {
        OBOItemEditViewController *dest = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        dest.object = self.items[indexPath.row];
        
    }
}

@end

