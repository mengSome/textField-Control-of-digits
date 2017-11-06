//
//  BoolString.m
//  小数点限制位数
//
//  Created by XYJ on 2017/9/6.
//  Copyright © 2017年 超级无敌小阳阳. All rights reserved.
//

#import "BoolString.h"
#define myDotNumbers     @"0123456789.\n"
#define myNumbers          @"0123456789\n"
@implementation BoolString

+(BOOL)stringWith:(NSString *)string andInteger:(NSInteger)inter andChar:(NSInteger)cha andRange:(NSRange)range andInt:(NSInteger)allInt andWith:(NSString *)textField{
    if (![string isEqualToString:@""])
    {
        NSCharacterSet *cs;
        // 小数点在字符串中的位置 第一个数字从0位置开始
        NSInteger dotLocation = [textField rangeOfString:@"."].location;
        // 判断字符串中是否有小数点，并且小数点不在第一位
        // NSNotFound 表示请求操作的某个内容或者item没有发现，或者不存在
        // range.location 表示的是当前输入的内容在整个字符串中的位置，位置编号从0开始
        if (dotLocation == NSNotFound && range.location != 0)
        {
            // 取只包含“myDotNumbers”中包含的内容，其余内容都被去掉
            /* [NSCharacterSet characterSetWithCharactersInString:myDotNumbers]的作用是去掉"myDotNumbers"中包含的所有内容，只要字符串中有内容与"myDotNumbers"中的部分内容相同都会被舍去在上述方法的末尾加上invertedSet就会使作用颠倒，只取与“myDotNumbers”中内容相同的字符 */
            cs = [[NSCharacterSet characterSetWithCharactersInString:myDotNumbers] invertedSet];
            if (range.location >= inter)
            {
                NSLog(@"整数位不能过3位");
                if ([string isEqualToString:@"."] && range.location == inter)
                {
                    return YES;
                }
                return NO;
            }
        }
        else
        {
            cs = [[NSCharacterSet characterSetWithCharactersInString:myNumbers] invertedSet]; }
        // 按cs分离出数组,数组按@""分离出字符串
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        BOOL basicTest = [string isEqualToString:filtered];
        if (!basicTest)
        {
            NSLog(@"只能输入数字和小数点");
            return NO;
        }
        if (dotLocation != NSNotFound && range.location > dotLocation + cha)
        {
            NSLog(@"小数点后最多两位");
            return NO;
            
        }
        if (string.length > allInt)
        {
            NSLog(@"整个不能超过%zd字符",allInt);
            return NO;
        }
    }
    return YES;



}
//控制字段输入maxLength是textField控制输入的整数位数
+(NSString *)changeWithInt:(NSInteger)maxLength andTextField:(UITextField *)textField{
    NSString *text = textField.text;
    UITextRange *selectedRange = [textField markedTextRange];
    UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
    
    //没有高亮选择的字，则对已输入的文字进行字数统计和限制,防止中文/emoj被截断
    if (!position){
        if (text.length > maxLength){
            NSRange rangeIndex = [text rangeOfComposedCharacterSequenceAtIndex:maxLength];
            if (rangeIndex.length == 1){
                textField.text = [text substringToIndex:maxLength];
            }else{
                if(maxLength == 1){
                    textField.text = @"";
                }else{
                    NSRange rangeRange = [text rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, maxLength - 1 )];
                    textField.text = [text substringWithRange:rangeRange];
                }
            }
            
        }
    }
    
    return textField.text;
}

@end
