//
//  ClothViewController.m
//  ShoppingCart2
//
//  Created by Hiroshi Tokutomi on 2017-03-11.
//  Copyright © 2017 Hiroshi. All rights reserved.
//

#import "ClothViewController.h"
#import "Cloth.h"
#import "Material.h"

@interface ClothViewController ()

@end

@implementation ClothViewController

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

- (IBAction)cancelButton:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)doneButton:(UIButton *)sender {
    
    NSArray<NSString*>* code = [self.materialCode.text componentsSeparatedByString:@","];
    NSArray<NSString*>* name = [self.materialName.text componentsSeparatedByString:@","];
    if(code.count != name.count){
        return;
    }
    
    NSMutableArray<Material*>* materials = [[NSMutableArray<Material*> alloc] init];
    
    for(int i=0; i<code.count; i++){
        Material* material = [[Material alloc] initWithCode:[[code objectAtIndex:i] intValue]andMaterial:[name objectAtIndex:i]];
        [materials addObject:material];
    }
    Cloth* cloth = [[Cloth alloc] initWithAmount:1 productId:[self.clothId.text intValue] name:self.clothName.text price:[self.clothPrice.text intValue] country:self.clothMadeInCountry.text andMaterials:materials];
    
    [self.delegate addItem:cloth];
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
