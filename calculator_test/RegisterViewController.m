//
//  RegisterViewController.m
//  calculator_test
//
//  Created by fz500net on 2019/5/29.
//  Copyright © 2019 fz500net. All rights reserved.
//

#import "RegisterViewController.h"
#import "textBackground.h"
#import "DBOperation.h"
#import <sqlite3.h>

@interface RegisterViewController ()

// 账号输入框
@property (strong, nonatomic) UITextField *accountTextField;
// 密码输入框
@property (strong, nonatomic) UITextField *passwordTextField;
// 确认密码
@property (strong, nonatomic) UITextField *checkPasswordTextField;
// 注册按钮
@property (strong, nonatomic) UIButton *registerButton;
// 登录界面
@property (strong, nonatomic) UIView *backgroundView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 登录界面视图定义
    _backgroundView = [[textBackground alloc] initWithFrame:CGRectMake(20, 200, self.view.frame.size.width-40, 150)];
    // 界面背景颜色
    [_backgroundView setBackgroundColor:[UIColor whiteColor]];
    // 界面样式
    [[_backgroundView layer] setCornerRadius:12.5f];
    [[_backgroundView layer] setMasksToBounds:YES];
    [self.view addSubview:_backgroundView];
        
    // 设置Register的界面背景颜色
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
    
    // 定义图片
    UIImageView *passwordImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    passwordImage.image = [UIImage imageNamed:@"unlock.png"];
    // 将图片加入到密码框的左边
    _passwordTextField.leftView = passwordImage;
    _passwordTextField.leftViewMode = UITextFieldViewModeAlways;
    // 作为子视图在密码框上显示
    [_backgroundView addSubview:_passwordTextField];
    
    // 确认密码
    _checkPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-40, 50)];
    [_checkPasswordTextField setBackgroundColor:[UIColor clearColor]];
    // 默认显示
    _checkPasswordTextField.placeholder = [NSString stringWithFormat:@"确认密码"];
    
    // 在此添加图片的话会造成卡屏：待解决
    // 作为子视图在确认密码框上显示
    UIImageView *checkwordImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    checkwordImage.image = [UIImage imageNamed:@"lock.png"];
    _checkPasswordTextField.leftView = checkwordImage;
    _checkPasswordTextField.leftViewMode = UITextFieldViewModeAlways;
    [_backgroundView addSubview:_checkPasswordTextField];
    
    // 定义注册按钮
    _registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_registerButton setFrame:CGRectMake(20, 370, self.view.frame.size.width-40, 50)];
    [_registerButton setTitle:@"Register" forState:UIControlStateNormal];
    // 改变按钮样式
    [_registerButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
    _registerButton.layer.cornerRadius = 5.0;
    [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    // 设定点击事件
    [_registerButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
}

-(void)click
{
    // 调用方法
    DBOperation *opertation = [[DBOperation alloc] init];
    DataModel *model = [[DataModel alloc] init];
    // 调用变量
    model.username = _accountTextField.text;
    model.password = _passwordTextField.text;
    // 输入为空h或输入密码不一致（应增加字段拦截:防止非法操作）
    [opertation addData:model];
    
}
@end
