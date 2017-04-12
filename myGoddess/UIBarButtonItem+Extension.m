//
//  UIBarButtonItem+Extension.m
//  myGoddess
//
//  Created by jefactoria on 17/2/9.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
//自定义导航栏左右两边的按钮(实现的方法:用一个按钮包装成一个barButtonItem)
+ (UIBarButtonItem *)buttonWithNoramalImageName:(NSString *)normalImageName highlightImageName:(NSString *)highlightImageName target:(id)target action:(SEL)action isCustom:(BOOL)custom{
    
    UIBarButtonItem *leftBtn;
    
    if (!custom) {
        UIButton *itemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [itemBtn setImage:[UIImage imageWithOriginalImageName:normalImageName] forState:UIControlStateNormal];
        [itemBtn setImage:[UIImage imageWithOriginalImageName:highlightImageName] forState:UIControlStateHighlighted];
        [itemBtn sizeToFit];
        [itemBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
        //    [itemBtn setImageEdgeInsets:uied]
        leftBtn = [[UIBarButtonItem alloc]initWithCustomView:itemBtn];
    }else{
        
        //返回按钮
        UIView *leftBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 60, 31)];
        
        UIButton *mapbutton = [UIButton buttonWithType:UIButtonTypeCustom];
        [mapbutton setFrame:CGRectMake(0, 3, 25, 25)];
        [mapbutton setImage:[UIImage imageWithOriginalImageName:normalImageName] forState:UIControlStateNormal];
        [mapbutton addTarget:target action:action forControlEvents:UIControlEventTouchDown];
        [leftBarView addSubview:mapbutton];
        leftBarView.backgroundColor=[UIColor clearColor];
        
        leftBtn = [[UIBarButtonItem alloc]initWithCustomView:leftBarView];
    }
    
    
    
    
    
    return leftBtn;
    
}
@end
