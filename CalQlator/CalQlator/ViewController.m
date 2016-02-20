//
//  ViewController.m
//  CalQlator
//
//  Created by Hiroshi on 2/17/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSString *tmp;
NSNumber *tmpA;
NSInteger type = 0;
UILabel *result;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // call the function
    [self createScreen];
}

- (void)createScreen
{
    // get the size and position of window
    CGRect bounds = self.view.bounds;
    
    // get the size of button
    CGFloat size = bounds.size.width * 0.2025;
    
    CGFloat defaultX = bounds.size.width * 0.05;
    CGFloat space = bounds.size.width * 0.03;
    
    NSDictionary *dicNumber =
    @{
      @0 : @[@"1", @"2", @"3", @"+"],
      @1 : @[@"4", @"5", @"6", @"-"],
      @2 : @[@"7", @"8", @"9", @"*"],
      @3 : @[@"C", @"0", @"=", @"/"],
    };
    
    CGFloat defaultY = bounds.size.height - size * 4 - space * 4;
    
    // create result label
    result = [[UILabel alloc]init];
    result.frame = CGRectMake(defaultX, defaultY - defaultY/2, bounds.size.width, 50);
    result.text=@"Type Number";
    result.font=[UIFont fontWithName:@"Helvetica" size:30 ];
    [self.view addSubview:result];
    
    // create buttons
    for (int row=0; row<dicNumber.count; row++)
    {
        // get the row position
        CGFloat yPos = defaultY + size * row + space * row;
        
        NSArray *arrNumber = [dicNumber objectForKey:[NSNumber numberWithInt:row]];
        for (int colum=0; colum<arrNumber.count; colum++)
        {
            UIColor *color = colum == 3?
                [UIColor colorWithRed:226.0/255.0 green:238.0/255.0 blue:67.0/255.0 alpha:1.0] :
                [UIColor colorWithRed:232.0/255.0 green:233.0/255.0 blue:219.0/255.0 alpha:1.0];
            
            [self createButtonWithTitle:arrNumber[colum] frame:CGRectMake(defaultX + size * colum + space * colum, yPos, size, size) andBackgroundColor:color];
        }
    }
}

- (void)createButtonWithTitle:(NSString *)title frame:(CGRect)frame andBackgroundColor:(UIColor *)color
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    button.backgroundColor = color;
    button.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [button setTitle:title forState:UIControlStateNormal];
    
    // UIControlEventTouchUpInside : if user press the button, the event will be implemented
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)onClick:(UIButton *)sender
{
    NSRange match = [sender.titleLabel.text rangeOfString:@"^[0-9]+$" options:NSRegularExpressionSearch];
    if (match.location != NSNotFound)
    {
        NSNumber *num = [NSNumber numberWithInteger:[sender.titleLabel.text integerValue]];
        if(![num isEqual:@(0)])
        {
            tmp = sender.titleLabel.text;
        }
        else if(tmp != nil)
        {
            tmp = [NSString stringWithFormat:@"%@%@", tmp, num];
        }
        result.text = tmp;
    }
    else if ([sender.titleLabel.text isEqual:@"+"] || [sender.titleLabel.text isEqual:@"-"] || [sender.titleLabel.text isEqual:@"*"] || [sender.titleLabel.text isEqual:@"/"])
    {
        tmpA = [NSNumber numberWithInteger: [tmp integerValue]];
        tmp = nil;
        result.text = @"";
        if ([sender.titleLabel.text isEqual:@"+"])
        {
            type = 1;
        }else if ([sender.titleLabel.text isEqual:@"-"])
        {
            type = 2;
        }else if ([sender.titleLabel.text isEqual:@"*"])
        {
            type = 3;
        }else if ([sender.titleLabel.text isEqual:@"/"])
        {
            type = 4;
        }
        NSLog(@"%@",tmpA);
    }
    else if ([sender.titleLabel.text isEqual:@"="])
    {
        NSNumber *resultNum;
        NSNumber *tmpB;
        if(!type == 0 && tmp != nil)
        {
            tmpB = [NSNumber numberWithInteger: [tmp integerValue]];
            switch (type)
            {
                case 1:
                    resultNum = [NSNumber numberWithFloat:([tmpA floatValue] + [tmpB floatValue])];
                    break;
                case 2:
                    resultNum = [NSNumber numberWithFloat:([tmpA floatValue] - [tmpB floatValue])];
                    break;
                case 3:
                    resultNum = [NSNumber numberWithFloat:([tmpA floatValue] * [tmpB floatValue])];
                    break;
                case 4:
                    resultNum = [NSNumber numberWithFloat:([tmpA floatValue] / [tmpB floatValue])];
                    break;
            }
            result.text = [NSString stringWithFormat:@"%@", resultNum];
            tmp = [NSString stringWithFormat:@"%@", resultNum];
        }
    }
    else if ([sender.titleLabel.text isEqual:@"C"])
    {
        type = 0;
        tmp = nil;
        result.text = @"Type Number";
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
