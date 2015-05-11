//
//  OBOYourItemsOffersTableViewController.m
//  Created by PrincetonOBO
//
//  Creates a UITableView where each offer on the selected item will be listed
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

#import "OBOYourItemsOffersTableViewCell.h"
#import "OBOYourItemsTableViewController.h"
#import "OBOItemOfferObject.h"
#import "OBOYourItemsOffersTableViewController.h"

@interface OBOYourItemsOffersTableViewController ()
@property (strong, nonatomic) NSArray *offers;

@end

@implementation OBOYourItemsOffersTableViewController

- (NSArray *)offers {
    if (!_offers) {
        _offers = [[NSArray alloc]init];
    }
    return _offers;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"interested buyers did load: %@", self.object.name);
    
    
    NSDictionary *offers = self.object.offers;
    for (NSDictionary *offerJSON in offers) {
        NSLog(@"Offer JSON: %@", offerJSON);
        OBOItemOfferObject *offer = [[OBOItemOfferObject alloc] initWithInfo:offerJSON];
        
        self.offers = [self.offers arrayByAddingObject:offer];
    }


    NSLog(@"offers for item: %@", self.offers);
    NSLog(@"length of offers array: %lu", (unsigned long)[self.offers count]);
    
    NSLog(@"done populating fields with offer data");

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
    OBOYourItemsOffersTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameCell3" forIndexPath:indexPath];
    
    NSLog(@"Cell number: %lu", indexPath.row);
    OBOItemOfferObject *offer = self.offers[indexPath.row];
    NSLog(@"name: %@", offer.name);
    [cell prepareWithItem3:self.offers[indexPath.row]];
    NSLog(@"Prepared cell");
    return cell;
}

@end
