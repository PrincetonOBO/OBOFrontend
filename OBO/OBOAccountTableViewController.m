#import "OBOAccountTableViewCell.h"
#import "OBOItemEditViewController.h"
#import "OBOItemObject.h"
#import "OBOAccountTableViewController.h"

@interface OBOAccountTableViewController ()

@property (strong, nonatomic) NSArray *items;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

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
    NSString *user_id = @"5539c7e817aad86cf1000006";
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/users/%@/items", user_id];
    
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    [restRequest setHTTPMethod:@"GET"];
    [restRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: restRequest returningResponse: &resp error: &err];
    
    NSString * itemResponse = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"User's items:%@", itemResponse);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"items2.json"];
    NSError *error = nil;
    
    NSString *writeString = [NSString stringWithFormat:@"{ \"items2\":%@ }", itemResponse];
    [writeString writeToFile:filePath atomically:YES];

    NSData *data = [NSData dataWithContentsOfFile:filePath];
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
    [self.tableView reloadData];

    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh)
             forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
}

-(void)refresh {
    NSLog(@"refreshing");
    // add data pull here!! //
    
    [super viewDidLoad];
    
    // Make RESTful URL
    NSString *user_id = @"5539c7e817aad86cf1000006";
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/users/%@/items", user_id];

    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    [restRequest setHTTPMethod:@"GET"];
    [restRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];

    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: restRequest returningResponse: &resp error: &err];
    
    NSString * itemResponse = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"User's items:%@", itemResponse);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"items2.json"];
    NSError *error = nil;

    NSString *writeString = [NSString stringWithFormat:@"{ \"items2\":%@ }", itemResponse];
    [writeString writeToFile:filePath atomically:YES];
    
    NSLog(@"Wrote refreshed file");
    //NSLog(@"%@", writeString);


    

    /* Open File */
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];
    
    
    
    /* Make new array and populate */
    NSArray *new = [NSArray array];
    self.items = new;
    NSArray *itemsJSON = json[@"items2"];
    for (NSDictionary *itemJSON in itemsJSON) {
        OBOItemObject *item = [[OBOItemObject alloc] initWithInfo:itemJSON];
        self.items = [self.items arrayByAddingObject:item];
    }
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView reloadData];


    NSLog(@"Done refreshing");
    [self.refreshControl endRefreshing];
}
#pragma mark - Table View


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"INDEX PATH: %@", indexPath);

    OBOAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameCell2" forIndexPath:indexPath];
    
    [cell prepareWithItem2:self.items[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"INDEX PATH: %@", indexPath);
    [self performSegueWithIdentifier:@"toItemEdit" sender:indexPath];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"sender: %@", sender);
    if ([[segue identifier] isEqualToString:@"toItemEdit"]) {
        OBOItemEditViewController *dest = segue.destinationViewController;
        NSIndexPath *indexPath =
        [self.tableView
         indexPathForCell:(UITableViewCell *)[[sender superview] superview]];
        NSUInteger row = indexPath.row;
        NSLog(@"Row: %d", row);

        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //[self.tableView indexPathForSelectedRow];
        dest.object = self.items[indexPath.row];
        NSLog(@"Name of item: %@", dest.object.name);
        
    }
}

@end

