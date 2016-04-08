//
//  ViewController.m
//  Restaurants
//
//  Created by Hiroshi on 4/4/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "ViewController.h"
#import "CommonHelper.h"
#import "SizeHelper.h"
#import "ColorHelper.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@import GoogleMaps;

@interface ViewController () <CLLocationManagerDelegate, MKMapViewDelegate, UITextViewDelegate>

@property (nonatomic) NSMutableArray<UIImageView *> *reviewArr;
@property (nonatomic) NSMutableArray<UIImageView *> *imageArr;
@property (nonatomic) MKMapView *map;
@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocation *location;
@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) NSInteger imgFlg;
@property (nonatomic) GMSPlacesClient *placesClient;
@property (nonatomic) GMSPlacePicker *placePicker;
@property (nonatomic) BOOL cameraFlg;
@property (nonatomic) BOOL hasStarted;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createGoogleMapView];
    [self createPicArea];
    [self createReviewArea];
    [self createListButton];
    [self createBar];
    [self createNameArea];
    [self createCommentArea];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createGoogleMapView
{
    
    self.map = [[CommonHelper sharedInstance] makeViewWithFrame:[SizeHelper googleMapSize]];
    self.map.delegate = self;
    [self.view addSubview:self.map];
    [self requestAuthorization];
}

- (void) requestAuthorization
{
    self.locationManager = [[CLLocationManager alloc] init];
    
    if(CLLocationManager.authorizationStatus != kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    if(CLLocationManager.authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        self.locationManager.distanceFilter = 10;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.delegate = self;
        [self.locationManager startUpdatingLocation];
        [self.map setShowsUserLocation:YES];
        self.placesClient = [[GMSPlacesClient alloc] init];
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    self.location = [locations lastObject];
    if (!self.hasStarted)
    {
        [self.map.userLocation setCoordinate:self.location.coordinate];
        [self setRegionInMap];
        self.hasStarted = true;
        [self getLocationNameWithLocation];
    }
}

- (void)setRegionInMap
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.map.userLocation.coordinate, 1000.0, 2000.0);
    [self.map setRegion:region animated:YES];
}

- (void)getLocationNameWithLocation
{
    CLLocationCoordinate2D center = self.location.coordinate;
    CLLocationCoordinate2D northEast = CLLocationCoordinate2DMake(center.latitude + 0.001,
                                                                  center.longitude + 0.001);
    CLLocationCoordinate2D southWest = CLLocationCoordinate2DMake(center.latitude - 0.001,
                                                                  center.longitude - 0.001);
    GMSCoordinateBounds *viewport = [[GMSCoordinateBounds alloc] initWithCoordinate:northEast
                                                                         coordinate:southWest];
    GMSPlacePickerConfig *config = [[GMSPlacePickerConfig alloc] initWithViewport:viewport];
    self.placePicker = [[GMSPlacePicker alloc] initWithConfig:config];
    
    [self.placePicker pickPlaceWithCallback:^(GMSPlace *place, NSError *error) {
        if (error != nil) {
            NSLog(@"Pick Place error %@", [error localizedDescription]);
            return;
        }
        
        if (place != nil) {
            self.nameLabel.text = place.name;
            self.nameLabel.textColor = [UIColor blackColor];
            NSLog(@"%@",[[place.formattedAddress
                                       componentsSeparatedByString:@", "] componentsJoinedByString:@"\n"]);
        } else {
            NSLog(@"No place selected");
        }
    }];
}

- (void)createPicArea
{
    self.imageArr = [NSMutableArray array];
    for (int i=0; i<3; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:[SizeHelper imageSizeWithIndex:i]];
        [imageView setImage:[UIImage imageNamed:@"gallery"]];
        imageView.backgroundColor = [[ColorHelper lightGrayColor] colorWithAlphaComponent:0.5f];
        imageView.tag = i;
        
        UILabel *plusLabel = [self createPlusLabel];
        plusLabel.tag = i;
        plusLabel.center = CGPointMake(imageView.frame.size.width / 2, imageView.frame.size.height / 2);
        [self.imageArr addObject:imageView];
        [imageView addSubview:plusLabel];
        [self.view addSubview:imageView];
        
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(plusLabelTap:)];
        [imageView addGestureRecognizer:tapGesture];
    }
}

- (void)createReviewArea
{
    self.reviewArr = [NSMutableArray array];
    for (int i=0; i<3; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:[SizeHelper reviewSizeWithIndex:i]];
        [imageView setImage:[UIImage imageNamed:@"gray_star"]];
        imageView.tag = i;
        imageView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap =
        [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(reviewTap:)];
        [imageView addGestureRecognizer:tap];
        [self.reviewArr addObject:imageView];
        [self.view addSubview:imageView];
    }
}

- (UILabel*)createPlusLabel
{
    UILabel *plusLabel = [[UILabel alloc] init];
    plusLabel.text = @"+";
    plusLabel.font=[UIFont fontWithName:@"Helvetica" size:50];
    plusLabel.textColor = [ColorHelper grayColor];
    [plusLabel sizeToFit];
    return plusLabel;
}

- (void)plusLabelTap:(UITapGestureRecognizer*)tapGestureRecognizer
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.imgFlg = tapGestureRecognizer.view.tag;
    
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)createListButton
{
    UIButton *listButton = [[UIButton alloc]init];
    [self.view addSubview:listButton];
}

- (void)createNameArea
{
    self.nameLabel = [[UILabel alloc] initWithFrame:[SizeHelper nameLabelSize]];
    self.nameLabel.text = @"Select your favorite restaurant!";
    self.nameLabel.textColor = [UIColor lightGrayColor];
    [self.view addSubview:self.nameLabel];
}

- (void)createCommentArea
{
    UITextView *textView = [[UITextView alloc] initWithFrame:[SizeHelper commentSize]];
    textView.backgroundColor = [[ColorHelper lightGrayColor] colorWithAlphaComponent:0.5f];
    textView.returnKeyType = UIReturnKeyDone;
    textView.delegate = self;
    textView.text = @"What's your comments for the restaurant? Type here!";
    textView.textColor = [UIColor lightGrayColor];
    [self.view addSubview:textView];
}

- (BOOL) textView:(UITextView*)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@"What's your comments for the restaurant? Type here!"]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor]; //optional
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = @"What's your comments for the restaurant? Type here!";
        textView.textColor = [UIColor lightGrayColor]; //optional
    }
    [textView resignFirstResponder];
}

- (void)createBar
{
    self.cameraFlg = FALSE;
    UINavigationBar *navBar = [[UINavigationBar alloc]initWithFrame:[SizeHelper barSize]];
    
    UIBarButtonItem *cameraItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(cameraItemPressed)];
    
    UIBarButtonItem *bookmarkItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(bookmarkItemPressed:)];
    
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchItemPressed)];
    
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveItemPressed)];
    
    UINavigationItem *item = [[UINavigationItem alloc] init];
    [item setLeftBarButtonItems:[NSArray arrayWithObjects:cameraItem, searchItem, bookmarkItem]];
    item.rightBarButtonItem = saveItem;
    
    navBar.items = [NSArray arrayWithObject:item];
    
    [self.view addSubview:navBar];
    [self.view bringSubviewToFront:navBar];
}

- (void)reviewTap:(UITapGestureRecognizer *)tapGesture
{
    NSUInteger tag = tapGesture.view.tag;
    
    for (int i=0; i<3; i++)
    {
        self.reviewArr[i].image = (i <= tag) ? [UIImage imageNamed:@"gold_star"] : [UIImage imageNamed:@"gray_star"];
    }
}

- (void)cameraItemPressed
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    self.cameraFlg = TRUE;
    [self presentViewController:picker animated:YES completion:NULL];
}

- (void)searchItemPressed
{
    [self getLocationNameWithLocation];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    if (self.cameraFlg) {
        UIImageWriteToSavedPhotosAlbum(chosenImage,nil,nil,nil);
        self.cameraFlg = FALSE;
    }else
    {
        self.imageArr[self.imgFlg].image = chosenImage;
    }
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)saveItemPressed
{
    UIView *confirmView = [[UIView alloc] initWithFrame:[SizeHelper confirmView]];
    confirmView.layer.cornerRadius = 20;
    confirmView.backgroundColor = [[ColorHelper lightGrayColor] colorWithAlphaComponent:0.95f];
    
    UILabel *confirmLabel = [[UILabel alloc] initWithFrame:[SizeHelper confirmLabelWithParent:confirmView]];
    confirmLabel.text = @"Confirm";
    
    UILabel *explainLabel = [[UILabel alloc] initWithFrame:[SizeHelper explainLabelWithParent:confirmView]];
    explainLabel.text = @"Are you sure?";

    [confirmView addSubview:confirmLabel];
    [confirmView addSubview:explainLabel];
    [self.view addSubview:confirmView];
}



@end
