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
#import "BookMarkViewController.h"
#import "MessageHelper.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "RestaurantsAnnotation.h"
@import GoogleMaps;

@interface ViewController () <CLLocationManagerDelegate, MKMapViewDelegate, UITextViewDelegate>

@property (nonatomic) NSMutableArray<UIImageView *> *reviewArr;
@property (nonatomic) NSMutableArray<UIImageView *> *imageArr;
@property (nonatomic) NSMutableDictionary *restaurantInfo;
@property (nonatomic) MKMapView *map;
@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) CLLocation *location;
@property (nonatomic) UILabel *nameLabel;
@property (nonatomic) NSString *address;
@property (nonatomic) NSString *comments;
@property (nonatomic) NSInteger imgFlg;
@property (nonatomic) UIView *confirmView;
@property (nonatomic) UIImageView *defaultImage;
@property (nonatomic) GMSPlacesClient *placesClient;
@property (nonatomic) GMSPlacePicker *placePicker;
@property (nonatomic) GMSPlace *tempInfo;
@property (nonatomic) BOOL cameraFlg;
@property (nonatomic) BOOL hasStarted;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createBar];
    [self createGoogleMapView];
    [self createPicArea];
    [self createReviewArea];
    [self createListButton];
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
    self.map.mapType = MKMapTypeStandard;
    self.map.delegate = self;
    [self.view addSubview:self.map];
    [self requestAuthorization];
}

- (void)requestAuthorization
{
    self.locationManager = [[CLLocationManager alloc] init];
    
    if(CLLocationManager.authorizationStatus != kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    if(CLLocationManager.authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        self.locationManager.distanceFilter = 100;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.delegate = self;
        [self.locationManager startUpdatingLocation];
        [self.map setShowsUserLocation:YES];
        self.placesClient = [[GMSPlacesClient alloc] init];
        self.map.zoomEnabled = NO;
        self.map.scrollEnabled = NO;
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
    
    // update calling the function above on each 500 meters
}

- (void)setRegionInMap
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.map.userLocation.coordinate, 400, 400);
    [self.map setRegion:region animated:YES];
}

- (void)getLocationNameWithLocation
{
    [self.placesClient currentPlaceWithCallback:^(GMSPlaceLikelihoodList * _Nullable likelihoodList, NSError * _Nullable error) {
        if (error)
        {
            return;
        }
        else
        {
            [self createAnnotationWithGMSPlace:likelihoodList];
        }
    }];
}

- (void)createAnnotationWithGMSPlace:(GMSPlaceLikelihoodList * _Nullable)likelihoodList
{
    for(GMSPlaceLikelihood *likelihood in likelihoodList.likelihoods)
    {
        for(NSString *type in likelihood.place.types)
        {
            if([type isEqualToString:@"bar"] ||
               [type isEqualToString:@"restaurant"] ||
               [type isEqualToString:@"cafe"] ||
               [type isEqualToString:@"bakery"] ||
               [type isEqualToString:@"food"])
            {
                RestaurantsAnnotation *annotation = [[RestaurantsAnnotation alloc] init];
                
                [annotation setCoordinate:likelihood.place.coordinate];
                [annotation setTitle:likelihood.place.name];
                [annotation setPlaceID:likelihood.place.placeID];
                [annotation setPlace:likelihood.place];
                [self.map addAnnotation:annotation];
            }
            
        }
    }
}

- (void)getLocationPicWithPlaceID:(NSString *)placeID
{
    [self.placesClient lookUpPhotosForPlaceID:placeID callback:^(GMSPlacePhotoMetadataList * _Nullable photos, NSError * _Nullable error)
    {
        if (error)
        {
            return;
        }
        else
        {
            [self setPicturesWithMetadataList:photos.results];
        }
    }];
}

- (void) setPicturesWithMetadataList:(NSArray<GMSPlacePhotoMetadata *> *)results
{
    [self.placesClient loadPlacePhoto:results[0] callback:^(UIImage * _Nullable photo, NSError * _Nullable error)
    {
        [self.defaultImage setImage:photo];
    }];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
    MKAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"annotation"];
    annotationView.canShowCallout = YES;
    UIImageView *iconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"restaurant"]];
    iconView.frame = [SizeHelper annotationIconSize];
    annotationView.leftCalloutAccessoryView = iconView;
    //annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    return annotationView;
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(nonnull MKAnnotationView *)view
{
    self.nameLabel.text = view.annotation.title;
    self.nameLabel.textColor = [UIColor blackColor];
    
    RestaurantsAnnotation *placeAnnotation = (RestaurantsAnnotation *)view.annotation;
    self.tempInfo = placeAnnotation.place;

    [self getLocationPicWithPlaceID:placeAnnotation.place.placeID];
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
        
        if (i == 0) {
            self.defaultImage = imageView;
        }
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
    self.nameLabel.text = [MessageHelper restaurantMsg];
    self.nameLabel.textColor = [UIColor lightGrayColor];
    [self.view addSubview:self.nameLabel];
}

- (void)createCommentArea
{
    UITextView *textView = [[UITextView alloc] initWithFrame:[SizeHelper commentSize]];
    textView.backgroundColor = [[ColorHelper lightGrayColor] colorWithAlphaComponent:0.5f];
    textView.returnKeyType = UIReturnKeyDone;
    textView.delegate = self;
    textView.text = [MessageHelper commentMsg];
    textView.textColor = [UIColor lightGrayColor];
    [self.view addSubview:textView];
}

- (BOOL) textView:(UITextView*)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"]) {
        self.comments = textView.text;
        [textView resignFirstResponder];
        return NO;
    }
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:[MessageHelper commentMsg]]) {
        textView.text = @"";
        textView.textColor = [UIColor blackColor]; //optional
    }
    [textView becomeFirstResponder];
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if ([textView.text isEqualToString:@""]) {
        textView.text = [MessageHelper commentMsg];
        textView.textColor = [UIColor lightGrayColor]; //optional
    }
    [textView resignFirstResponder];
}

- (void)createBar
{
    self.cameraFlg = FALSE;
    UINavigationBar *navBar = [[UINavigationBar alloc]initWithFrame:[SizeHelper barSize]];
    
    UIBarButtonItem *cameraItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(cameraItemPressed)];
    
    UIBarButtonItem *bookmarkItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(bookmarkItemPressed)];
    
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveItemPressed)];
    
    UINavigationItem *item = [[UINavigationItem alloc] init];
    [item setLeftBarButtonItems:[NSArray arrayWithObjects:cameraItem, bookmarkItem, nil]];
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
    if ([self.nameLabel.text isEqualToString:[MessageHelper restaurantMsg]]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Alert"
                                                                       message:[MessageHelper alertMsg]
                                                                preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action){}];
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else
    {
        [self createConfirmDialog];

    }
}

- (void)createConfirmDialog
{
    UIAlertController* confirm = [UIAlertController alertControllerWithTitle:@"Confirm"
                                                                     message:[MessageHelper confirmMsg]
                                                              preferredStyle:UIAlertControllerStyleAlert];
    
    __weak ViewController *weakSelf = self;
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action)
                                    {
                                        [weakSelf saveInformation];
                                    }];
    
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * action) {}];
    
    [confirm addAction:cancelAction];
    [confirm addAction:defaultAction];
    [self presentViewController:confirm animated:YES completion:nil];

}

- (void)bookmarkItemPressed
{
    [self presentViewController:[BookMarkViewController new] animated:YES completion:nil];
}

- (UILabel *)createLabelWithFrame:(CGRect)frame andText:(NSString *)text
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    
    return label;
}

// save store's information
- (void)saveInformation
{
    NSMutableDictionary *information = [[NSMutableDictionary alloc] init];
    [information setObject:[self getCurrentDate] forKey:@"date"];
    [information setObject:self.tempInfo forKey:@"info"];
    [information setObject:self.imageArr forKey:@"pic"];
    NSMutableArray<UIImage *> *newReviewArr = [NSMutableArray array];
    [self.reviewArr enumerateObjectsUsingBlock:^(UIImageView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [newReviewArr addObject:obj.image];
    }];
    
    [information setObject:newReviewArr forKey:@"review"];
    [information setObject:self.defaultImage.image forKey:@"default"];
    if (!self.comments) {
        self.comments = @"";
    }
    [information setObject:self.comments forKey:@"comments"];
    
    [[CommonHelper sharedInstance].bookMarkDic setObject:information forKey:self.tempInfo.placeID];
}

- (NSString *)getCurrentDate
{
    NSDate *date= [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;
}


@end
