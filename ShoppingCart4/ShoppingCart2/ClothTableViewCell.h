//
//  ClothTableViewCell.h
//  ShoppingCart3
//
//  Created by Hiroshi Tokutomi on 2017-03-15.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClothTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *clothId;
@property (weak, nonatomic) IBOutlet UITextField *clothName;
@property (weak, nonatomic) IBOutlet UITextField *clothPrice;
@property (weak, nonatomic) IBOutlet UITextField *clothMadeInCountry;
@property (weak, nonatomic) IBOutlet UITextField *materialName;
@property (weak, nonatomic) IBOutlet UITextField *materialCode;

@end
