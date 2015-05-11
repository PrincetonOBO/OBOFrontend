//
//  OBOAppDelegate.h
//  Created by PrincetonOBO
//
//  Header file for OBOAppDelegate.m
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>


@interface OBOAppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) double longitude;
@property (nonatomic) double latitude;


@end
