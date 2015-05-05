#import "OBOSellThingViewController.h"


@interface OBOSellThingViewController()
{
    NSMutableArray *_pickerData;
    NSURLConnection *currentConnection;
    NSJSONSerialization *jsonParser;
    CGFloat originalY;
    
    //CGFloat name;

}
@property (weak, nonatomic) IBOutlet UITextField *itemDescriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *itemNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *itemSizeTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *itemPricePickerView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (nonatomic) double longitude;
@property (nonatomic) double latitude;
@property (retain, nonatomic) NSMutableData *apiReturnJSONData;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;
@end

@implementation OBOSellThingViewController
- (IBAction)submit:(id)sender {
    NSString *name = self.itemNameTextField.text;
    NSString *size = self.itemSizeTextField.text;
    NSString *text = self.itemDescriptionTextField.text;
    

    // Make RESTful URL
    NSString *user_id = @"5539c7e817aad86cf1000006";
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/users/%@/items", user_id];
    NSLog(@"making rest: %f", self.latitude);
    
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    NSString *json = [NSString stringWithFormat:@"{ \"description\": \"%@\", \"location\": {\"coordinates\":[ %lf, %lf]}, \"price\": %f }", text, self.longitude, self.latitude, 10.0];


    //NSString *encodedImage = [UIImageJPEGRepresentation(self.itemImageView.image, 0.7) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    //NSLog(encodedImage);

    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(json);

    [restRequest setHTTPBody:jsonData];
    [restRequest setHTTPMethod:@"POST"];
    [restRequest setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];

    
    // Cancel previous call if we run a bunch at once
    if( currentConnection)
    {
        [currentConnection cancel];
        currentConnection = nil;
        self.apiReturnJSONData = nil;
    }
    
    NSURLResponse *resp = nil;
    NSError *err = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest: restRequest returningResponse: &resp error: &err];
    
    NSString * itemResponse = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    NSLog(@"response: %@", itemResponse);


    //Clear entry fields
    self.itemDescriptionTextField.text = @"";
    self.itemNameTextField.text = @"";
    self.itemSizeTextField.text = @"";
    [self.itemPicImageView setImage:nil];
    [self.itemImageView setImage:nil];
    [self.itemPricePickerView reloadAllComponents];
    [self.itemPricePickerView selectRow:0 inComponent:0 animated:YES];


}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        self.latitude = [[NSString stringWithFormat:@"%.20lf", [currentLocation coordinate].latitude] doubleValue];
        self.longitude = [[NSString stringWithFormat:@"%.20lf", [currentLocation coordinate].longitude] doubleValue];

        NSLog(@"string: %@", [NSString stringWithFormat:@"%.20lf", [currentLocation coordinate].latitude]);
        NSLog(@"float: %f", self.latitude);
    }
    [self.locationManager stopUpdatingLocation];
    NSLog(@"location successfully updated");
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
    self.locationManager = [[CLLocationManager alloc] init];
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestWhenInUseAuthorization];
    }

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
    
    // Get the location!
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];
    NSLog(@"set location updating");
    
//    self.submitButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    self.submitButton.frame = CGRectMake(40, 140, 240, 30);
//    UIImage *btnImage = [UIImage imageNamed:@"sell.png"];
//    [self.submitButton setImage:btnImage forState:UIControlStateNormal];
    
    //UIImage *image = [UIImage imageNamed:@"sell.png"];
    //self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"string"
                                                     //image:image];

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

