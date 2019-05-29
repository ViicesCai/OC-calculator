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
#import <sqlite3.h>

@interface LoginViewController ()

@property (strong, nonatomic) UITextField *accountTextField;
@property (strong, nonatomic) UITextField *passwordTextField;
@property (strong, nonatomic) UIButton *loginButton;
@property (strong, nonatomic) UIButton *registerButton;
@property (strong, nonatomic) UIView *backgroundView;
@property (strong, nonatomic) UITextView *textview;

@end

@implementation LoginViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    // 隐藏导航栏
    
    _backgroundView = [[textBackground alloc] initWithFrame:CGRectMake(20, 200, self.view.frame.size.width-40, 100)];
    [_backgroundView setBackgroundColor:[UIColor whiteColor]];
    [[_backgroundView layer] setCornerRadius:5];
    [[_backgroundView layer] setMasksToBounds:YES];
    [self.view addSubview:_backgroundView];
    
    
    [self.view setBackgroundColor:[UIColor colorWithRed:51/255.0 green:204/255.0 blue:255/255.0 alpha:1]];
    
    
    _accountTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 0, self.view.frame.size.width-40, 50)];
    [_accountTextField setBackgroundColor:[UIColor clearColor]];
    _accountTextField.placeholder = [NSString stringWithFormat:@"账号"];
    _accountTextField.layer.cornerRadius = 5.0;
    [_backgroundView addSubview:_accountTextField];
    
    
    _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 50, self.view.frame.size.width-40, 50)];
    [_passwordTextField setBackgroundColor:[UIColor clearColor]];
    _passwordTextField.placeholder = [NSString stringWithFormat:@"密码"];
    _passwordTextField.layer.cornerRadius = 5.0;
    [_backgroundView addSubview:_passwordTextField];
    
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_loginButton setFrame:CGRectMake(20, 320, self.view.frame.size.width-40, 50)];
    [_loginButton setTitle:@"Login" forState:UIControlStateNormal];
    [_loginButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
    _loginButton.layer.cornerRadius = 5.0;
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginButton addTarget:self action:@selector(clickLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_loginButton];
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_registerButton setFrame:CGRectMake(20, 130, 60, 50)];
    [_registerButton setTitle:@"Register" forState:UIControlStateNormal];
    [_registerButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
    _registerButton.layer.cornerRadius = 5.0;
    [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(clickRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
}

-(void)clickLogin
{
    /**
    sqlite3 *db;
    NSString *sql = [NSString stringWithFormat:@"SELECT username,password FROM t_user;"];
    char *errmsg = NULL;
    sqlite3_exex(db, sql.UTF8String, NULL, NULL, &errmsg);
    if (errmsg) {
        NSLog(@"查找失败");
    }else{
        NSLog(@"查找成功");
        while (sqlite3_step(stmt) == ) {
            <#statements#>
        }
        }
    }
    **/
    // 跳转到下一页
    ViewController *viewController= [[ViewController alloc] init];
    //[self.navigationController pushViewController:viewController animated:YES];
    //返回到上一页
    //
    [self.navigationController presentViewController:viewController animated:YES completion:nil];
}

-(void)clickRegister
{
    RegisterViewController *registerViewController = [[RegisterViewController alloc] init];
    [self.navigationController pushViewController:registerViewController animated:YES];
}

@end

