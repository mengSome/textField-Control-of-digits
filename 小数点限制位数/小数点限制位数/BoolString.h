//
//  BoolString.h
//  小数点限制位数
//
//  Created by XYJ on 2017/9/6.
//  Copyright © 2017年 超级无敌小阳阳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BoolString : NSString

+(BOOL)stringWith:(NSString *)string andInteger:(NSInteger)inter andChar:(NSInteger)cha andRange:(NSRange)range andInt:(NSInteger)allInt andWith:(NSString *)textField;
//控制整数输入
+(NSString *)changeWithInt:(NSInteger)maxLength andTextField:(UITextField *)textField;
@end
