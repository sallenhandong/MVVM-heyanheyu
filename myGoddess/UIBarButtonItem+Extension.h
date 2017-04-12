//
//  UIBarButtonItem+Extension.h
//  myGoddess
//
//  Created by jefactoria on 17/2/9.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 *  自定义导航栏左右两边的按钮(实现的方法:用一个按钮包装成一个barButtonItem)
 *
 *  @param normalImageName    正常状态下的按钮图片
 *  @param highlightImageName 高亮状态下的按钮图片
 *  @param target             点击按钮的对象
 *  @param action             点击按钮所执行的操作
 *
 *  @return 返回一个包装好的barButtonItem
 */
+ (UIBarButtonItem *)buttonWithNoramalImageName:(NSString *)normalImageName highlightImageName:(NSString *)highlightImageName target:(id)target action:(SEL)action isCustom:(BOOL)custom;
@end
