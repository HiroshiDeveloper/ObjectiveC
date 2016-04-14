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
@import GoogleMaps;

@interface BookMarkViewController ();

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
    return 80;
}

- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    // get the book mark dictionary's info
    NSLog(@"%ld", [CommonHelper sharedInstance].bookMarkDic.count);
    return [CommonHelper sharedInstance].bookMarkDic.count;
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
        dateLabel = [[UILabel alloc] initWithFrame:[SizeHelper bmDateSizeWithParent:cell]];
        
        dateLabel.tag = 1;
        
        nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(cell.bounds.size.width * 0.35,
                                                                    cell.bounds.size.height * 0.25,
                                                                    cell.bounds.size.width * 0.6,
                                                                    cell.bounds.size.height * 0.5)];
        nameLabel.tag = 2;
        
        [cell addSubview:dateLabel];
        [cell addSubview:nameLabel];
    }
    else
    {
        dateLabel = (UILabel *)[cell viewWithTag:1];
        nameLabel = (UILabel *)[cell viewWithTag:2];
    }
    
    dateLabel.text = date;
    nameLabel.text = name;
    UIButton *infoButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    infoButton.frame = CGRectMake(cell.bounds.size.width * 1,
                                  cell.bounds.size.height * 0.2,
                                  cell.bounds.size.width * 0.15,
                                  cell.bounds.size.height * 0.6);
    [infoButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:infoButton];

    return cell;
}

- (void)buttonClicked:(UIButton*)button
{
    NSLog(@"Button clicked.");
}

// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %ld row", indexPath.row);
}


@end
