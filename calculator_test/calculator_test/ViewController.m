//
//  ViewController.m
//  calculator_test
//
//  Created by fz500net on 2019/5/21.
//  Copyright © 2019 fz500net. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// 此行为内可以创建按钮并定义格式（在此加入特效）
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 创建UILabel对象定义大小格式
    UILabel *view_UILabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 220, 30)];
    // 默认显示0
    view_UILabel.text = @"0";
    // 设置背景颜色为黑
    view_UILabel.textColor = [UIColor blackColor];
    // 定义显示的背景颜色为绿
    view_UILabel.backgroundColor = [UIColor greenColor];
    // 文本格式向右对齐
    view_UILabel.textAlignment = NSTextAlignmentRight;
    // 字体大小
    view_UILabel.font = [UIFont systemFontOfSize:35];
    // ***添加入视图 无此语句此段定义代码无效：必要
    [self.view addSubview:view_UILabel];
    
    // 创建数字1按钮
    UIButton *numUIButton_1 = [UIButton buttonWithType:UIButtonTypeCustom];
    // 定义按钮格式
    numUIButton_1.frame = CGRectMake(20, 80, 40, 40);
    // 按钮默认状态显示1
    [numUIButton_1 setTitle:@"1" forState:UIControlStateNormal];
    // 定义按钮颜色
    numUIButton_1.backgroundColor = [UIColor blueColor];
    // tag标签，通过定义此属性获取该按钮的值
    numUIButton_1.tag = 1;
    // 按钮被点击时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton_1 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    // 重要*
    [self.view addSubview:numUIButton_1];
    
    // 创建数字2按钮
    UIButton *numUIButton_2 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton_2.frame = CGRectMake(80, 80, 40, 40);
    // 按钮默认状态显示2
    [numUIButton_2 setTitle:@"2" forState:UIControlStateNormal];
    numUIButton_2.backgroundColor = [UIColor blueColor];
    numUIButton_2.tag = 2;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton_2 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton_2];
    
    // 创建数字3按钮
    UIButton *numUIButton_3 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton_3.frame = CGRectMake(140, 80, 40, 40);
    // 按钮默认状态显示3
    [numUIButton_3 setTitle:@"3" forState:UIControlStateNormal];
    numUIButton_3.backgroundColor = [UIColor blueColor];
    numUIButton_3.tag = 3;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton_3 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton_3];
    
    // 创建数字4按钮
    UIButton *numUIButton_4 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton_4.frame = CGRectMake(20, 140, 40, 40);
    // 按钮默认状态显示4
    [numUIButton_4 setTitle:@"4" forState:UIControlStateNormal];
    numUIButton_4.backgroundColor = [UIColor blueColor];
    numUIButton_4.tag = 4;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton_4 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton_4];
    
    // 创建数字5按钮
    UIButton *numUIButton_5 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton_5.frame = CGRectMake(80, 140, 40, 40);
    // 按钮默认状态显示5
    [numUIButton_5 setTitle:@"5" forState:UIControlStateNormal];
    numUIButton_5.backgroundColor = [UIColor blueColor];
    numUIButton_5.tag = 5;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton_5 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton_5];
    
    // 创建数字6按钮
    UIButton *numUIButton_6 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton_6.frame = CGRectMake(140, 140, 40, 40);
    // 按钮默认状态显示6
    [numUIButton_6 setTitle:@"6" forState:UIControlStateNormal];
    numUIButton_6.backgroundColor = [UIColor blueColor];
    numUIButton_6.tag = 6;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton_6 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton_6];
    
    // 创建数字7按钮
    UIButton *numUIButton_7 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton_7.frame = CGRectMake(20, 200, 40, 40);
    // 按钮默认状态显示7
    [numUIButton_7 setTitle:@"7" forState:UIControlStateNormal];
    numUIButton_7.backgroundColor = [UIColor blueColor];
    numUIButton_7.tag = 7;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton_7 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton_7];

    // 创建数字8按钮
    UIButton *numUIButton_8 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton_8.frame = CGRectMake(80, 200, 40, 40);
    // 按钮默认状态显示8
    [numUIButton_8 setTitle:@"8" forState:UIControlStateNormal];
    numUIButton_8.backgroundColor = [UIColor blueColor];
    numUIButton_8.tag = 8;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton_8 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton_8];

    // 创建数字9按钮
    UIButton *numUIButton_9 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton_9.frame = CGRectMake(140, 200, 40, 40);
    // 按钮默认状态显示9
    [numUIButton_9 setTitle:@"9" forState:UIControlStateNormal];
    numUIButton_9.backgroundColor = [UIColor blueColor];
    numUIButton_9.tag = 9;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton_9 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton_9];
    
    // 创建数字0按钮
    UIButton *numUIButton_0 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton_0.frame = CGRectMake(20, 260, 100, 40);
    // 按钮默认状态显示0
    [numUIButton_0 setTitle:@"0" forState:UIControlStateNormal];
    numUIButton_0.backgroundColor = [UIColor blueColor];
    numUIButton_0.tag = 0;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton_0 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton_0];
    
    // 创建➕号
    UIButton *nameUIButton_plus = [UIButton buttonWithType:UIButtonTypeCustom];
    nameUIButton_plus.frame = CGRectMake(200, 140, 40, 40);
    // 按钮默认状态显示+
    [nameUIButton_plus setTitle:@"+" forState:UIControlStateNormal];
    nameUIButton_plus.backgroundColor = [UIColor grayColor];
    // 增加了一个判断标签通过判断数值对应相应的运算符
    // 与数字按键的想法相同，通过101来标示 +号
    nameUIButton_plus.tag = 101;
    [nameUIButton_plus addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nameUIButton_plus];
    
    // 创建➖号
    UIButton *nameUIButton_minus = [UIButton buttonWithType:UIButtonTypeCustom];
    nameUIButton_minus.frame = CGRectMake(200, 200, 40, 40);
    // 按钮默认状态显示-
    [nameUIButton_minus setTitle:@"-" forState:UIControlStateNormal];
    nameUIButton_minus.backgroundColor = [UIColor grayColor];
    nameUIButton_minus.tag = 102;
    [nameUIButton_minus addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nameUIButton_minus];
    
    // 创建✖️号
    UIButton *nameUIButton_multiple = [UIButton buttonWithType:UIButtonTypeCustom];
    nameUIButton_multiple.frame = CGRectMake(200, 80, 40, 40);
    [nameUIButton_multiple setTitle:@"✖️" forState:UIControlStateNormal];
    nameUIButton_multiple.backgroundColor = [UIColor grayColor];
    nameUIButton_multiple.tag = 103;
    [nameUIButton_multiple addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nameUIButton_multiple];
    
    // 创建➗号
    UIButton *nameUIButton_divide = [UIButton buttonWithType:UIButtonTypeCustom];
    nameUIButton_divide.frame = CGRectMake(200, 260, 40, 40);
    [nameUIButton_divide setTitle:@"➗" forState:UIControlStateNormal];
    nameUIButton_divide.backgroundColor = [UIColor grayColor];
    nameUIButton_divide.tag = 104;
    [nameUIButton_divide addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nameUIButton_divide];
    
    // 创建=号
    UIButton *nameUIButton_equal = [UIButton buttonWithType:UIButtonTypeCustom];
    nameUIButton_equal.frame = CGRectMake(140, 260, 40, 40);
    [nameUIButton_equal setTitle:@"=" forState:UIControlStateNormal];
    nameUIButton_equal.backgroundColor = [UIColor grayColor];
    [nameUIButton_equal addTarget:self action:@selector(equal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nameUIButton_equal];
    
}

// 未成功实现
/**
 逻辑：通过点击按钮链接到此行为，通过tag获取该按钮的值，并进入switc循环，
      先把对应的数值传给显示器，然后转成double型 赋给num1（表示第一个数）
 **/
-(void)onClick:(UIButton *)numUIButton_{
    switch (numUIButton_.tag) {
        case 1:
            _str = @"1";
            _view_UILabel.text = _str;
            _num1 = [_str doubleValue];
            break;
            
        case 2:
            _str = @"2";
            _view_UILabel.text = [NSString stringWithFormat:@"%@",_str];
            _num1 = [_str doubleValue];
            break;
            
        case 3:
            _str = @"3";
            _view_UILabel.text = [NSString stringWithFormat:@"%@",_str];
            _num1 = [_str doubleValue];
            break;
            
        case 4:
            _str = @"4";
            _view_UILabel.text = [NSString stringWithFormat:@"%@",_str];
            _num1 = [_str doubleValue];
            break;
            
        case 5:
            _str = @"5";
            _view_UILabel.text = [NSString stringWithFormat:@"%@",_str];
            _num1 = [_str doubleValue];
            break;
            
        case 6:
            _str = @"6";
            _view_UILabel.text = [NSString stringWithFormat:@"%@",_str];
            _num1 = [_str doubleValue];
            break;
            
        case 7:
            _str = @"7";
            _view_UILabel.text = [NSString stringWithFormat:@"%@",_str];
            _num1 = [_str doubleValue];
            break;
            
        case 8:
            _str = @"8";
            _view_UILabel.text = [NSString stringWithFormat:@"%@",_str];
            _num1 = [_str intValue];
            break;
            
        case 9:
            _str = @"9";
            _view_UILabel.text = [NSString stringWithFormat:@"%@",_str];
            _num1 = [_str intValue];
            break;
            
        case 0:
            _str = @"0";
            _view_UILabel.text = [NSString stringWithFormat:@"%@",_str];
            _num1 = [_str intValue];
            break;
            
        default:
            break;
    }
}

// 运算符按钮链接到该行为
/** 逻辑：同样的通过switch循环来判断
        定义了一个整型变量来作为标识符，然后把之前_num1的值赋给_num2 在像页面输出对应的运算符号。
**/
-(void)Click:(UIButton *)nameUIButton_{
    switch (nameUIButton_.tag) {
            
        case 101:
            _x = 1;
            _num2 = _num1;
            _view_UILabel.text = @"+";
            break;
        
        case 102:
            _x = 2;
            _num2 = _num1;
            _view_UILabel.text = @"-";
            break;
            
        case 103:
            _x = 3;
            _num2 = _num1;
            _view_UILabel.text = @"*";
            break;
            
        case 104:
            _x = 4;
            _num2 = _num1;
            _view_UILabel.text = @"/";
            break;
        default:
            break;
    }
}

// 当用户按下等号时链接到此行为
/**
    通过先前定义的_x标识符进行对应的运算方法
    通过此前的交换 _num2为用户输入的第一个值，_num1为第二个
    然后把运算结果输出给显示器
 **/
-(void)equal{
    if(_x == 1)
    {
        _view_UILabel.text = [NSString stringWithFormat:@"%0.2f",(_num2 + _num1)];
    }
    if(_x == 2)
    {
        _view_UILabel.text = [NSString stringWithFormat:@"%0.2f",(_num2 - _num1)];
    }
    if(_x == 3)
    {
        _view_UILabel.text = [NSString stringWithFormat:@"%0.2f",(_num2 * _num1)];
    }
    if(_x == 4)
    {
        _view_UILabel.text = [NSString stringWithFormat:@"%0.2f",(_num2 / _num1)];
    }
}
    
@end
