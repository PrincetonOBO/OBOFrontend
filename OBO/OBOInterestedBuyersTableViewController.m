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
    
    /*
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"items2"
                                                         ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];
     
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"items2.json"];
    
    
    NSError *err = nil;
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&err];

    //NSDictionary *offers = self.object.offers;
    //NSLog(@"itemsJSON: %@", itemsJSON);
    //for (NSDictionary *offer in offers) {
    //    NSLog(@"Value: %@", value);
            if ([value isEqualToString:@"I'm going to make an offer on this and see if it works"]){
            NSLog(@"true");
            id offers = [itemJSON objectForKey:@"offers"];
                for (NSDictionary *offerJSON in offers) {
                    NSLog(@"Offer JSON: %@", offerJSON);
                    OBOItemOfferObject *offer = [[OBOItemOfferObject alloc] initWithInfo:offerJSON];
                    self.offers = [self.offers arrayByAddingObject:offer];
                }
        }
            }
    
    NSLog(@"offers for item: %@", self.offers);
    
    NSLog(@"done populating fields with offer data");
*/
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSLog(@"Set tableview data source");
    
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
    NSLog(@"Prepared cell");
    return cell;
}

@end
