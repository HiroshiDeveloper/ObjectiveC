//
//  FoodViewController.h
//  ShoppingCart2
//
//  Created by Hiroshi Tokutomi on 2017-03-12.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@protocol FoodViewDelegate <NSObject>

-(void)addItem:(Product*)item;

@end

@interface FoodViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *foodTableView;
@property (weak, nonatomic) id<FoodViewDelegate> delegate;

- (IBAction)doneButton:(UIButton *)sender;
- (IBAction)cancelButton:(UIButton *)sender;

@end
