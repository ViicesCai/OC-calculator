//
//  ViewController.h
//  calculator_test
//
//  Created by fz500net on 2019/5/21.
//  Copyright © 2019 fz500net. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

// 定义Label 用来当作计算器的显示屏幕
@property(strong,nonatomic) UILabel *viewLabel;
// 定义两个双精度的值用来存放用户输入的数值
@property(assign,nonatomic) double num1,num2;
// str是一个控制变量
@property(retain,nonatomic) NSString *str;
// string是一个可变字符串，他被用来临时存放用户的输入值
@property(strong,nonatomic) NSMutableString *string;
// x是一个标记，用来区分运算符号
@property(assign,nonatomic) int x;
// chartString定义了各种我们不希望他出现在字符串中的特殊符号
@property(strong,nonatomic) NSCharacterSet *chartString;
@end

