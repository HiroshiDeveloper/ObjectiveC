//
//  ItemViewController.m
//  ShoppingCart2
//
//  Created by Hiroshi Tokutomi on 2017-03-13.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "ItemViewController.h"
#import "ItemTableViewCell.h"
#import "ViewController.h"
#import "Product.h"

@interface ItemViewController ()

@end

@implementation ItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.itemTableView.delegate = self;
    self.itemTableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger rowCount = self.items.count;
    return rowCount;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier = @"itemCell";
    ItemTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if ( !cell ) {
        cell = [ItemTableViewCell new];
    }
    cell.itemName.text = [self.items objectAtIndex:indexPath.row];
    
    return cell;
}

- (IBAction)cancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
