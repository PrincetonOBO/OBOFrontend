//
//  OBOYourOffersTableViewController.m
//  Created by PrincetonOBO
//
//  Creates a UITableView where each offer you have made is listed
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

#import "OBOYourItemOfferObject.h"
#import "OBOYourOffersTableViewCell.h"
#import "OBOYourOffersTableViewController.h"

@interface OBOYourOffersTableViewController ()

@property (strong, nonatomic) NSArray *offers;

@end

@implementation OBOYourOffersTableViewController

// array of offers
- (NSArray *)offers {
    if (!_offers) {
        _offers = [[NSArray alloc]init];
    }
    return _offers;
}

// Load a page with all offers that the user has made
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"YOUR OFFERS PANE LOADED");
    NSString *user_id = @"5539c7e817aad86cf1000006";
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/manage/users/%@/offers", user_id];
    
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    [restRequest setHTTPMethod:@"GET"];
    [restRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: restRequest returningResponse: &resp error: &err];
    
    NSString * itemResponse = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"User's offers:%@", itemResponse);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"offers.json"];
    NSError *error = nil;
    
    NSString *writeString = [NSString stringWithFormat:@"{ \"offers\":%@ }", itemResponse];
    [writeString writeToFile:filePath atomically:YES];
    
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                         options:kNilOptions
                                                           error:&error];
    NSArray *offersJSON = json[@"offers"];
    NSLog(@"%@", offersJSON);
    //if (title == (id)[NSNull null]
    //if (array == nil || [array count] == 0) {
    if (offersJSON != [NSNull null]) {
        for (NSDictionary *offerJSON in offersJSON) {
            NSLog(@"Current offer:%@", offerJSON);
            OBOYourItemOfferObject *offer = [[OBOYourItemOfferObject alloc] initWithInfo:offerJSON];
            self.offers = [self.offers arrayByAddingObject:offer];
        }
    }
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView reloadData];
    
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(refresh)
             forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refreshControl;
}

// refresh the offers made 
-(void)refresh {
    NSLog(@"refreshing");
    // add data pull here!! //
    
    [super viewDidLoad];
    
    // Make RESTful URL
    NSString *user_id = @"5539c7e817aad86cf1000006";
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/manage/users/%@/offers", user_id];
    
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    [restRequest setHTTPMethod:@"GET"];
    [restRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
    
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: restRequest returningResponse: &resp error: &err];
    
    NSString * itemResponse = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"User's offers:%@", itemResponse);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"offers.json"];
    NSError *error = nil;
    
    NSString *writeString;
    if ([itemResponse isEqualToString:@"null"])
    {
        writeString = [NSString stringWithFormat:@"{ \"offers\":}"];
        NSLog(@"null items");
    }
    else
    {
        writeString = [NSString stringWithFormat:@"{ \"offers\":%@ }", itemResponse];
        NSLog(@"We have items");
    }
    
    NSLog(@"Wrote: %@", writeString);
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
    self.offers = new;
    NSDictionary *items = json[@"offers"];
    
    if (itemResponse != (id) [NSNull null]) {
        for (NSDictionary *item in items) {
            NSString *name = item[@"title"];
            NSLog(@"item we're offering money for:%@", name);
            NSLog(@"accessing offer");

            NSDictionary *offerJSON = item;
            NSLog(@"offers here: %@", offerJSON);
            NSLog(@"name: %@", offerJSON[@"user"]);
            OBOYourItemOfferObject *offer = [[OBOYourItemOfferObject alloc] initWithInfo:offerJSON];
            self.offers = [self.offers arrayByAddingObject:offer];
        }
    }
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView reloadData];
    
    
    NSLog(@"Done refreshing");
    [self.refreshControl endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.offers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"INDEX PATH: %@", indexPath);
    
    OBOYourOffersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameCell4" forIndexPath:indexPath];
    
    [cell prepareWithItem4:self.offers[indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"INDEX PATH: %@", indexPath);
}


@end
