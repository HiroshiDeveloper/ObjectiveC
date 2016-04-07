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

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic) NSMutableArray<UIImageView *> *reviewArr;
@property (nonatomic) NSMutableArray<UIImageView *> *imageArr;
@property (nonatomic) MKMapView *map;
@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) BOOL cameraFlg;
@property (nonatomic) NSInteger imgFlg;

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
    self.map.backgroundColor = [ColorHelper lightGreenColor];
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
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *location = [locations lastObject];
    [self.map.userLocation setCoordinate:location.coordinate];
    [self.map setShowsUserLocation:YES];
    [self setRegionInMap];
}

- (void)setRegionInMap
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.map.userLocation.coordinate, 1000.0, 2000.0);
    [self.map setRegion:region animated:YES];
}

- (void)createPicArea
{
    self.reviewArr = [NSMutableArray array];
    for (int i=0; i<3; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:[SizeHelper imageSizeWithIndex:i]];
        [imageView setImage:[UIImage imageNamed:@"gallery"]];
        imageView.backgroundColor = [ColorHelper lightGrayColor];
        imageView.tag = i;
        
        UILabel *plusLabel = [self createPlusLabel];
        plusLabel.tag = i;
        plusLabel.center = CGPointMake(imageView.frame.size.width / 2, imageView.frame.size.height / 2);
        [self.imageArr addObject:imageView];
        [imageView addSubview:plusLabel];
        [self.view addSubview:imageView];
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
    plusLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(plusLabelTap:)];
    [plusLabel addGestureRecognizer:tapGesture];
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

- (void)createCommentArea
{
    UITextView *textView = [[UITextView alloc] initWithFrame:[SizeHelper commentSize]];
    textView.backgroundColor = [ColorHelper lightGrayColor];
    textView.returnKeyType = UIReturnKeyDone;
    [self.view addSubview:textView];
}

- (void)createBar
{
    self.cameraFlg = FALSE;
    UINavigationBar *navBar = [[UINavigationBar alloc]initWithFrame:[SizeHelper barSize]];
    
    UIBarButtonItem *cameraItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(cameraItemPressed)];
    
    UIBarButtonItem *bookmarkItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(bookmarkItemPressed:)];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneItemPressed:)];
    
    UINavigationItem *item = [[UINavigationItem alloc] init];
    [item setLeftBarButtonItems:[NSArray arrayWithObjects:cameraItem, bookmarkItem, nil]];
    item.rightBarButtonItem = doneItem;
    
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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
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



@end
