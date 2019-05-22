//
//  ViewController.h
//  calculator_test
//
//  Created by fz500net on 2019/5/21.
//  Copyright © 2019 fz500net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// 定义全局视图
@property(strong,nonatomic) UILabel *viewUILabel;
// 定义变量
@property(assign,nonatomic) double num1,num2;
@property(retain,nonatomic) NSString *str;
@property(strong,nonatomic) NSMutableString *string;
@property(assign,nonatomic) int x;
@end

