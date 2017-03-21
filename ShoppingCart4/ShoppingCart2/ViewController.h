//
//  ViewController.h
//  ShoppingCart2
//
//  Created by Hiroshi Tokutomi on 2017-03-11.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ClothViewController.h"
#import "DrinkViewController.h"
#import "FoodViewController.h"
#import "ItemViewController.h"
#import "ShoppingCart.h"

@interface ViewController : UIViewController<ClothViewDelegate, DrinkViewDelegate, FoodViewDelegate, UITableViewDelegate,UITableViewDataSource, UITabBarDelegate>

@property (strong, nonatomic) ShoppingCart* myShoppingCart;
@property (weak, nonatomic) IBOutlet UILabel *totalPrice;
@property (weak, nonatomic) IBOutlet UITableView *mainTableView;
@property (weak, nonatomic) IBOutlet UITabBar *tabBar;
@property (weak, nonatomic) IBOutlet UIButton *itemButton;


@end

