//
//  DataModel.h
//  calculator_test
//
//  Created by fz500net on 2019/5/30.
//  Copyright © 2019 fz500net. All rights reserved.
//

// 数据库操作的封装
// 目前只加入两个属性 username/password.
#import <Foundation/Foundation.h>

@interface DataModel : NSObject

// 用户名
@property (strong, nonatomic)NSString *username;
// 密码
@property (strong, nonatomic)NSString *password;
// 封装
-(id)initWithUsername:(NSString *)username Password:(NSString *)password;

@end


