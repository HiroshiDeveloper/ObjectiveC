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

@interface BookMarkViewController ();

@end

@implementation BookMarkViewController

- (void)viewDidLoad
{
    NSLog(@"%@", self.bookMarkDic);
    self.view.backgroundColor = [UIColor whiteColor];
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

// number of section(s), now I assume there is only 1 section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    // get the book mark dictionary's info
    return 10;
}

// the cell will be returned to the tableView
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"newFriendCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    UILabel *label1;
    UILabel *label2;
    
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        label1 = [[UILabel alloc] initWithFrame:CGRectMake(cell.bounds.size.width * 0.2,
                                                                    cell.bounds.size.height * 0.4,
                                                                    cell.bounds.size.width * 0.2,
                                                                    cell.bounds.size.height * 0.3)];
        
        label1.tag = 1;
        label2 = [[UILabel alloc] initWithFrame:CGRectMake(cell.bounds.size.width * 0.5,
                                                                    cell.bounds.size.height * 0.4,
                                                                    cell.bounds.size.width * 0.2,
                                                                    cell.bounds.size.height * 0.3)];
        label2.tag = 2;
        
        [cell addSubview:label1];
        [cell addSubview:label2];
    }
    else
    {
        label1 = (UILabel *)[cell viewWithTag:1];
        label2 = (UILabel *)[cell viewWithTag:2];
    }
    
    label1.text = [NSString stringWithFormat: @"%ld", indexPath.row];
    label2.text = [NSString stringWithFormat: @"%ld", indexPath.row];
    
    //etc.
    return cell;
}

// when user tap the row, what action you want to perform
- (void)tableView:(UITableView *)theTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"selected %ld row", indexPath.row);
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *sectionName;
    switch (section)
    {
        case 0:
            sectionName = @"one star restaurant";
            break;
        case 1:
            sectionName = @"two star restaurant";
            break;
        default:
            sectionName = @"three star restaurant";
            break;
    }
    return sectionName;
}


@end
