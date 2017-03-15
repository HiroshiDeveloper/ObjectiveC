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

@interface FoodViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *foodId;
@property (weak, nonatomic) IBOutlet UITextField *foodName;
@property (weak, nonatomic) IBOutlet UITextField *foodPrice;
@property (weak, nonatomic) IBOutlet UITextField *foodCalorie;
@property (weak, nonatomic) IBOutlet UITextField *foodSize;
@property (weak, nonatomic) IBOutlet UITextField *foodIngredients;
@property (weak, nonatomic) IBOutlet UITextField *foodMadeInCountry;
@property (weak, nonatomic) id<FoodViewDelegate> delegate;

- (IBAction)doneButton:(UIButton *)sender;
- (IBAction)cancelButton:(UIButton *)sender;

@end
