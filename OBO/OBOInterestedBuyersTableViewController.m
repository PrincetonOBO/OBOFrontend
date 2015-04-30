#import "OBOInterestedBuyersTableViewCell.h"
#import "OBOAccountTableViewController.h"
#import "OBOItemOfferObject.h"
#import "OBOInterestedBuyersTableViewController.h"

@interface OBOInterestedBuyersTableViewController ()
@property (strong, nonatomic) NSArray *offers;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation OBOInterestedBuyersTableViewController

- (NSArray *)offers {
    if (!_offers) {
        _offers = [[NSArray alloc]init];
    }
    return _offers;
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
        id value = [itemJSON objectForKey:@"offers"];
        for (NSDictionary *offerJSON in value) {
            OBOItemOfferObject *offer = [[OBOItemOfferObject alloc] initWithInfo:offerJSON];
            self.offers = [self.offers arrayByAddingObject:offer];
        }
    }
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh)
             forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(void)refresh {
    NSLog(@"refreshing");
    // add data pull here!! //
    [self.refreshControl endRefreshing];
}
#pragma mark - Table View


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.offers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    OBOInterestedBuyersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameCell3" forIndexPath:indexPath];
    
    [cell prepareWithItem3:self.offers[indexPath.row]];
    return cell;
}

@end
