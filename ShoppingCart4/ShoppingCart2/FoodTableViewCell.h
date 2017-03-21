//
//  FoodTableViewCell.h
//  ShoppingCart3
//
//  Created by Hiroshi Tokutomi on 2017-03-15.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoodTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *foodId;
@property (weak, nonatomic) IBOutlet UITextField *foodName;
@property (weak, nonatomic) IBOutlet UITextField *foodPrice;
@property (weak, nonatomic) IBOutlet UITextField *foodMadeInCountry;
@property (weak, nonatomic) IBOutlet UITextField *foodCalorie;
@property (weak, nonatomic) IBOutlet UITextField *foodSize;
@property (weak, nonatomic) IBOutlet UITextField *foodIngredients;


@end
