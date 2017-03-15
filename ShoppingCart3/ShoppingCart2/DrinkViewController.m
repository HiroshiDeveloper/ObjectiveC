//
//  DrinkViewController.m
//  ShoppingCart2
//
//  Created by Hiroshi Tokutomi on 2017-03-12.
//  Copyright © 2017 Hiroshi. All rights reserved.
//  test
//

#import "DrinkViewController.h"
#import "Drink.h"

@interface DrinkViewController ()

@end
@implementation DrinkViewController

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
    if(![self.isDrinkDiet.text isEqualToString:@"YES"] || [self.isDrinkDiet.text isEqualToString:@"NO"])
    {
        return;
    }
    Drink* drink = [[Drink alloc] initWithAmount:1 productId:[self.drinkId.text intValue] name:self.drinkName.text price:[self.drinkPrice.text intValue] country:self.drinkMadeInCountry.text diet:self.isDrinkDiet.text andSize:[self.drinkSize.text intValue]];
    [self.delegate addItem:drink];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
