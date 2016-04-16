//
//  InfoViewController.m
//  Restaurants
//
//  Created by Hiroshi on 4/15/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "InfoViewController.h"
#import "SizeHelper.h"
#import "BookMarkViewController.h"
#import "CommonHelper.h"
@import GoogleMaps;

@interface InfoViewController ()

@property (nonatomic) NSString *placeID;

@end

@implementation InfoViewController

- (instancetype)initWithPlaceID:(NSString *)placeID
{
    self = [super init];
    if (self)
    {
        _placeID = placeID;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createBar];
    
    NSMutableDictionary *bookMarkInfo = [CommonHelper sharedInstance].bookMarkDic;
    NSDictionary *dic= [bookMarkInfo objectForKey:self.placeID];
    GMSPlace *infoPlace = (GMSPlace *)[dic objectForKey:@"info"];
    
    [self createUILabelWithFrame:[SizeHelper ifRestaurantNameSize] andName:infoPlace.name];
    [self createStoreIconWithImage:[dic objectForKey:@"default"]];
    [self createReviewAreaWithImage:[dic objectForKey:@"review"]];
}

- (void)createBar
{
    UINavigationBar *navBar = [[UINavigationBar alloc]initWithFrame:[SizeHelper barSize]];
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemReply target:self action:@selector(backItemPressed)];
    UINavigationItem *item = [[UINavigationItem alloc] init];
    item.leftBarButtonItem = backItem;
    navBar.items = [NSArray arrayWithObject:item];
    [self.view addSubview:navBar];
    [self.view bringSubviewToFront:navBar];
}

- (void)createUILabelWithFrame:(CGRect)frame andName:(NSString *)name
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = name;
    [self.view addSubview:label];
}

- (void)createStoreIconWithImage:(UIImage *)image
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[SizeHelper ifRestaurantIconSize]];
    [imageView setImage:image];
    imageView.layer.cornerRadius =  [SizeHelper iconSize] / 2;
    imageView.layer.masksToBounds = YES;
    [self.view addSubview:imageView];
}

- (void)createReviewAreaWithImage:(NSMutableArray<UIImage *> *)imgReviewArr
{
    for (int i=0; i<3; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:[SizeHelper ifReviewSizeWithIndex:i]];
        [imageView setImage:imgReviewArr[i]];
        [self.view addSubview:imageView];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)backItemPressed
{
    [self presentViewController:[BookMarkViewController new] animated:YES completion:nil];
}

@end
