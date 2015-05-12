//
//  OBOAppDelegate.m
//  Created by PrincetonOBO
//
//  Launches the application and brings the user to the first view controller
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//


#import "OBOAppDelegate.h"

@implementation OBOAppDelegate

// launch application
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    NSLog(@"Application opened!");
    NSArray *dirPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docsDir = [dirPaths objectAtIndex:0];
    NSString *databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:@"items.json"]];
    NSString *writeString = [NSString stringWithFormat:@"{ \"items\": }"];
    [writeString writeToFile:databasePath atomically:YES];
    
    databasePath = [[NSString alloc] initWithString: [docsDir stringByAppendingPathComponent:@"items2.json"]];
    [@"{\"items2\":}" writeToFile:databasePath atomically:YES];
    
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:40.0/255.0 green:120.0/255.0 blue:210.0/255.0 alpha:1.0]];
    [[UINavigationBar appearance]
     setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
//    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8], nil]];
     return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

// handle when unable to get user's location
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

// get user's location
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
