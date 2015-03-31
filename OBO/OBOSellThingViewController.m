//
//  OBOSellThingViewController.m
//  RSSreader
//
//  Created by Catherine Wu on 3/24/15.
//  Copyright (c) 2015 Appcoda. All rights reserved.
//

#import "OBOSellThingViewController.h"
@interface OBOSellThingViewController()
{
    NSMutableArray *_pickerData;
}
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
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    [self.imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    _pickerData = [NSMutableArray array];
    
    for (NSInteger x = 1; x <= 50; x++)
    {
        [_pickerData addObject:[NSString stringWithFormat:@"$%li",(long)x]];
    }

    self.itemPricePickerView.dataSource = self;
    self.itemPricePickerView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(IBAction)chooseImage:(id)sender
//{
//    self.imagePicker = [[UIImagePickerController alloc] init];
//    self.imagePicker.delegate = self;
//    [self.imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
//    [self presentViewController:self.imagePicker animated:YES completion:nil];
//}

-(void) imagePickerController:(UIImagePickerController *) picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.chosenImage = info[UIImagePickerControllerOriginalImage];
    [self.itemPicImageView setImage:self.chosenImage];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void) imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _pickerData.count;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return _pickerData[row];
}

@end

