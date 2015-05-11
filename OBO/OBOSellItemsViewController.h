//
//  OBOSellItemsViewController.h
//  Created by PrincetonOBO
//
//  Header file for OBOSellItemsViewController.m
//
//  Copyright (c) 2015 PrincetonOBO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface OBOSellItemsViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *itemPicImageView;
@property (strong, nonatomic) UIImage *chosenImage;
@property (strong, nonatomic) UIImagePickerController *imagePicker;


@end
