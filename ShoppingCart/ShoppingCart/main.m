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
#import "ShoppingCart.h"

int main(int argc, const char * argv[]) {
    
    NSMutableArray<Product*>* list = [[NSMutableArray alloc] init];
    
    Drink* drink1 = [[Drink alloc] initWithAmount:3 productId:412 name:@"Pepsi" price:2 country:@"USA" diet:NO andSize:150];
    
    Drink* drink2 = [[Drink alloc] initWithAmount:1 productId:183 name:@"Ginger Zero" price:3 country:@"Canada" diet:YES andSize:200];
    
    [[ShoppingCart alloc] addList:list andProduct:drink1];
    [[ShoppingCart alloc] addList:list andProduct:drink2];
    
    
    return NSApplicationMain(argc, argv);
}
