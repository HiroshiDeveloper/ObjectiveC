//
//  DrinkViewController.m
//  ShoppingCart2
//
//  Created by Hiroshi Tokutomi on 2017-03-12.
//  Copyright © 2017 Hiroshi. All rights reserved.
//  test
//

#import "DrinkViewController.h"
#import "DrinkTableViewCell.h"
#import "Drink.h"

@interface DrinkViewController ()

@end
@implementation DrinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.drinkTableView.delegate = self;
    self.drinkTableView.dataSource = self;
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
    if([[self getCellDataRow:2] intValue] == 0){
        return;
    }
    // getCellDataRow
    // 0:drinkId, 1:drinkName, 2:drinkPrice, 3:drinkMadeInCountry
    // 4:isDrinkDiet, 5:drinkSize
    if(![[self getCellDataRow:4] isEqualToString:@"YES"] || [[self getCellDataRow:4] isEqualToString:@"NO"])
    {
        return;
    }
    
    Drink* drink = [[Drink alloc] initWithAmount:1 productId:[[self getCellDataRow:0] intValue] name:[self getCellDataRow:1] price:[[self getCellDataRow:2] intValue] country:[self getCellDataRow:3] diet:[self getCellDataRow:4] andSize:[[self getCellDataRow:5] intValue]];
    [self.delegate addItem:drink];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSString*)getCellDataRow:(int)row
{
    DrinkTableViewCell * cell = (DrinkTableViewCell *)[self.drinkTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
    NSString* data;
    switch(row){
        case 0:
            data = cell.drinkId.text;
            break;
        case 1:
            data = cell.drinkName.text;
            break;
        case 2:
            data = cell.drinkPrice.text;
            break;
        case 3:
            data = cell.drinkMadeInCountry.text;
            break;
        case 4:
            data = cell.isDrinkDiet.text;
            break;
        case 5:
            data = cell.drinkSize.text;
            break;
    }
    return data;
}

- (IBAction)cancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier;
    switch(indexPath.row){
        case 0:
            cellIdentifier = @"drinkId";
            break;
        case 1:
            cellIdentifier = @"drinkName";
            break;
        case 2:
            cellIdentifier = @"drinkPrice";
            break;
        case 3:
            cellIdentifier = @"drinkMadeInCountry";
            break;
        case 4:
            cellIdentifier = @"isDrinkDiet";
            break;
        case 5:
            cellIdentifier = @"drinkSize";
            break;
    }
    DrinkTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if ( !cell ) {
        cell = [DrinkTableViewCell new];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70;
}

@end
