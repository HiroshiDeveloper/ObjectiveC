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

@interface DrinkViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *drinkId;
@property (weak, nonatomic) IBOutlet UITextField *drinkName;
@property (weak, nonatomic) IBOutlet UITextField *drinkPrice;
@property (weak, nonatomic) IBOutlet UITextField *drinkMadeInCountry;
@property (weak, nonatomic) IBOutlet UITextField *isDrinkDiet;
@property (weak, nonatomic) IBOutlet UITextField *drinkSize;
@property (weak, nonatomic) id<DrinkViewDelegate> delegate;

- (IBAction)doneButton:(UIButton *)sender;
- (IBAction)cancelButton:(UIButton *)sender;

@end
