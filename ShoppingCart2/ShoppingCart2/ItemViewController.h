//
//  ItemViewController.h
//  ShoppingCart2
//
//  Created by Hiroshi Tokutomi on 2017-03-13.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *itemTableView;
@property (strong, nonatomic) NSMutableArray<NSString*>* items;

- (IBAction)cancelButton:(UIButton *)sender;

@end
