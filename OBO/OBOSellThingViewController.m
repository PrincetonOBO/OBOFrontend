#import "OBOSellThingViewController.h"

CGFloat originalY;
//CGFloat name;

@interface OBOSellThingViewController()
{
    NSMutableArray *_pickerData;
}
@property (weak, nonatomic) IBOutlet UITextField *itemDescriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *itemNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *itemSizeTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *itemPricePickerView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@end

@implementation OBOSellThingViewController
- (IBAction)submit:(id)sender {
    NSString *name = self.itemNameTextField.text;
    NSString *size = self.itemSizeTextField.text;
    NSString *text = self.itemDescriptionTextField.text;
    self.itemDescriptionTextField.text = @"";
    self.itemNameTextField.text = @"";
    self.itemSizeTextField.text = @"";
    [self.itemImageView setImage:nil];
    [self.itemPricePickerView reloadAllComponents];
    [self.itemPricePickerView selectRow:0 inComponent:0 animated:YES];
}
- (IBAction)choosePhoto:(id)sender {
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
    [self.imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

-(void) viewDidLoad
{
    [super viewDidLoad];
    _pickerData = [NSMutableArray array];
    [_pickerData addObject:[NSString stringWithFormat:@" "]];
    
    for (NSInteger x = 1; x <= 50; x++)
    {
        [_pickerData addObject:[NSString stringWithFormat:@"$%li",(long)x]];
    }

    self.itemPricePickerView.dataSource = self;
    self.itemPricePickerView.delegate = self;
    self.itemDescriptionTextField.delegate = self;
    self.itemNameTextField.delegate = self;
    self.itemSizeTextField.delegate = self;
    
    originalY = self.view.frame.origin.y;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.view endEditing:YES];
}

- (bool)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) imagePickerController:(UIImagePickerController *) picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.chosenImage = info[UIImagePickerControllerOriginalImage];
    [self.itemImageView setImage:self.chosenImage];
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

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    //Be informed of keyboard
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardDidHideNotification object:nil];
}

#pragma mark keyboard

- (void)keyboardDidShow:(NSNotification *)notification
{
    //NSDictionary *userInfo = [notification userInfo];
    //CGSize size = [[userInfo objectForKey: UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    
//    CGRect frame = CGRectMake(self.view.frame.origin.x,
//                              self.view.frame.origin.y  - size.height,
//                              self.view.frame.size.width,
//                              self.view.frame.size.height);
    //self.view.frame = frame;
    
}

- (void)keyboardWillHide:(NSNotification *)notification
{
//    NSDictionary *userInfo = [notification userInfo];
//    CGSize size = [[userInfo objectForKey: UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
//    self.view.frame = CGRectMake(self.view.frame.origin.x,
//                                 self.view.frame.origin.y - size.height,
//                                 self.view.frame.size.width,
//                                 self.view.frame.size.height);
//    
//    NSLog(@"%f", size.height);
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    CGRect frameRect = textField.frame;
    //NSLog(@"%f", self.view.frame.origin.y);
    if (frameRect.origin.y > self.view.frame.size.height/2) {
    CGRect frame = CGRectMake(self.view.frame.origin.x,
                            -frameRect.origin.y/2.0,
                            self.view.frame.size.width,
                            self.view.frame.size.height);
    self.view.frame = frame;
    }
    //NSLog(@"%f", frameRect.origin.y);
    return YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    CGRect frame = CGRectMake(self.view.frame.origin.x,
                              originalY,
                              self.view.frame.size.width,
                              self.view.frame.size.height);
    self.view.frame = frame;
    return YES;
}

@end

