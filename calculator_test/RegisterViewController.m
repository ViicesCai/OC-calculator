//
//  RegisterViewController.m
//  calculator_test
//
//  Created by fz500net on 2019/5/29.
//  Copyright © 2019 fz500net. All rights reserved.
//

#import "RegisterViewController.h"
#import "textBackground.h"
#import <sqlite3.h>

@interface RegisterViewController ()

@property (strong, nonatomic) UITextField *accountTextField;
@property (strong, nonatomic) UITextField *passwordTextField;
@property (strong, nonatomic) UITextField *checkPasswordTextField;
@property (strong, nonatomic) UIButton *registerButton;
@property (strong, nonatomic) UIView *backgroundView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    _backgroundView = [[textBackground alloc] initWithFrame:CGRectMake(20, 200, self.view.frame.size.width-40, 150)];
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
    
    
    _checkPasswordTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-40, 50)];
    [_checkPasswordTextField setBackgroundColor:[UIColor clearColor]];
    _checkPasswordTextField.placeholder = [NSString stringWithFormat:@"确认密码"];
    _checkPasswordTextField.layer.cornerRadius = 5.0;
    [_backgroundView addSubview:_checkPasswordTextField];
    
    
    _registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_registerButton setFrame:CGRectMake(20, 370, self.view.frame.size.width-40, 50)];
    [_registerButton setTitle:@"Register" forState:UIControlStateNormal];
    [_registerButton setBackgroundColor:[UIColor colorWithRed:51/255.0 green:102/255.0 blue:255/255.0 alpha:1]];
    _registerButton.layer.cornerRadius = 5.0;
    [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_registerButton addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_registerButton];
}

-(void)click
{
    // 跳转到下一页
    //ViewController *viewController= [[ViewController alloc] init];
    //[self.navigationController pushViewController:viewController animated:YES];
    //返回到上一页
    //
    //[self.navigationController presentViewController:viewController animated:YES completion:nil]
    // 销毁
    
    //[self.navigationController popViewControllerAnimated:YES];

    sqlite3 *db;
    
    NSString *username = _accountTextField.text;
    NSString *password = _passwordTextField.text;
    NSString *insetSQL = [NSString stringWithFormat:@"INSERT INTO t_user (username,password) VALUES ('%@','%@');",username,password];
    NSString *doc = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *fileName = [doc stringByAppendingPathComponent:@"UserDB.sqlite"];
    const char *cfileName = fileName.UTF8String;
    const char *sql = "CREATE TABLE IF NOT EXISTS t_user (username text PRIMARY KEY,password NOT NULL);";
    char *errmsg = NULL;
    int result = sqlite3_open(cfileName, &db);
    if (result == SQLITE_OK) {
        NSLog(@"打开数据库成功");
        result = sqlite3_exec(db, sql, NULL, NULL, &errmsg);
        if (result == SQLITE_OK) {
            NSLog(@"创表成功");
            sqlite3_exec(db, insetSQL.UTF8String, NULL, NULL, &errmsg);
            if (errmsg) {
                NSLog(@"插入失败");
            }else{
                NSLog(@"插入成功");
                [self.navigationController popViewControllerAnimated:YES];
            }
        }else{
            NSLog(@"创表失败");
        }
    }else{
        NSLog(@"打开数据库失败");
    }
    
}

@end
