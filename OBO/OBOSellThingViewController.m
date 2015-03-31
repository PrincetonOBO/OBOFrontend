//
//  OBOSellThingViewController.m
//  RSSreader
//
//  Created by Catherine Wu on 3/24/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "OBOSellThingViewController.h"
@interface OBOSellThingViewController()
@property (weak, nonatomic) IBOutlet UITextField *itemDescriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *itemNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *itemPriceTextField;
@property (weak, nonatomic) IBOutlet UITextField *itemSizeTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *itemPricePickerView;

@end

@implementation OBOSellThingViewController
- (IBAction)submit:(id)sender {
    NSString *name = self.itemNameTextField.text;
    NSString *price = self.itemPriceTextField.text;
    NSString *size = self.itemSizeTextField.text;
    NSString *text = self.itemDescriptionTextField.text;
    self.itemDescriptionTextField.text = @"";
    self.itemNameTextField.text = @"";
    self.itemPriceTextField.text = @"";
    self.itemSizeTextField.text = @"";
}

@end
