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
    
    [self createCenterUILabelWithFrame:[SizeHelper ifRestaurantNameSize] andName:infoPlace.name];
    [self createStoreIconWithImage:[dic objectForKey:@"default"]];
    [self createReviewAreaWithImage:[dic objectForKey:@"review"]];
    [self createCenterUILabelWithFrame:[SizeHelper ifDateSize] andName:[dic objectForKey:@"date"]];
    
    [self createLeftUILabelWithFrame:[SizeHelper ifCommentLabelSize] andName:@"Comment"];
    [self createTextWithFrame:[SizeHelper ifCommentSize] andText:[dic objectForKey:@"comment"]];
    
    [self createLeftUILabelWithFrame:[SizeHelper ifAddressLabelSize] andName:@"Address"];
    [self createTextWithFrame:[SizeHelper ifAddressSize] andText:[[infoPlace.formattedAddress
                                                                    componentsSeparatedByString:@", "] componentsJoinedByString:@"\n"]];
    [self createURLTextWithFrame:[SizeHelper ifWebsiteSize] andURL:infoPlace.website];
    
    for (int i=0; i<3; i++)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:[SizeHelper ifImageSizeWithIndex:i]];
        [imageView setImage:[dic objectForKey:@"pic"][i]];
        [self.view addSubview:imageView];
    }
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

- (void)createCenterUILabelWithFrame:(CGRect)frame andName:(NSString *)name
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = name;
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
}

- (void)createLeftUILabelWithFrame:(CGRect)frame andName:(NSString *)name
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = name;
    [self.view addSubview:label];
}

- (void)createTextWithFrame:(CGRect)frame andText:(NSString *)text
{
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.text = [textView.text stringByAppendingString:text];
    textView.editable = NO;
    textView.scrollEnabled = YES;
    [textView setFont:[UIFont systemFontOfSize:15]];
    [self.view addSubview:textView];
}

- (void)createURLTextWithFrame:(CGRect)frame andURL:(NSURL *)url
{
    UITextView *textView = [[UITextView alloc] initWithFrame:frame];
    textView.editable = NO;
    textView.scrollEnabled = YES;
    
    NSMutableAttributedString * str = [[NSMutableAttributedString alloc] initWithString:@"Website URL"];
    [str addAttribute: NSLinkAttributeName value:url range: NSMakeRange(0, str.length)];
    textView.attributedText = str;
    
    [self.view addSubview:textView];
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
}

- (void)backItemPressed
{
    [self presentViewController:[BookMarkViewController new] animated:YES completion:nil];
}

@end
