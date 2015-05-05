#import "OBOItemDetailsTableViewCell.h"
#import "OBOItemDetailViewController.h"
#import "OBOItemObject.h"
#import "OBOMasterTableViewController.h"

@interface OBOMasterTableViewController ()

@property (strong, nonatomic) NSArray *items;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation OBOMasterTableViewController

- (NSArray *)items {
    if (!_items) {
        _items = [[NSArray alloc]init];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UINavigationBar *bar = [self.navigationController navigationBar];
    //[bar setTintColor:[UIColor redColor]];
    
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"items"
                                                         ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];
    NSArray *itemsJSON = json[@"items"];
    for (NSDictionary *itemJSON in itemsJSON) {
        OBOItemObject *item = [[OBOItemObject alloc] initWithInfo:itemJSON];
        self.items = [self.items arrayByAddingObject:item];
    }
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh)
             forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
    
    
}

-(void)refresh {
    NSLog(@"refreshing");
    // add data pull here!! //
    [self.refreshControl endRefreshing];
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OBOItemDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameCell" forIndexPath:indexPath];
    
    [cell prepareWithItem:self.items[indexPath.row]];
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ToItemDescription"]) {
        OBOItemDetailViewController *dest = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        dest.object = self.items[indexPath.row];

    }
}


@end
