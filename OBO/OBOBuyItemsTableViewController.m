//
//  OBOBuyItemsTableViewController.m
//  Created by PrincetonOBO
//
//  Creates a UITableView where each item being sold within a certain radius is listed in a newsfeed style page
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

#import "OBOBuyItemsDetailTableViewCell.h"
#import "OBOBuyItemsDetailViewController.h"
#import "OBOItemObject.h"
#import "OBOBuyItemsTableViewController.h"

@interface OBOBuyItemsTableViewController ()

@property (strong, nonatomic) NSArray *items;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic) double longitude;
@property (nonatomic) double latitude;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) IBOutlet UISearchBar *itemSearchBar;
@property (strong, nonatomic) NSArray *searchResults;
@property (weak, nonatomic) UITableView *index;


@end

@implementation OBOBuyItemsTableViewController

// NSArray of items being sold within set radius
- (NSArray *)items {
    if (!_items) {
        _items = [[NSArray alloc]init];
    }
    return _items;
}

// display items without set radius
- (void)viewDidLoad {
    [super viewDidLoad];

/* Get location for request to be made */
    self.locationManager = [[CLLocationManager alloc] init];
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }

    // Get the location!
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    NSLog(@"set location updating");


/* Make request for feed items and save */
    NSString *user_id = @"5539c7e817aad86cf1000006";
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/items?latitude=%f&longitude=%f&number=%d", self.latitude, self.longitude, 10];


    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    [restRequest setHTTPMethod:@"GET"];
    [restRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];

    NSURLResponse *resp = nil;
    NSError *err = nil;

    NSData *response = [NSURLConnection sendSynchronousRequest: restRequest returningResponse: &resp error: &err];

    NSString * itemResponse = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"User's items:%@", itemResponse);
    NSString *writeString;
    if ([itemResponse isEqualToString:@"null"])
    {
        writeString = [NSString stringWithFormat:@"{ \"items\":}"];
        NSLog(@"null items");
    }
    else
    {
        writeString = [NSString stringWithFormat:@"{ \"items\":%@ }", itemResponse];
        NSLog(@"We have items");
    }
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"items.json"];
    [writeString writeToFile:filePath atomically:YES];

    NSLog(@"Write string:%@", writeString);


    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&err];


    /*
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"items"
                                                         ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    NSError *error = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];
     */
    NSArray *itemsJSON = jsonDict[@"items"];
    for (NSDictionary *itemJSON in itemsJSON) {
        OBOItemObject *item = [[OBOItemObject alloc] initWithInfo:itemJSON];
        self.items = [self.items arrayByAddingObject:item];
    }

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView reloadData];

    //[self refresh];
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh)
             forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;


    //self.searchResults = [NSMutableArray arrayWithCapacity:[self.items count]];
}

// get most updated items for sale in certain radius and update newsfeed
-(void)refresh {
    // add data pull here!! //

    /* Make request for feed items and save */
    NSString *user_id = @"5539c7e817aad86cf1000006";
    [self.locationManager startUpdatingLocation];
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/items?latitude=%f&longitude=%f&number=%d", self.latitude, self.longitude, 10];


    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    [restRequest setHTTPMethod:@"GET"];
    [restRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];

    NSURLResponse *resp = nil;
    NSError *err = nil;

    NSData *response = [NSURLConnection sendSynchronousRequest: restRequest returningResponse: &resp error: &err];
    NSString * itemResponse = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];

    NSLog(@"Response: %@", response);

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];

    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"items.json"];
    NSString *writeString;
    if ([itemResponse isEqualToString:@"null"])
    {
        writeString = [NSString stringWithFormat:@"{ \"items\":}"];
        NSLog(@"null items");
    }
    else
    {
        writeString = [NSString stringWithFormat:@"{ \"items\":%@ }", itemResponse];
        NSLog(@"We have items");
    }
    [writeString writeToFile:filePath atomically:YES];

    NSLog(@"Write string:%@", writeString);


    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&err];

    /*
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"items"
                                                         ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:jsonPath];
    err = nil;
    NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data
                                                             options:kNilOptions
                                                               error:&err];
    */
    NSLog(@"Json: %@", json);
    if (json != nil) {
        NSArray *new = [NSArray array];
        self.items = new;
        NSArray *itemsJSON = json[@"items"];
        if (itemsJSON != nil) {

            for (NSDictionary *itemJSON in itemsJSON) {
                OBOItemObject *item = [[OBOItemObject alloc] initWithInfo:itemJSON];
                self.items = [self.items arrayByAddingObject:item];
            }
        }
    }

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView reloadData];

    [self.refreshControl endRefreshing];
    //[self refresh];
}

// search items for searchText
- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
    //[self.searchResults removeAllObjects];
    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"name contains[c] %@", searchText];

    self.searchResults = [self.items filteredArrayUsingPredicate:resultPredicate];
}

// reload table
-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString
                               scope:[[self.searchDisplayController.searchBar scopeButtonTitles]
                                      objectAtIndex:[self.searchDisplayController.searchBar
                                                     selectedScopeButtonIndex]]];

    return YES;
}

#pragma mark - Table View

//- (NSInteger)   :(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    /*
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        return self.searchResults.count;
//
//    } else {
//
//    }
//     */
//    return self.items.count;
//
//}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    //[self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"NameCell"];
//    OBOItemDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameCell" forIndexPath:indexPath];
//
//    if (tableView == self.searchDisplayController.searchResultsTableView) {
//        [cell prepareWithItem:self.searchResults[indexPath.row]];
//    } else {
//        [cell prepareWithItem:self.items[indexPath.row]];
//    }
//    return cell;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [self.searchResults count];

    } else {
        return [self.items count];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"NameCell";
    OBOBuyItemsDetailTableViewCell *cell = (OBOBuyItemsDetailTableViewCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    // Configure the cell...
    if (cell == nil) {
        cell = [[OBOBuyItemsDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    // Display item in the table cell
    OBOItemObject *item = nil;
    self.index = tableView;
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        item = [self.searchResults objectAtIndex:indexPath.row];
    } else {
        item = [self.items objectAtIndex:indexPath.row];
    }
    [cell prepareWithItem:item];

    return cell;
}

// switch pages to item description
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ToItemDescription"]) {
        OBOBuyItemsDetailViewController *dest = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        dest.object = nil;
        if (self.index == self.searchDisplayController.searchResultsTableView) {
            dest.object = [self.searchResults objectAtIndex:indexPath.row];
            self.index = nil;
        }
        else {
            dest.object = [self.items objectAtIndex:indexPath.row];
        }
        //dest.object = self.items[indexPath.row];
        NSLog(@"Name: %@", dest.object.name);
    }
}

//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"NameCell";
//    OBOItemDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//
//    if (cell == nil)
//    {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    /*
//    if (tableView == self.searchDisplayController.searchResultsTableView)
//    {
//        [cell prepareWithItem:self.searchResults[indexPath.row]];
//    }
//     */
//    else
//    {
//        [cell prepareWithItem:self.items[indexPath.row]];
//    }
//
//    return cell;
//}


/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ToItemDescription"]) {
        NSIndexPath *indexPath = nil;
        OBOItemObject *item = nil;

        if (self.searchDisplayController.active) {
            indexPath = [self.searchDisplayController.searchResultsTableView indexPathForSelectedRow];
            item = [self.searchResults objectAtIndex:indexPath.row];
        } else {
            indexPath = [self.tableView indexPathForSelectedRow];
            item = [self.items objectAtIndex:indexPath.row];
        }

        OBOItemDetailViewController *destViewController = segue.destinationViewController;
        destViewController.object = item;
    }
}
*/

// handle failure to get location
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

// get location of user
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;

    if (currentLocation != nil) {
        self.latitude = [[NSString stringWithFormat:@"%.20lf", [currentLocation coordinate].latitude] doubleValue];
        self.longitude = [[NSString stringWithFormat:@"%.20lf", [currentLocation coordinate].longitude] doubleValue];

    }
    [self.locationManager stopUpdatingLocation];
    NSLog(@"location successfully updated");
}

@end
