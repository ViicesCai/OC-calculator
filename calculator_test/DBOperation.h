//
//  DBOperation.h
//  calculator_test
//
//  Created by fz500net on 2019/5/30.
//  Copyright © 2019 fz500net. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataModel.h"
#import <sqlite3.h>


@interface DBOperation : NSObject
{
    // 声明数据库对象(数据库操作的重要参数)
    // 打开数据库时，database用于操作的临时存放
    // *数据库路径确认了他能不能被成功的定义，如果数据库位置出错，open这些函数并不会报错。而sqlite3_exec等操作函数就会无法正确执行！
    // 获取不到database 数据库指针时也会造成操作函数无法正常执行。
    // static sqlite3 *database = nil;
    char *errorMessage;
    sqlite3_stmt *statement;
    NSString *documentDirectoty;
    NSString *filePath;
}
//----------
// 准备阶段  |
//----------

// 数据库文件的路径
-(NSString *)documentsFilePath;

// 打开数据库（如果未发现,则在当前文件夹中创建）
-(void)openDataBase;

// 关闭数据库
-(void)closeDateBase;

// 创建数据表(需要修改)
-(void)createDataBaseTable;


//-------------
// 数据表操作集合  |
//-------------

// 添加
-(int)addData:(DataModel *)model;

// 删除
-(int)deleteData:(DataModel *)model;

// 修改
-(int)editData:(DataModel *)model;

// 查找
-(int)selectData:(DataModel *)model;

//----------------------------------->
// 获取本地时间
-(void)loginLog:(DataModel *)model;
-(void)currentGMT:(DataModel *)model;

// 获取网络时间
-(void)getInternetDate:(DataModel *)model;

// 获取设备外网IP
-(NSString *)getDeviceIPAddresses;

// 新建数据库
-(void)createUserDataBaseTable;

// MD5加密
-(NSString *)MD5ForLower32Bite:(NSString *)md5String;

@end

