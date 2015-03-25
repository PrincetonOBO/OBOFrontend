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

@end

@implementation OBOSellThingViewController
- (IBAction)submit:(id)sender {
    NSString *text = self.itemDescriptionTextField.text;
    self.itemDescriptionTextField.text = @"";
}

@end
