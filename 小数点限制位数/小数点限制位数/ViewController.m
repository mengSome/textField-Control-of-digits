//
//  ViewController.m
//  小数点限制位数
//
//  Created by iOS-MBP on 2017/8/16.
//  Copyright © 2017年 超级无敌小阳阳. All rights reserved.
//

#import "ViewController.h"
#import "BoolString.h"

#define myDotNumbers     @"0123456789.\n"
#define myNumbers          @"0123456789\n"
@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _mainTextField.delegate = self;
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
  
    BOOL isyes = [BoolString stringWith:string andInteger:3 andChar:2 andRange:range andInt:6 andWith:textField.text];

    return isyes;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    //给textField添加一个事件来控制是复制粘贴进的textField
        [textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:(UIControlEventEditingChanged)];
}
-(void)textFieldDidChange:(UITextField *)textField{
    if (textField.tag == 301 || textField.tag == 302) {
        textField.text = [BoolString changeWithInt:4 andTextField:textField];
    }
    
    else if (textField.tag == 222) {
        textField.text = [BoolString changeWithInt:3 andTextField:textField];
    }
    else  if (textField.tag == 223) {
        textField.text = [BoolString changeWithInt:2 andTextField:textField];
    }else{
        NSLog(@"随便输入");
    }
    
}


- (IBAction)click:(UIButton *)sender
{
    [self.view endEditing:YES];
    _mainLabel.text = _mainTextField.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
