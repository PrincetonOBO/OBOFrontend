#import "OBOSellThingViewController.h"

@interface OBOSellThingViewController()
{
    NSMutableArray *_pickerData;
    NSURLConnection *currentConnection;
    NSJSONSerialization *jsonParser;
}
@property (weak, nonatomic) IBOutlet UITextField *itemDescriptionTextField;
@property (weak, nonatomic) IBOutlet UITextField *itemNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *itemSizeTextField;
@property (weak, nonatomic) IBOutlet UIPickerView *itemPricePickerView;
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (weak, nonatomic) NSString *longitude;
@property (weak, nonatomic) NSString *latitude;

//temp
@property (copy, nonatomic) NSString *enteredEmailAddress;
@property (retain, nonatomic) NSMutableData *apiReturnJSONData;

@end

@implementation OBOSellThingViewController
- (IBAction)submit:(id)sender {
    NSString *name = self.itemNameTextField.text;
    NSString *size = self.itemSizeTextField.text;
    NSString *text = self.itemDescriptionTextField.text;
    
    // Get the location!
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationManager startUpdatingLocation];

    // Make RESTful URL
    NSString *restCallString = [NSString stringWithFormat:@"http://54.187.175.240:80/users"];
    
    NSURL *restURL = [NSURL URLWithString:restCallString];
    NSMutableURLRequest *restRequest = [NSMutableURLRequest requestWithURL:restURL];
    NSString *json = [NSString stringWithFormat:@"{ \"first_name\": \"%@\", \"last_name\": \"Shit\", \"net_id\": \"Catherine Wu\" }", name ];
    
    NSData *jsonData = [json dataUsingEncoding:NSUTF8StringEncoding];

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
        self.latitude = [NSString stringWithFormat:@"%.20lf", [currentLocation coordinate].latitude];
        self.longitude = [NSString stringWithFormat:@"%.20lf", [currentLocation coordinate].longitude];

        NSLog(@"%@", self.latitude);
        NSLog(@"%@", self.longitude);
    }
    [self.locationManager stopUpdatingLocation];
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

- (BOOL)textFieldShouldReturn:(UITextField *)itemNameTextField {
    
    [itemNameTextField resignFirstResponder];
    return YES;
    
}


@end

