//
//  UIImage+Extension.m
//  myGoddess
//
//  Created by jefactoria on 17/2/9.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)
/**
 *  去掉系统默认对图片的渲染(默认渲染成蓝色)，恢复图片原来的颜色
 *
 *  @param imageName 图片的名称
 *
 *  @return 未渲染的图片
 */
+ (instancetype)imageWithOriginalImageName:(NSString *)imageName{
    return  [[UIImage imageNamed:imageName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
