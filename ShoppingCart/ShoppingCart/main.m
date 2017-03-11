//
//  main.m
//  ShoppingCart
//
//  Created by Hiroshi Tokutomi on 2017-03-06.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Product.h"
#import "Drink.h"
#import "Food.h"
#import "Cloth.h"
#import "Material.h"
#import "ShoppingCart.h"

int main(int argc, const char * argv[]) {
    
    Drink* drink1 = [[Drink alloc] initWithAmount:3 productId:412 name:@"Pepsi" price:2 country:@"USA" diet:NO andSize:150];
    
    Drink* drink2 = [[Drink alloc] initWithAmount:1 productId:183 name:@"Ginger Zero" price:3 country:@"Canada" diet:YES andSize:200];
    
    Food* food1 = [[Food alloc] initWithAmount:2 productId:100 name:@"Chicken" price:8 country:@"Canada" calorie:350 size:4 andIngredients:[NSMutableArray arrayWithObjects:@"chicken", @"oil", @"chees", nil]];
    
    Food* food2 = [[Food alloc] initWithAmount:2 productId:101 name:@"Pasta" price:18 country:@"Canada" calorie:250 size:3 andIngredients:[NSMutableArray arrayWithObjects:@"pasta", @"meat", @"spinach", nil]];
    
    Material* material1 = [[Material alloc] initWithCode:10 andMaterial:@"cotton"];
    Material* material2 = [[Material alloc] initWithCode:11 andMaterial:@"nylon"];
    
    Cloth* cloth1 = [[Cloth alloc] initWithAmount:1 productId:701 name:@"T-shirt" price:15 country:@"China" andMaterials:[NSMutableArray arrayWithObjects:material1, material2, nil]];
    
    ShoppingCart* myshopping = [[ShoppingCart alloc] init];
    
    // add the products
    [myshopping addProduct:drink1];
    [myshopping addProduct:drink2];
    [myshopping addProduct:food1];
    [myshopping addProduct:food2];
    [myshopping addProduct:cloth1];
    
    // calculate the products
    [myshopping calculate];
    
    // print out
    [myshopping printOut];
    
    return NSApplicationMain(argc, argv);
}
