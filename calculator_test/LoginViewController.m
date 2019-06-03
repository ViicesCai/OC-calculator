//
//  LoginViewController.m
//  calculator_test
//
//  Created by fz500net on 2019/5/29.
//  Copyright © 2019 fz500net. All rights reserved.
//

#import "LoginViewController.h"
#import "textBackground.h"
#import "ViewController.h"
#import "RegisterViewController.h"
#import "AppDelegate.h"
#import "DBOperation.h"
#import <sqlite3.h>

@interface LoginViewController ()

// 账号输入框
@property (strong, nonatomic) UITextField *accountTextField;
// 密码输入框
@property (strong, nonatomic) UITextField *passwordTextField;
// 登录按钮
@property (strong, nonatomic) UIButton *loginButton;
// 注册按钮
@property (strong, nonatomic) UIButton *registerButton;
// 登录界面
@property (strong, nonatomic) UIView *backgroundView;

@end

@implementation LoginViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    // 隐藏导航栏
    // [self.navigationController setNavigationBarHidden:YES];
    // 登录界面视图定义
    _backgroundView = [[textBackground alloc] initWithFrame:CGRectMake(20, 200, self.view.frame.size.width-40, 100)];
    // 界面背景色
    [_backgroundView setBackgroundColor:[UIColor whiteColor]];
    // 界面样式
    [[_backgroundView layer] setCornerRadius:12.5f];
    [[_backgroundView layer] setMasksToBounds:YES];
    [self.view addSubview:_backgroundView];
    
    // 设置LoginView的界面背景颜色
    [self.view setBackgroundColor:[UIColor colorWithRed:51/255.0 green:204/255.0 blue:255/255.0 alpha:1]];
    
    // 定义账号框
    _accountTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-40, 50)];
    [_accountTextField setBackgroundColor:[UIColor clearColor]];
    // 默认显示
    _accountTextField.placeholder = [NSString stringWithFormat:@"账号"];
    
    // 定义图片
    UIImageView *userImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    userImage.image = [UIImage imageNamed:@"user.png"];
    // 将图片加入到账号框的左边
    _accountTextField.leftView = userImage;
    _accountTextField.leftViewMode = UITextFieldViewModeAlways;
    // 作为子视图在账号框上显示
    [_backgroundView addSubview:_accountTextField];
    
    // 定义密码框
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, self.view.frame.size.width-40, 50)];
    [_passwordTextField setBackgroundColor:[UIColor clearColor]];
    // 默认显示
    _passwordTextField.placeholder = [NSString stringWithFormat:@"密码"];
    // 输入值以密文的形式显示
    _passwordTextField.secureTextEntry = YES;
    
    // 定义图片
    UIImageView *passwordImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    passwordImage.image = [UIImage imageNamed:@"unlock.png"];
    // 将图片加入到密码框的左边
    _passwordTextField.leftView = passwordImage;
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    // 作为子视图在密码框上显示
    [_backgroundView addSubview:_passwordTextField];
    
    // 定义登入按钮
    _loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginButton setFrame:CGRectMake(20, 320, self.view.frame.size.width-40, 50)];
    [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
    // 改变按钮样式
    [_loginButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
    _loginButton.layer.cornerRadius = 5.0;
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    // 设定点击事件
    [_loginButton addTarget:self action:@selector(clickLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
    // 定义注册按钮
    _registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_registerButton setFrame:CGRectMake(20, 130, 60, 50)];
    [_registerButton setTitle:@"Register" forState:UIControlStateNormal];
    // 改变按钮样式
    [_registerButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
    _registerButton.layer.cornerRadius = 5.0;
    [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    // 设定点击事件
    [_registerButton addTarget:self action:@selector(clickRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
}

-(void)clickLogin
{
    // 调用方法
    DBOperation *opertation = [[DBOperation alloc] init];
    DataModel *model = [[DataModel alloc] init];
    
    // 调用变量
    model.username = _accountTextField.text;
    model.password = _passwordTextField.text;
    // 输入为空h或输入密码不一致（应增加字段拦截:防止非法操作）
    // 操作：第一次if判断用户输入值是否为空，空则不进行下一步操作弹出错误提示
    // 这里定义一个整型变量来接收查询操作的返回值验证账号密码是否存在：这段代码待修改。
    if (![model.username isEqual:@""] && ![model.password isEqual:@""]) {
        int x = [opertation selectData:model];
        if (x == 1) {
            // 获取网络层数据
            [opertation getInternetDate:model];
            // 隐藏页头的导航栏
            // [self.navigationController setNavigationBarHidden:YES];
            // 声明试图控制器
            // ViewController *viewController= [[ViewController alloc] init];
            // 切换到计算器
            // [self.navigationController pushViewController:viewController animated:YES];
            //[opertation loginLog:model];
            //[opertation currentGMT:model];
            
            // 关闭数据库:对app新增功能或逻辑时此项可修改
        }
    }else{
        NSLog(@"账号或密码不能为空");
    }
}

-(void)clickRegister
{
    // 定义视图控制器
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    // 切换到注册页面
    [self.navigationController pushViewController:registerViewController animated:YES];
    
}

@end

