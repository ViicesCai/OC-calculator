//
//  ViewController.m
//  calculator_test
//
//  Created by fz500net on 2019/5/21.
//  Copyright © 2019 fz500net. All rights reserved.
//

// UI还有部分运算逻辑还需要改善


#import "ViewController.h"
#import <math.h>

@interface ViewController ()
@end

@implementation ViewController
// 此行为内可以创建按钮并定义格式（在此加入特效）
- (void)viewDidLoad {
    [super viewDidLoad];
    // 定义计算器的显示屏幕
    // 注意点：应为我们在ViewController.h中已经声明了这个全局变量，所以在这里调用时要在变量名前加上 _
    _viewLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 340, 80)];
    // 计算器默认显示0
    _viewLabel.text = @"0";
    // 计算器默认用黑色字体输出
    _viewLabel.textColor = [UIColor blackColor];
    // 计算器的背景为绿色
    // _viewUILabel.backgroundColor = [UIColor greenColor];
    // 计算器的显示文本默认向右对齐
    _viewLabel.textAlignment = NSTextAlignmentRight;
    // 字体大小
    _viewLabel.font = [UIFont systemFontOfSize:65];
    // 把这个Label加入到视图中
    [self.view addSubview:_viewLabel];
    
     //---------------------------------------------------//
    //| 这里特意把定义的按键按照屏幕按键的顺序摆放，方便设置其位置 |//
   //---------------------------------------------------//
    
    // AC键
    
    // 创建一个UIButton
    UIButton *acUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    // 构造其大小和其在视图上的位置
    acUIButton.frame = CGRectMake(10, 190, 80, 80);
    // 构造按钮造型
    acUIButton.layer.cornerRadius = acUIButton.frame.size.height/2;
    // 按钮默认状态 显示
    [acUIButton setTitle:@"AC" forState:UIControlStateNormal];
    // 按钮背景颜色
    acUIButton.backgroundColor = [UIColor redColor];
    // 定义按钮的点击事件
    [acUIButton addTarget:self action:@selector(clickClearn) forControlEvents:UIControlEventTouchUpInside];
    // 按钮字体大小
    acUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    // 在视图上添加此按钮
    [self.view addSubview:acUIButton];
    
    // +/- 键
    UIButton *plusOrMinusButton = [UIButton buttonWithType:UIButtonTypeCustom];
    plusOrMinusButton.frame = CGRectMake(100, 190, 80, 80);
    plusOrMinusButton.layer.cornerRadius = plusOrMinusButton.frame.size.width/2;
    [plusOrMinusButton setTitle:@"+/-" forState:UIControlStateNormal];
    plusOrMinusButton.backgroundColor = [UIColor grayColor];
    [plusOrMinusButton addTarget:self action:@selector(clickPlusOrMinus) forControlEvents:UIControlEventTouchUpInside];
    plusOrMinusButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:plusOrMinusButton];
    
    // % 模运算
    UIButton *modUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    modUIButton.frame = CGRectMake(190, 190, 80, 80);
    modUIButton.layer.cornerRadius = modUIButton.frame.size.width/2;
    [modUIButton setTitle:@"%" forState:UIControlStateNormal];
    modUIButton.backgroundColor = [UIColor grayColor];
    modUIButton.tag = 105;
    [modUIButton addTarget:self action:@selector(clickOperation:) forControlEvents:UIControlEventTouchUpInside];
    modUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:modUIButton];
    
    // 创建➗号
    UIButton *divideUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    divideUIButton.frame = CGRectMake(280, 190, 80, 80);
    divideUIButton.layer.cornerRadius = divideUIButton.frame.size.width/2;
    [divideUIButton setTitle:@"÷" forState:UIControlStateNormal];
    divideUIButton.backgroundColor = [UIColor grayColor];
    divideUIButton.tag = 104;
    [divideUIButton addTarget:self action:@selector(clickOperation:) forControlEvents:UIControlEventTouchUpInside];
    divideUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:divideUIButton];
    
    
    // 创建数字7按钮
    UIButton *sevenUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sevenUIButton.frame = CGRectMake(10, 280, 80, 80);
    sevenUIButton.layer.cornerRadius = sevenUIButton.frame.size.width/2;
    // 定义按钮背景颜色
    sevenUIButton.backgroundColor = [UIColor blackColor];
    // 按钮默认状态显示7
    [sevenUIButton setTitle:@"7" forState:UIControlStateNormal];
    sevenUIButton.tag = 7;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [sevenUIButton addTarget:self action:@selector(clickNum:) forControlEvents:UIControlEventTouchUpInside];
    sevenUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:sevenUIButton];
    
    // 创建数字8按钮
    UIButton *eightUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    eightUIButton.frame = CGRectMake(100, 280, 80, 80);
    eightUIButton.layer.cornerRadius = eightUIButton.frame.size.width/2;
    // 定义按钮背景颜色
    eightUIButton.backgroundColor = [UIColor blackColor];
    // 按钮默认状态显示8
    [eightUIButton setTitle:@"8" forState:UIControlStateNormal];
    eightUIButton.tag = 8;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [eightUIButton addTarget:self action:@selector(clickNum:) forControlEvents:UIControlEventTouchUpInside];
    eightUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:eightUIButton];
    
    // 创建数字9按钮
    UIButton *nineUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    nineUIButton.frame = CGRectMake(190, 280, 80, 80);
    nineUIButton.layer.cornerRadius = nineUIButton.frame.size.width/2;
    // 定义按钮背景颜色
    nineUIButton.backgroundColor = [UIColor blackColor];
    // 按钮默认状态显示9
    [nineUIButton setTitle:@"9" forState:UIControlStateNormal];
    nineUIButton.tag = 9;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [nineUIButton addTarget:self action:@selector(clickNum:) forControlEvents:UIControlEventTouchUpInside];
    nineUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:nineUIButton];
    
    // 创建✖️号
    UIButton *multipleUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    multipleUIButton.frame = CGRectMake(280, 280, 80, 80);
    multipleUIButton.layer.cornerRadius = multipleUIButton.frame.size.width/2;
    [multipleUIButton setTitle:@"×" forState:UIControlStateNormal];
    multipleUIButton.backgroundColor = [UIColor grayColor];
    multipleUIButton.tag = 103;
    [multipleUIButton addTarget:self action:@selector(clickOperation:) forControlEvents:UIControlEventTouchUpInside];
    multipleUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:multipleUIButton];
    
    // 创建数字4按钮
    UIButton *fourUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    fourUIButton.frame = CGRectMake(10, 370, 80, 80);
    fourUIButton.layer.cornerRadius = fourUIButton.frame.size.width/2;
    // 定义按钮背景颜色
    fourUIButton.backgroundColor = [UIColor blackColor];
    // 按钮默认状态显示4
    [fourUIButton setTitle:@"4" forState:UIControlStateNormal];
    fourUIButton.tag = 4;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [fourUIButton addTarget:self action:@selector(clickNum:) forControlEvents:UIControlEventTouchUpInside];
    fourUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:fourUIButton];
    
    // 创建数字5按钮
    UIButton *fiveUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    fiveUIButton.frame = CGRectMake(100, 370, 80, 80);
    fiveUIButton.layer.cornerRadius = fiveUIButton.frame.size.width/2;
    // 定义按钮背景颜色
    fiveUIButton.backgroundColor = [UIColor blackColor];
    // 按钮默认状态显示5
    [fiveUIButton setTitle:@"5" forState:UIControlStateNormal];
    fiveUIButton.tag = 5;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [fiveUIButton addTarget:self action:@selector(clickNum:) forControlEvents:UIControlEventTouchUpInside];
    fiveUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:fiveUIButton];
    
    // 创建数字6按钮
    UIButton *sixUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sixUIButton.frame = CGRectMake(190, 370, 80, 80);
    sixUIButton.layer.cornerRadius = sixUIButton.frame.size.width/2;
    // 定义按钮背景颜色
    sixUIButton.backgroundColor = [UIColor blackColor];
    // 按钮默认状态显示6
    [sixUIButton setTitle:@"6" forState:UIControlStateNormal];
    sixUIButton.tag = 6;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [sixUIButton addTarget:self action:@selector(clickNum:) forControlEvents:UIControlEventTouchUpInside];
    sixUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:sixUIButton];
    
    // 创建➖号
    UIButton *minusUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    minusUIButton.frame = CGRectMake(280, 370, 80, 80);
    minusUIButton.layer.cornerRadius = minusUIButton.frame.size.width/2;
    // 按钮默认状态显示-
    [minusUIButton setTitle:@"-" forState:UIControlStateNormal];
    minusUIButton.backgroundColor = [UIColor grayColor];
    minusUIButton.tag = 102;
    [minusUIButton addTarget:self action:@selector(clickOperation:) forControlEvents:UIControlEventTouchUpInside];
    minusUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:minusUIButton];
    
    
    
    // 创建数字1按钮
    UIButton *oneUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    // 定义按钮格式
    oneUIButton.frame = CGRectMake(10, 460, 80, 80);
    // 定义按钮形状
    oneUIButton.layer.cornerRadius = oneUIButton.frame.size.width/2;
    // 按钮默认状态显示1
    [oneUIButton setTitle:@"1"forState:UIControlStateNormal];
    // 按钮字体默认颜色为黑
    [oneUIButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    // 设置按钮边框宽度
    [oneUIButton.layer setBorderWidth:2];
    // 定义按钮背景颜色
    oneUIButton.backgroundColor = [UIColor blackColor];
    // 定义字体颜色
    // tag标签，通过定义此属性获取该按钮的值
    oneUIButton.tag = 1;
    // 按钮被点击时触发按键事件（UIControlEventTouchUpInside）
    [oneUIButton addTarget:self action:@selector(clickNum:) forControlEvents:UIControlEventTouchUpInside];
    oneUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    // 重要*
    [self.view addSubview:oneUIButton];
    
    // 创建数字2按钮
    UIButton *twoUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    twoUIButton.frame = CGRectMake(100, 460, 80, 80);
    twoUIButton.layer.cornerRadius = twoUIButton.frame.size.width/2;
    // 定义按钮背景颜色
    twoUIButton.backgroundColor = [UIColor blackColor];
    // 按钮默认状态显示2
    [twoUIButton setTitle:@"2" forState:UIControlStateNormal];
    twoUIButton.tag = 2;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [twoUIButton addTarget:self action:@selector(clickNum:) forControlEvents:UIControlEventTouchUpInside];
    twoUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:twoUIButton];
    
    // 创建数字3按钮
    UIButton *threeUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    threeUIButton.frame = CGRectMake(190, 460, 80, 80);
    threeUIButton.layer.cornerRadius = threeUIButton.frame.size.width/2;
    // 定义按钮背景颜色
    threeUIButton.backgroundColor = [UIColor blackColor];
    // 按钮默认状态显示3
    [threeUIButton setTitle:@"3" forState:UIControlStateNormal];
    threeUIButton.tag = 3;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [threeUIButton addTarget:self action:@selector(clickNum:) forControlEvents:UIControlEventTouchUpInside];
    threeUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:threeUIButton];
    
    // 创建➕号
    UIButton *plusUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    plusUIButton.frame = CGRectMake(280, 460, 80,80);
    plusUIButton.layer.cornerRadius = plusUIButton.frame.size.width/2;
    // 按钮默认状态显示+
    [plusUIButton setTitle:@"+" forState:UIControlStateNormal];
    plusUIButton.backgroundColor = [UIColor grayColor];
    // 增加了一个判断标签通过判断数值对应相应的运算符
    // 与数字按键的想法相同，通过101来标示 +号
    plusUIButton.tag = 101;
    [plusUIButton addTarget:self action:@selector(clickOperation:) forControlEvents:UIControlEventTouchUpInside];
    plusUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:plusUIButton];
    
    
    // 创建数字0按钮
    UIButton *zeroUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    zeroUIButton.frame = CGRectMake(10, 550, 170, 80);
    zeroUIButton.layer.cornerRadius = zeroUIButton.frame.size.height/2;
    // 定义按钮背景颜色
    zeroUIButton.backgroundColor = [UIColor blackColor];
    // 按钮默认状态显示0
    [zeroUIButton setTitle:@"0" forState:UIControlStateNormal];
    zeroUIButton.backgroundColor = [UIColor blackColor];
    zeroUIButton.tag = 0;
    // 点击按钮时触发按键事件（UIControlEventTouchUpInside）
    [zeroUIButton addTarget:self action:@selector(clickNum:) forControlEvents:UIControlEventTouchUpInside];
    zeroUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:zeroUIButton];
    
    // 小数点键
    UIButton *pointUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pointUIButton.frame = CGRectMake(190, 550, 80, 80);
    pointUIButton.layer.cornerRadius = pointUIButton.frame.size.width/2;
    [pointUIButton setTitle:@"." forState:UIControlStateNormal];
    pointUIButton.backgroundColor = [UIColor grayColor];
    [pointUIButton addTarget:self action:@selector(clickPoint) forControlEvents:UIControlEventTouchUpInside];
    pointUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:pointUIButton];
    
    // 创建=号
    UIButton *equalUIButton = [UIButton buttonWithType:UIButtonTypeCustom];
    equalUIButton.frame = CGRectMake(280, 550, 80, 80);
    equalUIButton.layer.cornerRadius = equalUIButton.frame.size.width/2;
    [equalUIButton setTitle:@"=" forState:UIControlStateNormal];
    equalUIButton.backgroundColor = [UIColor grayColor];
    [equalUIButton addTarget:self action:@selector(clickEqual) forControlEvents:UIControlEventTouchUpInside];
    equalUIButton.titleLabel.font = [UIFont systemFontOfSize:40];
    [self.view addSubview:equalUIButton];

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
// 5-23 防止用户进行不规范操作，也应当增加一层判断：用户输入的第一个数为一个运算符号！
-(void)clickNum:(UIButton *)numUIButton{
        _str = @"0";
        if (![_viewLabel.text hasPrefix:@"."]) {
            switch (numUIButton.tag) {
                case 1:
                    if(_viewLabel.text == self.str){
                        self.string = [NSMutableString stringWithFormat:@"1"];
                        _viewLabel.text = [NSString stringWithFormat:@"%@",self.string];
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
                        _viewLabel.text = [NSString stringWithString:self.string];
                    }
                    _num1 = [self.string doubleValue];
                    break;
                    
                case 2:
                    if (_viewLabel.text == self.str) {
                        self.string = [NSMutableString stringWithFormat:@"2"];
                        _viewLabel.text = [NSString stringWithFormat:@"%@",self.string];
                    }else{
                        [self.string appendString:[NSMutableString stringWithFormat:@"2"]];
                        _viewLabel.text = [NSString stringWithString:self.string];
                    }
                    _num1 = [self.string doubleValue];
                    break;
                    
                case 3:
                    if (_viewLabel.text == self.str) {
                        self.string = [NSMutableString stringWithFormat:@"3"];
                        _viewLabel.text = [NSString stringWithFormat:@"%@",self.string];
                    }else{
                        [self.string appendString:[NSMutableString stringWithFormat:@"3"]];
                        _viewLabel.text = [NSString stringWithString:self.string];
                    }
                    _num1 = [self.string doubleValue];
                    break;
                    
                case 4:
                    if (_viewLabel.text == self.str) {
                        self.string = [NSMutableString stringWithFormat:@"4"];
                        _viewLabel.text = [NSString stringWithFormat:@"%@",self.string];
                    }else{
                        [self.string appendString:[NSMutableString stringWithFormat:@"4"]];
                        _viewLabel.text = [NSString stringWithString:self.string];
                    }
                    _num1 = [self.string doubleValue];
                    break;
                    
                case 5:
                    if (_viewLabel.text == self.str) {
                        self.string = [NSMutableString stringWithFormat:@"5"];
                        _viewLabel.text = [NSString stringWithFormat:@"%@",self.string];
                    }else{
                        [self.string appendString:[NSMutableString stringWithFormat:@"5"]];
                        _viewLabel.text = [NSString stringWithString:self.string];
                    }
                    _num1 = [self.string doubleValue];
                    break;
                    
                case 6:
                    if (_viewLabel.text == self.str) {
                        self.string = [NSMutableString stringWithFormat:@"6"];
                        _viewLabel.text = [NSString stringWithFormat:@"%@",self.string];
                    }else{
                        [self.string appendString:[NSMutableString stringWithFormat:@"6"]];
                        _viewLabel.text = [NSString stringWithString:self.string];
                    }
                    _num1 = [self.string doubleValue];
                    break;
                    
                case 7:
                    if (_viewLabel.text == self.str) {
                        self.string = [NSMutableString stringWithFormat:@"7"];
                        _viewLabel.text = [NSString stringWithFormat:@"%@",self.string];
                    }else{
                        [self.string appendString:[NSMutableString stringWithFormat:@"7"]];
                        _viewLabel.text = [NSString stringWithString:self.string];
                    }
                    _num1 = [self.string doubleValue];
                    break;
                    
                case 8:
                    if (_viewLabel.text == self.str) {
                        self.string = [NSMutableString stringWithFormat:@"8"];
                        _viewLabel.text = [NSString stringWithFormat:@"%@",self.string];
                    }else{
                        [self.string appendString:[NSMutableString stringWithFormat:@"8"]];
                        _viewLabel.text = [NSString stringWithString:self.string];
                    }
                    _num1 = [self.string doubleValue];
                    break;
                    
                case 9:
                    if (_viewLabel.text == self.str) {
                        self.string = [NSMutableString stringWithFormat:@"9"];
                        _viewLabel.text = [NSString stringWithFormat:@"%@",self.string];
                    }else{
                        [self.string appendString:[NSMutableString stringWithFormat:@"9"]];
                        _viewLabel.text = [NSString stringWithString:self.string];
                    }
                    _num1 = [self.string doubleValue];
                    break;
                    
                case 0:
                    if (_viewLabel.text == self.str) {
                        self.string = [NSMutableString stringWithFormat:@"0"];
                        _viewLabel.text = [NSString stringWithFormat:@"%@",self.string];
                    }else{
                        [self.string appendString:[NSMutableString stringWithFormat:@"0"]];
                        _viewLabel.text = [NSString stringWithString:self.string];
                    }
                    _num1 = [self.string doubleValue];
                    break;
                    
                default:
                    break;
            }
        }else{
            _viewLabel.text = @"0.";
        }
}
    
    // 运算符按钮链接到该行为
    /** 逻辑：同样的通过switch循环来判断
     定义了一个整型变量来作为标识符，然后把之前_num1的值赋给_num2 在像页面输出对应的运算符号。
     **/
    // add:连续计算
    /**
     连续计算也是一个计算器该具备的基础功能，仔细思考一下运算逻辑 其实实现起来很容易，
     相对于这个计算器项目 我定义了num1 num2来接收用户输入的值，但是 当用户要进行连续运算时，我们定义的值就少了一个新的数据，我们要将上一个运算的结果当作num2来进行计算。
     仔细分析用户的运算流程，这个功能很容易就实现了。
     **/
    -(void)clickOperation:(UIButton *)nameUIButton
    {
            switch (nameUIButton.tag)
            {
                case 101:
                    _x = 1;
                    // 重要
                    _chartString = [NSCharacterSet characterSetWithCharactersInString:@"+/*=.%"];
                    self.string = [NSMutableString stringWithString:[_viewLabel.text stringByTrimmingCharactersInSet:_chartString]];
                    _viewLabel.text = [NSString stringWithString:self.string];
                    _num1 = [_viewLabel.text doubleValue];
                    _num2 = _num1;
                    /** 清空字符串。我们是通过字符串的转化作为用户的输入值的，
                     当用户开始输入运算符号时就代表第一个数他已经输入完成了，所以这个时候应当把字符串清空，用它来继续接收用户输入的第二个值。
                     **/
                    _viewLabel.text = @"+";
                    [self.string setString:@""];
                    break;
                    
                case 102:
                    _x = 2;
                    _chartString = [NSCharacterSet characterSetWithCharactersInString:@"+/*=.%"];
                    self.string = [NSMutableString stringWithString:[_viewLabel.text stringByTrimmingCharactersInSet:_chartString]];
                    _viewLabel.text = [NSString stringWithString:self.string];
                    _num1 = [_viewLabel.text doubleValue];
                    _num2 = _num1;
                    _viewLabel.text = @"-";
                    [self.string setString:@""];
                    break;
                    
                case 103:
                    _x = 3;
                    _chartString = [NSCharacterSet characterSetWithCharactersInString:@"+/*=.%"];
                    self.string = [NSMutableString stringWithString:[_viewLabel.text stringByTrimmingCharactersInSet:_chartString]];
                    _viewLabel.text = [NSString stringWithString:self.string];
                    _num1 = [_viewLabel.text doubleValue];
                    _num2 = _num1;
                    _viewLabel.text = @"*";
                    [self.string setString:@""];
                    break;
                    
                case 104:
                    _x = 4;
                    _chartString = [NSCharacterSet characterSetWithCharactersInString:@"+/*=.%"];
                    self.string = [NSMutableString stringWithString:[_viewLabel.text stringByTrimmingCharactersInSet:_chartString]];
                    _viewLabel.text = [NSString stringWithString:self.string];
                    _num1 = [_viewLabel.text doubleValue];
                    _num2 = _num1;
                    _viewLabel.text = @"/";
                    [self.string setString:@""];
                    break;
                    
                case 105:
                    _x = 5;
                    _chartString = [NSCharacterSet characterSetWithCharactersInString:@"+/*=.%"];
                    self.string = [NSMutableString stringWithString:[_viewLabel.text stringByTrimmingCharactersInSet:_chartString]];
                    _viewLabel.text = [NSString stringWithString:self.string];
                    _num1 = [_viewLabel.text doubleValue];
                    _num2 = _num1;
                    _viewLabel.text = @"%";
                    [self.string setString:@""];
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
-(void)clickEqual{

// 在等于操作的时候新增了一个操作流程：如果用户进行完成一个计算过程后直接在结果的基础上继续输入数值，并不会继续插入即：在结果12之后输入1并不会生成121 而是直接变成1.
// （待完善）：在用户计算完之后继续按等号 应该保留原有的计算流程即：2*2=4 =8 =16。
        if(_x == 1)
        {
            _viewLabel.text = [NSString stringWithFormat:@"%g",(_num2 + _num1)];
            _string = [NSMutableString stringWithFormat:@""];
        }
        if(_x == 2)
        {
            _viewLabel.text = [NSString stringWithFormat:@"%g",(_num2 - _num1)];
            _string = [NSMutableString stringWithFormat:@""];
        }
        if(_x == 3)
        {
            _viewLabel.text = [NSString stringWithFormat:@"%g",(_num2 * _num1)];
            _string = [NSMutableString stringWithFormat:@""];
        }
        if(_x == 4)
        {
            _viewLabel.text = [NSString stringWithFormat:@"%g",(_num2 / _num1)];
            _string = [NSMutableString stringWithFormat:@""];
        }
        if (_x == 5) {
            _viewLabel.text = [NSString stringWithFormat:@"%g",fmod(_num2, _num1)];
            _string = [NSMutableString stringWithFormat:@""];
        }
    
    // 自定义错误输出格式
    if ([_viewLabel.text isEqualToString:@"nan"]||
        [_viewLabel.text isEqualToString:@"inf"]) {
        _viewLabel.text = @"Error";
    }
    // 第一个数为.
    if ([_viewLabel.text isEqualToString:@"."]) {
        _chartString = [NSCharacterSet characterSetWithCharactersInString:@"+/*=.%"];
        [NSMutableString stringWithString:[_viewLabel.text stringByTrimmingCharactersInSet:_chartString]];
        _viewLabel.text = @"0";
    }
}
    
// 清空功能 只需要把字符串情况，恢复成计算器一开始的模样就行了
// 完善的ac功能应该带有撤销功能，而不是一味的清空。（待完善）
-(void)clickClearn{
    [_string setString:@""];
    _viewLabel.text = @"0";
}

-(void)clickPoint{
    // 字符串如果已经包含.不执行此操作
    if (![_viewLabel.text containsString:@"."]) {
        // 如果第一个字符是.不执行此操作，把字符串修正为0.
        if (![_viewLabel.text isEqualToString:@"0"]) {
            // 添加.
            [self.string setString:_viewLabel.text];
            [self.string appendString:[NSMutableString stringWithFormat:@"."]];
            // 输出新构建的字符串
            _viewLabel.text = [NSString stringWithString:self.string];
        }else{
            _viewLabel.text = @"0.";
        }
    }else if ([_viewLabel.text isEqualToString:@"+"]||
              [_viewLabel.text isEqualToString:@"-"]||
              [_viewLabel.text isEqualToString:@"*"]||
              [_viewLabel.text isEqualToString:@"/"]){
        _viewLabel.text = @"0";
    }
}

// 正负号
/**
 1.先判断当前输入的数值的正负号，所以执行此功能时，不能在字符串后面加+/-，所以我们先建一个只包含“+/-”的字符串，再把显示框中输入的值插在后面。
 2.只能接受一次操作，不能重复进行。无止境的添加+/-号很容易污染我们的字符串，导致计算器失去功能！
 3.所以此功能生成的字符串只用于显示不能让他进入操作流程，所以需要过滤他。
 4.这样此操作永远只会做一次，不会重复的添加符号，在功能结束时，就把包含的运算符给过滤了，很好的控制用户输入的流程，确保了计算器这功能的健壮性。
 **/
-(void)clickPlusOrMinus{
    if (![_viewLabel.text isEqualToString:@"0"]) {
        if (![_viewLabel.text hasPrefix:@"-"]) {
            self.string = [NSMutableString stringWithFormat:@"-"];
            [self.string appendString:_viewLabel.text];
            _viewLabel.text = self.string;
        }else{
            _chartString = [NSCharacterSet characterSetWithCharactersInString:@"-+/*=.%"];
            self.string = [NSMutableString stringWithString:[_viewLabel.text stringByTrimmingCharactersInSet:_chartString]];
            _viewLabel.text = [NSString stringWithString:self.string];
        }
    }else{
        _viewLabel.text = @"0";
    }
}
@end
