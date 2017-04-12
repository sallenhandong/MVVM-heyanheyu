//
//  UpdateUserInfoView.m
//  myGoddess
//
//  Created by jefactoria on 17/2/11.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "UpdateUserInfoView.h"
@interface UpdateUserInfoView ()
@end
@implementation UpdateUserInfoView

-(void)addChildView{

    self.nickNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 40)];
    self.nickNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    self.nickNameTextField.text = @"音乐君";
    [self addSubview:self.nickNameTextField];
    
    self.signTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 100)];
    //设置是否可以编辑
    self.signTextView .editable = YES;

    self.signTextView.layer.borderWidth = 1.0;
    self.signTextView.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    //设置内容
    self.signTextView.text = @"xxxxxxxxxx";
    
    //字体颜色
    self.signTextView .textColor = [UIColor lightGrayColor];
    
    //设置字体
    self.signTextView .font = [UIFont systemFontOfSize:17];
    
    [self addSubview:self.signTextView];

}

@end
