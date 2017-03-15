//
//  ClothViewController.h
//  ShoppingCart2
//
//  Created by Hiroshi Tokutomi on 2017-03-11.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "ClothTableViewCell.h"

@protocol ClothViewDelegate <NSObject>

-(void)addItem:(Product*)item;

@end

@interface ClothViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

//@property (weak, nonatomic) IBOutlet UITextField *clothId;
//@property (weak, nonatomic) IBOutlet UITextField *clothName;
//@property (weak, nonatomic) IBOutlet UITextField *clothPrice;
//@property (weak, nonatomic) IBOutlet UITextField *clothMadeInCountry;
//@property (weak, nonatomic) IBOutlet UITextField *materialName;
//@property (weak, nonatomic) IBOutlet UITextField *materialCode;
@property (weak, nonatomic) id<ClothViewDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITableView *clothTableView;


- (IBAction)cancelButton:(UIButton *)sender;
- (IBAction)doneButton:(UIButton *)sender;

@end
