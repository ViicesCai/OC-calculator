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
    // 注意点：如果在viewController 定义了viewUILabel就不必在这里重复声明
    _viewUILabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 30, 220, 30)];
    // 默认显示0
    _viewUILabel.text = @"0";
    // 设置背景颜色为黑
    _viewUILabel.textColor = [UIColor blackColor];
    // 定义显示的背景颜色为绿
    _viewUILabel.backgroundColor = [UIColor greenColor];
    // 文本格式向右对齐
    _viewUILabel.textAlignment = NSTextAlignmentRight;
    // 字体大小
    _viewUILabel.font = [UIFont systemFontOfSize:35];
    // ***添加入视图 无此语句此段定义代码无效：必要
    [self.view addSubview:_viewUILabel];
    
    // 创建数字1按钮
    UIButton *numUIButton1 = [UIButton buttonWithType:UIButtonTypeCustom];
    // 定义按钮格式
    numUIButton1.frame = CGRectMake(20, 80, 40, 40);
    // 按钮默认状态显示1
    [numUIButton1 setTitle:@"1" forState:UIControlStateNormal];
    // 定义按钮颜色
    numUIButton1.backgroundColor = [UIColor blueColor];
    // tag标签，通过定义此属性获取该按钮的值
    numUIButton1.tag = 1;
    // 按钮被点击时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton1 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    // 重要*
    [self.view addSubview:numUIButton1];
    
    // 创建数字2按钮
    UIButton *numUIButton2 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton2.frame = CGRectMake(80, 80, 40, 40);
    // 按钮默认状态显示2
    [numUIButton2 setTitle:@"2" forState:UIControlStateNormal];
    numUIButton2.backgroundColor = [UIColor blueColor];
    numUIButton2.tag = 2;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton2 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton2];
    
    // 创建数字3按钮
    UIButton *numUIButton3 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton3.frame = CGRectMake(140, 80, 40, 40);
    // 按钮默认状态显示3
    [numUIButton3 setTitle:@"3" forState:UIControlStateNormal];
    numUIButton3.backgroundColor = [UIColor blueColor];
    numUIButton3.tag = 3;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton3 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton3];
    
    // 创建数字4按钮
    UIButton *numUIButton4 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton4.frame = CGRectMake(20, 140, 40, 40);
    // 按钮默认状态显示4
    [numUIButton4 setTitle:@"4" forState:UIControlStateNormal];
    numUIButton4.backgroundColor = [UIColor blueColor];
    numUIButton4.tag = 4;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton4 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton4];
    
    // 创建数字5按钮
    UIButton *numUIButton5 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton5.frame = CGRectMake(80, 140, 40, 40);
    // 按钮默认状态显示5
    [numUIButton5 setTitle:@"5" forState:UIControlStateNormal];
    numUIButton5.backgroundColor = [UIColor blueColor];
    numUIButton5.tag = 5;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton5 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton5];
    
    // 创建数字6按钮
    UIButton *numUIButton6 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton6.frame = CGRectMake(140, 140, 40, 40);
    // 按钮默认状态显示6
    [numUIButton6 setTitle:@"6" forState:UIControlStateNormal];
    numUIButton6.backgroundColor = [UIColor blueColor];
    numUIButton6.tag = 6;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton6 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton6];
    
    // 创建数字7按钮
    UIButton *numUIButton7 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton7.frame = CGRectMake(20, 200, 40, 40);
    // 按钮默认状态显示7
    [numUIButton7 setTitle:@"7" forState:UIControlStateNormal];
    numUIButton7.backgroundColor = [UIColor blueColor];
    numUIButton7.tag = 7;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton7 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton7];

    // 创建数字8按钮
    UIButton *numUIButton8 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton8.frame = CGRectMake(80, 200, 40, 40);
    // 按钮默认状态显示8
    [numUIButton8 setTitle:@"8" forState:UIControlStateNormal];
    numUIButton8.backgroundColor = [UIColor blueColor];
    numUIButton8.tag = 8;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton8 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton8];

    // 创建数字9按钮
    UIButton *numUIButton9 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton9.frame = CGRectMake(140, 200, 40, 40);
    // 按钮默认状态显示9
    [numUIButton9 setTitle:@"9" forState:UIControlStateNormal];
    numUIButton9.backgroundColor = [UIColor blueColor];
    numUIButton9.tag = 9;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton9 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton9];
    
    // 创建数字0按钮
    UIButton *numUIButton0 = [UIButton buttonWithType:UIButtonTypeCustom];
    numUIButton0.frame = CGRectMake(20, 260, 100, 40);
    // 按钮默认状态显示0
    [numUIButton0 setTitle:@"0" forState:UIControlStateNormal];
    numUIButton0.backgroundColor = [UIColor blueColor];
    numUIButton0.tag = 0;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [numUIButton0 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:numUIButton0];
    
    // 创建➕号
    UIButton *nameUIButtonPlus = [UIButton buttonWithType:UIButtonTypeCustom];
    nameUIButtonPlus.frame = CGRectMake(200, 140, 40, 40);
    // 按钮默认状态显示+
    [nameUIButtonPlus setTitle:@"+" forState:UIControlStateNormal];
    nameUIButtonPlus.backgroundColor = [UIColor grayColor];
    // 增加了一个判断标签通过判断数值对应相应的运算符
    // 与数字按键的想法相同，通过101来标示 +号
    nameUIButtonPlus.tag = 101;
    [nameUIButtonPlus addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nameUIButtonPlus];
    
    // 创建➖号
    UIButton *nameUIButtonMinus = [UIButton buttonWithType:UIButtonTypeCustom];
    nameUIButtonMinus.frame = CGRectMake(200, 200, 40, 40);
    // 按钮默认状态显示-
    [nameUIButtonMinus setTitle:@"-" forState:UIControlStateNormal];
    nameUIButtonMinus.backgroundColor = [UIColor grayColor];
    nameUIButtonMinus.tag = 102;
    [nameUIButtonMinus addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nameUIButtonMinus];
    
    // 创建✖️号
    UIButton *nameUIButtonMultiple = [UIButton buttonWithType:UIButtonTypeCustom];
    nameUIButtonMultiple.frame = CGRectMake(200, 80, 40, 40);
    [nameUIButtonMultiple setTitle:@"✖️" forState:UIControlStateNormal];
    nameUIButtonMultiple.backgroundColor = [UIColor grayColor];
    nameUIButtonMultiple.tag = 103;
    [nameUIButtonMultiple addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nameUIButtonMultiple];
    
    // 创建➗号
    UIButton *nameUIButtonDivide = [UIButton buttonWithType:UIButtonTypeCustom];
    nameUIButtonDivide.frame = CGRectMake(200, 260, 40, 40);
    [nameUIButtonDivide setTitle:@"➗" forState:UIControlStateNormal];
    nameUIButtonDivide.backgroundColor = [UIColor grayColor];
    nameUIButtonDivide.tag = 104;
    [nameUIButtonDivide addTarget:self action:@selector(Click:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nameUIButtonDivide];
    
    // 创建=号
    UIButton *nameUIButtonEqual = [UIButton buttonWithType:UIButtonTypeCustom];
    nameUIButtonEqual.frame = CGRectMake(140, 260, 40, 40);
    [nameUIButtonEqual setTitle:@"=" forState:UIControlStateNormal];
    nameUIButtonEqual.backgroundColor = [UIColor grayColor];
    [nameUIButtonEqual addTarget:self action:@selector(equal) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nameUIButtonEqual];
    
}

// 功能未完善
/**
 逻辑：    1.由button的行为名链接d到此,🌟这里建议UIButton不用声明成全局变量（因为每个button都是一个个体，
            我们通过每一个按钮来区分其功能，一个是数字按键，一个是运算符，在外观上要能区分，功能上也要能区分。因此，并不需要生成一个全局的变量。我们需要一个个独立的控制并定义）
            2.这里的UILabel格外的重要，_和self需要明白各自的含义，_引用一个全局变量，self引用一个局部变量。
            3.当用户开始操作时，先进行判断。最外层的if判断是为了_str，他的目的是用来判断用户输入的，当用户输入的第一个值是0的话，
                显示屏上没必要出现两个。
            4.switch循环 通过在button上定义的tag标签来判断每一个按钮的功能
            5.进入cash分支的第一个判断确认用户输入的第一个值不是0，然后才进行多个数值重复输入的功能。
            6.把最终生成的代码实例成一个double型，这个num1就代表了用户输入的第一个数。
            注.难点：字符串的插入，button的时间定义以及如何获取button的值

 **/
-(void)onClick:(UIButton *)numUIButton{
    if (![self.str isEqualToString:@""]){
        _str = @"0";
        switch (numUIButton.tag) {
                
            case 1:
                if(_viewUILabel.text == self.str){
                    self.string = [NSMutableString stringWithFormat:@"1"];
                    _viewUILabel.text = [NSString stringWithFormat:@"%@",self.string];
                }else{
                    /**
                     这些被注释掉的代码很有必要看，对于一个noob来说这很基础也很有启发。他决定了你计算器数字的排列方式。
                     这个代码的功能是在字符串之后插入一个字符串，我一开始是分开定义。
                     如果分开定义会导致，你的_string变量有一个“1”的可变变量，
                     // [_string appendString:_viewUILabel.text];这句话逻辑上理解是 _viewUILable.txt这个变量之后插入“1”，好像挺符合逻辑的，
                     其实不然，你的_string变量在今入cash之前就被重新赋值了，因此你变成一只在“1”后面插入字符串
                     举个理解 当前_viewUILable显示的是123,这是你在计算器上按1 最终新生成的数字是反过来的 变成了1123.
                     :)
                     **/
                    // _string = [NSMutableString stringWithFormat:@"1"];
                    // [_string appendString:_viewUILabel.text];
                    // [_string appendFormat:@"%@",_viewUILabel.text];
                    // [_string stringByAppendingString:_viewUILabel.text];
                    // [_string stringByAppendingFormat:@"%@",_viewUILable.text];
                    [self.string appendString:[NSMutableString stringWithFormat:@"1"]];
                    _viewUILabel.text = [NSString stringWithString:self.string];
                }
                _num1 = [self.string doubleValue];
                break;
                
            case 2:
                if (_viewUILabel.text == self.str) {
                    self.string = [NSMutableString stringWithFormat:@"2"];
                    _viewUILabel.text = [NSString stringWithFormat:@"%@",self.string];
                }else{
                    [self.string appendString:[NSMutableString stringWithFormat:@"2"]];
                    _viewUILabel.text = [NSString stringWithString:self.string];
                }
                _num1 = [self.string doubleValue];
                break;
                
            case 3:
                if (_viewUILabel.text == self.str) {
                    self.string = [NSMutableString stringWithFormat:@"3"];
                    _viewUILabel.text = [NSString stringWithFormat:@"%@",self.string];
                }else{
                    [self.string appendString:[NSMutableString stringWithFormat:@"3"]];
                    _viewUILabel.text = [NSString stringWithString:self.string];
                }
                _num1 = [self.string doubleValue];
                break;
                
            case 4:
                if (_viewUILabel.text == self.str) {
                    self.string = [NSMutableString stringWithFormat:@"4"];
                    _viewUILabel.text = [NSString stringWithFormat:@"%@",self.string];
                }else{
                    [self.string appendString:[NSMutableString stringWithFormat:@"4"]];
                    _viewUILabel.text = [NSString stringWithString:self.string];
                }
                _num1 = [self.string doubleValue];
                break;
                
            case 5:
                if (_viewUILabel.text == self.str) {
                    self.string = [NSMutableString stringWithFormat:@"5"];
                    _viewUILabel.text = [NSString stringWithFormat:@"%@",self.string];
                }else{
                    [self.string appendString:[NSMutableString stringWithFormat:@"5"]];
                    _viewUILabel.text = [NSString stringWithString:self.string];
                }
                _num1 = [self.string doubleValue];
                break;
                
            case 6:
                if (_viewUILabel.text == self.str) {
                    self.string = [NSMutableString stringWithFormat:@"6"];
                    _viewUILabel.text = [NSString stringWithFormat:@"%@",self.string];
                }else{
                    [self.string appendString:[NSMutableString stringWithFormat:@"6"]];
                    _viewUILabel.text = [NSString stringWithString:self.string];
                }
                _num1 = [self.string doubleValue];
                break;
                
            case 7:
                if (_viewUILabel.text == self.str) {
                    self.string = [NSMutableString stringWithFormat:@"7"];
                    _viewUILabel.text = [NSString stringWithFormat:@"%@",self.string];
                }else{
                    [_string appendString:[NSMutableString stringWithFormat:@"7"]];
                    _viewUILabel.text = [NSString stringWithString:self.string];
                }
                _num1 = [self.string doubleValue];
                break;
                
            case 8:
                if (_viewUILabel.text == self.str) {
                    self.string = [NSMutableString stringWithFormat:@"8"];
                    _viewUILabel.text = [NSString stringWithFormat:@"%@",self.string];
                }else{
                    [self.string appendString:[NSMutableString stringWithFormat:@"8"]];
                    _viewUILabel.text = [NSString stringWithString:self.string];
                }
                _num1 = [self.string doubleValue];
                break;
                
            case 9:
                if (_viewUILabel.text == self.str) {
                    self.string = [NSMutableString stringWithFormat:@"9"];
                    _viewUILabel.text = [NSString stringWithFormat:@"%@",self.string];
                }else{
                    [self.string appendString:[NSMutableString stringWithFormat:@"9"]];
                    _viewUILabel.text = [NSString stringWithString:self.string];
                }
                _num1 = [self.string doubleValue];
                break;
                
            case 0:
                if (_viewUILabel.text == self.str) {
                    self.string = [NSMutableString stringWithFormat:@"0"];
                    _viewUILabel.text = [NSString stringWithFormat:@"%@",self.string];
                }else{
                    [self.string appendString:[NSMutableString stringWithFormat:@"0"]];
                    _viewUILabel.text = [NSString stringWithString:self.string];
                }
                _num1 = [self.string doubleValue];
                break;
                
            default:
                break;
        }
    }
}
    
    // 运算符按钮链接到该行为
    /** 逻辑：同样的通过switch循环来判断
     定义了一个整型变量来作为标识符，然后把之前_num1的值赋给_num2 在像页面输出对应的运算符号。
     **/
    -(void)Click:(UIButton *)nameUIButton
    {
        switch (nameUIButton.tag)
        {
                
            case 101:
                _x = 1;
                _num2 = _num1;
                _viewUILabel.text = @"+";
                break;
                
            case 102:
                _x = 2;
                _num2 = _num1;
                _viewUILabel.text = @"-";
                break;
                
            case 103:
                _x = 3;
                _num2 = _num1;
                _viewUILabel.text = @"*";
                break;
                
            case 104:
                _x = 4;
                _num2 = _num1;
                _viewUILabel.text = @"/";
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
        _viewUILabel.text = [NSString stringWithFormat:@"%f",(_num2 + _num1)];
    }
    if(_x == 2)
    {
        _viewUILabel.text = [NSString stringWithFormat:@"%f",(_num2 - _num1)];
    }
    if(_x == 3)
    {
        _viewUILabel.text = [NSString stringWithFormat:@"%f",(_num2 * _num1)];
    }
    if(_x == 4)
    {
        _viewUILabel.text = [NSString stringWithFormat:@"%f",(_num2 / _num1)];
    }
    
}
    
@end
