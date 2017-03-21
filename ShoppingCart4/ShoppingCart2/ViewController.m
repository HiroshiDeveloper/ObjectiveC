//
//  ViewController.m
//  ShoppingCart2
//
//  Created by Hiroshi Tokutomi on 2017-03-11.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "ViewController.h"
#import "ShoppingCart.h"
#import "MainTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.myShoppingCart = [[ShoppingCart alloc] init];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.tabBar.delegate = self;
    self.itemButton.hidden = true;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"clothSegue"]) {
        ClothViewController* clothViewController = segue.destinationViewController;
        clothViewController.delegate = self;
    }else if([[segue identifier] isEqualToString:@"drinkSegue"]){
        DrinkViewController* drinkViewController = segue.destinationViewController;
        drinkViewController.delegate = self;
    }else if([[segue identifier] isEqualToString:@"foodSegue"]){
        FoodViewController* foodViewController = segue.destinationViewController;
        foodViewController.delegate = self;
    }else if([[segue identifier] isEqualToString:@"itemSegue"]){
        ItemViewController* itemController = segue.destinationViewController;
        NSMutableArray* arrayItem = [[NSMutableArray alloc] init];
        for(int i=0; i<self.myShoppingCart.list.count; i++){
            [arrayItem addObject:[self.myShoppingCart.list objectAtIndex:i].name];
        }
        itemController.items = arrayItem;
    }
}

-(void)addItem:(Product*)item{
    [self.myShoppingCart addProduct:item];
    [self.myShoppingCart calculate];
    self.totalPrice.text = [NSString stringWithFormat:@"%d$", self.myShoppingCart.totalPrice];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier;
    switch(indexPath.row){
        case 0:
            cellIdentifier = @"clothCell";
            break;
        case 1:
            cellIdentifier = @"drinkCell";
            break;
        case 2:
            cellIdentifier = @"foodCell";
            break;
    }
    MainTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if ( !cell ) {
        cell = [MainTableViewCell new];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

- (void)tabBar:(UITabBar*)tabBar didSelectItem:(UITabBarItem*)item
{
    if(item.tag == 0){
        NSLog(@"DID IT 1");
        [self performSegueWithIdentifier:@"itemSegue" sender:nil];
    }else if(item.tag == 1){
        NSLog(@"DID IT 2");
    }
    
}


@end
