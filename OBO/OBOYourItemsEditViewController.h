//
//  OBOYourItemsEditViewController.h
//  Created by PrincetonOBO
//
//  Header file for OBOYourItemsEditViewController.m
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

#import <UIKit/UIKit.h>

@class OBOItemObject;

@interface OBOYourItemsEditViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) OBOItemObject *object;

@end
