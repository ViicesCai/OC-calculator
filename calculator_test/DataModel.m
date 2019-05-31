//
//  DataModel.m
//  calculator_test
//
//  Created by fz500net on 2019/5/30.
//  Copyright © 2019 fz500net. All rights reserved.
//

#import "DataModel.h"

@implementation DataModel

// 方法名
-(id)initWithUsername:(NSString *)username Password:(NSString *)password{
    self = [super init];
    if (self) {
        self.username = username;
        self.password = password;
    }
    return self;
}

@end
