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

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createGoogleMapView];
    [self createPicArea];
    [self createReviewArea];
    [self createListButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createGoogleMapView
{
    UIView *googleMapView = [[CommonHelper sharedInstance] makeViewWithFrame:[SizeHelper googleMapSize]];
    googleMapView.backgroundColor = [ColorHelper lightGreenColor];
    [self.view addSubview:googleMapView];
}

- (void)createPicArea
{
    for (int i=0; i<3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:[SizeHelper imageSizeWithIndex:i]];
        imageView.backgroundColor = [ColorHelper lightBlueColor];
        
        UILabel *plusLabel = [self createPlusLabel];
        
        [imageView addSubview:plusLabel];
        [self.view addSubview:imageView];
    }
}

- (void)createReviewArea
{
    for (int i=0; i<3; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:[SizeHelper reviewSizeWithIndex:i]];
        [imageView setImage:[UIImage imageNamed:@"gray_star"]];
        [self.view addSubview:imageView];
    }
}

- (UILabel*)createPlusLabel
{
    UILabel *plusLabel = [[UILabel alloc] initWithFrame:[SizeHelper plusLabelSize]];
    plusLabel.text = @"+";
    plusLabel.font=[UIFont fontWithName:@"Helvetica" size:50];
    plusLabel.textColor = [UIColor blackColor];
    return plusLabel;
}

- (void)createListButton
{
    UIButton *listButton = [[UIButton alloc] initWithFrame:[SizeHelper listButtonSize]];
    [self.view addSubview:listButton];
}


@end
