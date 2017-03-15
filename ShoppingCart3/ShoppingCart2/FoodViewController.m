//
//  FoodViewController.m
//  ShoppingCart2
//
//  Created by Hiroshi Tokutomi on 2017-03-12.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "FoodViewController.h"
#import "Food.h"

@interface FoodViewController ()

@end

@implementation FoodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)doneButton:(UIButton *)sender {
    
    NSArray<NSString*>* ingredients = [[NSMutableArray<NSString*> alloc] init];
    ingredients = [self.foodIngredients.text componentsSeparatedByString:@","];
    
    Food* food = [[Food alloc] initWithAmount:1 productId:[self.foodId.text intValue] name:self.foodName.text price:[self.foodPrice.text intValue] country:self.foodMadeInCountry.text calorie:[self.foodCalorie.text intValue] size:[self.foodSize.text intValue] andIngredients:ingredients];
    
    [self.delegate addItem:food];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
