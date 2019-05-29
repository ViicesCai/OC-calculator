//
//  textBackground.m
//  calculator_test
//
//  Created by fz500net on 2019/5/29.
//  Copyright © 2019 fz500net. All rights reserved.
//

#import "textBackground.h"

@implementation textBackground

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 0.2);
    CGContextBeginPath(context);
    CGContextMoveToPoint(context, 5, 50);
    CGContextAddLineToPoint(context, self.frame.size.width-5, 50);
    // 增加第二条 注意一下格式
    //-------------------------------------------------------------
    CGContextMoveToPoint(context, 5, 100);
    CGContextAddLineToPoint(context, self.frame.size.width-5, 100);
    //-------------------------------------------------------------
    CGContextClosePath(context);
    [[UIColor grayColor] setStroke];
    CGContextStrokePath(context);
}

@end
