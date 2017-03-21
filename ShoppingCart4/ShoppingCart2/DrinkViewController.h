//
//  DrinkViewController.h
//  ShoppingCart2
//
//  Created by Hiroshi Tokutomi on 2017-03-12.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@protocol DrinkViewDelegate <NSObject>

-(void)addItem:(Product*)item;

@end

@interface DrinkViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) id<DrinkViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *drinkTableView;

- (IBAction)doneButton:(UIButton *)sender;
- (IBAction)cancelButton:(UIButton *)sender;

@end
