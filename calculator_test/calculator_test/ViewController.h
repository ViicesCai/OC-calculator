//
//  ViewController.h
//  calculator_test
//
//  Created by fz500net on 2019/5/21.
//  Copyright © 2019 fz500net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// 定义按钮类型

// 数字按钮
@property(strong,nonatomic) UIButton *numUIButton_;
// 运算符按钮
@property(strong,nonatomic) UILabel *view_UILabel;

// 定义变量
@property(assign,nonatomic) double num1,num2;
@property(assign,nonatomic) NSString *str;
@property(assign,nonatomic) int x;
@end

