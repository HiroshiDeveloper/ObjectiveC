//
//  BookMarkViewController.m
//  Restaurants
//
//  Created by Hiroshi on 4/8/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "BookMarkViewController.h"
#import "ViewController.h"
#import "SizeHelper.h"
#import "CommonHelper.h"
#import "InfoViewController.h"
@import GoogleMaps;

@interface BookMarkViewController ();

// the cell size
#define CELLHEIGH 80

@property (nonatomic) NSArray *allKeys;

@end

@implementation BookMarkViewController

- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor whiteColor];
    self.allKeys = [[CommonHelper sharedInstance].bookMarkDic allKeys];
    [self createBar];
    [self createTableView];
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

- (void)backItemPressed
{
    [self presentViewController:[ViewController new] animated:YES completion:nil];
}

- (void)createTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:[SizeHelper googleMapSize] style:UITableViewStylePlain];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CELLHEIGH;
}

- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    // get the book mark dictionary's info
    return [CommonHelper sharedInstance].bookMarkDic.count;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return YES if you want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for when you hit delete
        NSMutableDictionary *bookMarkInfo = [CommonHelper sharedInstance].bookMarkDic;
        [bookMarkInfo removeObjectForKey:self.allKeys[indexPath.row]];
        [self viewDidLoad];
    }
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"newFriendCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    UILabel *dateLabel;
    UILabel *nameLabel;
    
    NSMutableDictionary *bookMarkInfo = [CommonHelper sharedInstance].bookMarkDic;
    NSDictionary *dic= [bookMarkInfo objectForKey:self.allKeys[indexPath.row]];
    NSString *date = [dic objectForKey:@"date"];
    
    GMSPlace *infoPlace = (GMSPlace *)[dic objectForKey:@"info"];
    NSString *name = infoPlace.name;
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
        cell.textLabel.numberOfLines = 0;
        
        dateLabel = [[UILabel alloc] initWithFrame:[SizeHelper bmDateSizeWithSize:CELLHEIGH andParent:cell]];
        dateLabel.tag = 1;
        
        nameLabel = [[UILabel alloc] initWithFrame:[SizeHelper bmNameSizeWithSize:CELLHEIGH andParent:cell]];
        nameLabel.font=[nameLabel.font fontWithSize:20];
        nameLabel.tag = 2;
        
        [cell addSubview:dateLabel];
        [cell addSubview:nameLabel];
        
    }
    else
    {
        dateLabel = (UILabel *)[cell viewWithTag:1];
        nameLabel = (UILabel *)[cell viewWithTag:2];
    }
    
    [self createStoreIconWithImage:[dic objectForKey:@"default"] andParent:cell];

    dateLabel.text = date;
    nameLabel.text = name;
    
    return cell;
}

- (void)createStoreIconWithImage:(UIImage *)image andParent:(UITableViewCell *)cell
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[SizeHelper bmImageSizeWithParent:cell andImageSize:CELLHEIGH]];
    [imageView setImage:image];
    imageView.layer.cornerRadius = CELLHEIGH * 0.9 / 2;
    imageView.layer.masksToBounds = YES;
    [cell addSubview:imageView];
}

// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self presentViewController:[[InfoViewController alloc] initWithPlaceID:self.allKeys[indexPath.row]] animated:YES completion:nil];
}


@end
