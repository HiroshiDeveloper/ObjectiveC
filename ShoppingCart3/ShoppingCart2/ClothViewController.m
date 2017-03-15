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
#import "ClothTableViewCell.h"

@interface ClothViewController ()

@end

@implementation ClothViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.clothTableView.delegate = self;
    self.clothTableView.dataSource = self;
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
    
    // getCellDataRow
    // 1:clothId, 2:clothName, 3:clothPrice, 4:clothMadeInCountry
    // 5:clothMaterialsName, 6:clothMaterialsCode
    NSArray<NSString*>* code = [[self getCellDataRow:5] componentsSeparatedByString:@","];
    NSArray<NSString*>* name = [[self getCellDataRow:4]  componentsSeparatedByString:@","];
    if(code.count != name.count){
        return;
    }
    
    NSMutableArray<Material*>* materials = [[NSMutableArray<Material*> alloc] init];
    
    for(int i=0; i<code.count; i++){
        Material* material = [[Material alloc] initWithCode:[[code objectAtIndex:i] intValue]andMaterial:[name objectAtIndex:i]];
        [materials addObject:material];
    }
    
    Cloth* cloth = [[Cloth alloc] initWithAmount:1 productId:[[self getCellDataRow:0]  intValue] name:[self getCellDataRow:1]  price:[[self getCellDataRow:2]  intValue] country:[self getCellDataRow:3] andMaterials:materials];
    
    [self.delegate addItem:cloth];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(NSString*)getCellDataRow:(int)row
{
    ClothTableViewCell * cell = (ClothTableViewCell *)[self.clothTableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0]];
    NSString* data;
    switch(row){
        case 0:
            data = cell.clothId.text;
            break;
        case 1:
            data = cell.clothName.text;
            break;
        case 2:
            data = cell.clothPrice.text;
            break;
        case 3:
            data = cell.clothMadeInCountry.text;
            break;
        case 4:
            data = cell.materialName.text;
            break;
        case 5:
            data = cell.materialCode.text;
            break;
    }
    return data;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString* cellIdentifier;
    switch(indexPath.row){
        case 0:
            cellIdentifier = @"clothId";
            break;
        case 1:
            cellIdentifier = @"clothName";
            break;
        case 2:
            cellIdentifier = @"clothPrice";
            break;
        case 3:
            cellIdentifier = @"clothMadeInCountry";
            break;
        case 4:
            cellIdentifier = @"clothMaterialsName";
            break;
        case 5:
            cellIdentifier = @"clothMaterialsCode";
            break;
    }
    ClothTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if ( !cell ) {
        cell = [ClothTableViewCell new];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

@end
