//
//  FoodViewController.m
//  ShoppingCart2
//
//  Created by Hiroshi Tokutomi on 2017-03-12.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "FoodViewController.h"
#import "Food.h"
#import "FoodTableViewCell.h"

@interface FoodViewController ()

@end

@implementation FoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.foodTableView.delegate = self;
    self.foodTableView.dataSource = self;
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

- (IBAction)doneButton:(UIButton *)sender
{
    if([[self getCellDataRow:5] intValue] == 0 || [[self getCellDataRow:2] intValue] == 0){
        return;
    }
    // getCellDataRow
    // 0:foodId, 1:foodName, 2:foodPrice, 3:foodMadeInCountry
    // 4:foodCalorie, 5:foodSize, 6:foodIngredients
    NSArray<NSString*>* ingredients = [[NSMutableArray<NSString*> alloc] init];
    ingredients = [[self getCellDataRow:6] componentsSeparatedByString:@","];
    
    Food* food = [[Food alloc] initWithAmount:1 productId:[[self getCellDataRow:0] intValue] name:[self getCellDataRow:1] price:[[self getCellDataRow:2] intValue] country:[self getCellDataRow:3] calorie:[[self getCellDataRow:4] intValue] size:[[self getCellDataRow:5] intValue] andIngredients:ingredients];
    
    [self.delegate addItem:food];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSString*)getCellDataRow:(int)row
{
    FoodTableViewCell * cell = (FoodTableViewCell *)[self.foodTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
    NSString* data;
    switch(row){
        case 0:
            data = cell.foodId.text;
            break;
        case 1:
            data = cell.foodName.text;
            break;
        case 2:
            data = cell.foodPrice.text;
            break;
        case 3:
            data = cell.foodMadeInCountry.text;
            break;
        case 4:
            data = cell.foodCalorie.text;
            break;
        case 5:
            data = cell.foodSize.text;
            break;
        case 6:
            data = cell.foodIngredients.text;
            break;
    }
    return data;
}

- (IBAction)cancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier;
    switch(indexPath.row){
        case 0:
            cellIdentifier = @"foodId";
            break;
        case 1:
            cellIdentifier = @"foodName";
            break;
        case 2:
            cellIdentifier = @"foodPrice";
            break;
        case 3:
            cellIdentifier = @"foodMadeInCountry";
            break;
        case 4:
            cellIdentifier = @"foodCalorie";
            break;
        case 5:
            cellIdentifier = @"foodSize";
            break;
        case 6:
            cellIdentifier = @"foodIngredients";
            break;
    }
    FoodTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if ( !cell ) {
        cell = [FoodTableViewCell new];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}


@end
