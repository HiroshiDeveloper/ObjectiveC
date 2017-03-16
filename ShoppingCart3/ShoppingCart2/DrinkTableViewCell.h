//
//  DrinkTableViewCell.h
//  ShoppingCart3
//
//  Created by Hiroshi Tokutomi on 2017-03-15.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrinkTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *drinkId;
@property (weak, nonatomic) IBOutlet UITextField *drinkName;
@property (weak, nonatomic) IBOutlet UITextField *drinkPrice;
@property (weak, nonatomic) IBOutlet UITextField *drinkMadeInCountry;
@property (weak, nonatomic) IBOutlet UITextField *isDrinkDiet;
@property (weak, nonatomic) IBOutlet UITextField *drinkSize;

@end
