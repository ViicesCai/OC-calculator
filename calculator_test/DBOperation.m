//
//  DBOperation.m
//  calculator_test
//
//  Created by fz500net on 2019/5/30.
//  Copyright © 2019 fz500net. All rights reserved.
//
#import "DBOperation.h"
#import <sqlite3.h>

@implementation DBOperation

// 重新把数据库句柄定义成静态变量：SQLite只能支持单线程不能被同时登入，当程序要进行多线程操作时，必须使用静态变量保证他的地址不会被改变。
static sqlite3 *database = nil;
// 数据库的存放路径
-(NSString *)documentsFilePath{
    // 把文件目录与文件名拼接成'UserDB.sqlite'文件的路径
    filePath = [NSString stringWithFormat:@"/Users/fz500net/Desktop/calculator_test/DataBase/UserDB.sqlite"];
    return filePath;
}

// 打开数据库
-(void)openDataBase{
    filePath = [self documentsFilePath];
    // 由于sqlite的绝大部分语句都是C语言，因此我们之前声明用来存放文件路径的变量需要转换为C语言的字符串
    // 打开数据库（UTF8String 转换函数）
    if (sqlite3_open(filePath.UTF8String,&database) == SQLITE_OK) {
        // 反馈方式可修改
        NSLog(@"数据库开启成功,%@",filePath);
    }else{
        NSLog(@"数据库开启失败");
    }
}

// 关闭数据库
-(void)closeDateBase{
    if (sqlite3_close(database) == SQLITE_OK) {
        NSLog(@"数据库关闭成功");
    }else{
        NSLog(@"数据库关闭失败");
    }
}

// 创建数据表
-(void)createDataBaseTable{
        // 定义创建表格的sql语句
        // 可修改（可以引入参数，使整个结构更有适用性）
        NSString *createSql = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS t_user(username TEXT PRIMARY KEY,password TEXT NOT NULL);"];
        if (sqlite3_exec(database, createSql.UTF8String, NULL, NULL, &errorMessage) == SQLITE_OK) {
            NSLog(@"数据表创建成功");
        }else{
            NSLog(@"数据表创建失败");
        }
}

// 添加数据
-(int)addData:(DataModel *)model
{
    // 定义SQL语句
    NSString *addSql = [NSString stringWithFormat:@"INSERT INTO t_user (username,password) VALUES (?,?)"];
    // 判断SQL是否被成功执行(这样做有利于我们排查错误)
    // sqlite3_prepare 创建准备语句
    NSLog(@"%@,%@",model.username,model.password);
    if (sqlite3_prepare_v2(database, addSql.UTF8String, -1, &statement, NULL) == SQLITE_OK) {
        NSLog(@"语句正确");
        // 在确认添加语句没有错误之后
        // 声明两个字符数组用来接收传回的数值
        const char* charUsername = [model.username UTF8String];
        const char* charPassword = [model.password UTF8String];
        
        // 绑定参数
        // 将我们定义的两个变量作为要传递的参数
        sqlite3_bind_text(statement, 1, charUsername, -1, NULL);
        sqlite3_bind_text(statement, 2, charPassword, -1, NULL);
        
        // SQL执行结果
        if (sqlite3_step(statement) == SQLITE_DONE) {
            NSLog(@"插入成功");
        }else{
            NSLog(@"插入失败");
        }
    }else{
        NSLog(@"语句错误");
    }
    // *释放之前的准备语句：没当调用了sqlite3_prepare这个函数后，必须跟上此函数。否则会有内存外泄的错误提示！
    sqlite3_finalize(statement);
    return 0;
}

// 删除数据
-(int)deleteData:(DataModel *)model
{
    // 定义SQL语句
    NSString * deleteSql = [NSString stringWithFormat:@"DELETE FROM t_user WHERE username = ?;"];
    
    // 判断SQL语句是否成功被执行
    // 准备使用SQL语句：当我们需要用到值捆绑时就必须使用：sqlite3_prepare
    // 他其实也包含了sqlite3_exec的功能只不过使用方式不同
    if (sqlite3_prepare_v2(database, deleteSql.UTF8String, -1, &statement, NULL) == SQLITE_OK){
        NSLog(@"语句正确");
        
        // 当准备阶段成功时
        // 定义一个字符数组指针即C语言当中的字符串
        const char* charUsername = [model.username UTF8String];
        
        // 绑定参数
        sqlite3_bind_text(statement, 1, charUsername, -1, NULL);
        
        // 判断SQL执行结果
        if (sqlite3_step(statement) == SQLITE_DONE) {
            NSLog(@"删除成功");
        }else{
            NSLog(@"删除失败");
        }
    }else{
        NSLog(@"语句错误");
    }
    // 释放准备语句
    sqlite3_finalize(statement);
    return 0;
}

// 更改数据
-(int)editData:(DataModel *)model
{
    // 定义SQL语句
    NSString * editSql = [NSString stringWithFormat:@"UPDATE t_user SET password = %@ WHERE username = %@;",model.password,model.username];
    
    // 遗留问题：不太清楚为何UPDATE操作无法使用'sqlite3_prepare'函数
    if (sqlite3_exec(database, editSql.UTF8String, NULL, NULL, &errorMessage) == SQLITE_OK){
        NSLog(@"语句正确");
        if (errorMessage == SQLITE_OK) {
            NSLog(@"修改成功");
        }else{
            NSLog(@"修改失败");
        }
    }else{
        NSLog(@"语句错误");
    }
    
    return 0;
}

// 查询数据
-(int)selectData:(DataModel *)model{
    // 定义SQL语句
    NSString *selectSql = [NSString stringWithFormat:@"SELECT username,password FROM t_user"];
    
    if (sqlite3_prepare_v2(database, selectSql.UTF8String, -1, &statement, NULL) == SQLITE_OK) {
        NSLog(@"语句正确");
        while (sqlite3_step(statement) == SQLITE_ROW) {
            // 声明一个二维指针('sqlite3_column_text'是一个存放了数据的地址，我们定义一个char指针调用其中的值)
            // 取出第一列的值：默认从0开始
            char *username = (char *)sqlite3_column_text(statement, 0);
            // OC 与 C之间数据类型的转换
            NSString *strUsername = [[NSString alloc] initWithUTF8String:username];
            
            // 取出第二列的值
            char *password = (char *)sqlite3_column_text(statement, 1);
            NSString *strPassword = [[NSString alloc] initWithUTF8String:password];
            
            // 将账号密码与数据库进行匹配如果存在则登入成功
            if ([model.username isEqualToString:strUsername] && [model.password isEqualToString:strPassword]) {
                NSLog(@"登录成功");
                return 1;
            }else{
                NSLog(@"账号或密码错误");
            }
        }
    }else{
        
        NSLog(@"语句错误");
    }
    sqlite3_finalize(statement);
    return 0;
}


-(void)loginLog:(DataModel *)model{
    // TESTING
    // 获取登录时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *timeString = [formatter stringFromDate:[NSDate date]]; NSLog(@"用户：%@ 的登入时间为：%@",model.username,timeString);
    // 配置保存路径
    //NSString *logFilePath = [NSString stringWithFormat:@"/Users/fz500net/Desktop/calculator_test/DataBase/"];
    
    // 设置文件名
    //NSString *fileName = [NSString stringWithFormat:@"%@:登入日志.txt",model.username];
    
    // 创建文件
    //NSString *createFile = [logFilePath stringByAppendingPathComponent:fileName];
    
    // 将生成的数据保存至文件中
    //freopen([createFile cStringUsingEncoding:NSASCIIStringEncoding], "a+", stdout);
    //freopen([createFile cStringUsingEncoding:NSASCIIStringEncoding], "a+", stderr);
    
}
@end
