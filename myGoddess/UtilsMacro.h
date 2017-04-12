//
//  UtilsMacro.h
//  basicFramework
//
//  Created by jefactoria on 17/1/3.
//  Copyright © 2017年 xiexing. All rights reserved.
//

/**
 *  本类放一些方便使用的宏定义
 */
#import "Utility.h"
#import "BaseRequest.h"
#import "NSObject+YYThemeExtension.h"
//分类
#import "UIView+JYSExtension.h"
#import "UIColor+Hex.h"
#import "UIBarButtonItem+Extension.h"
#import "UIImage+Extension.h"
#import "UIView+YYExtension.h"
// 获取屏幕 宽度、高度 bounds就是屏幕的全部区域
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
/**
 *  tableView
 */
#define iCodeTableviewBgColor [UIColor colorWithHexString:@"#E2EAF2"]                  //tableview背景颜色
#define iCodeTableViewSectionMargin 25

/**
 *  导航条
 */
#define iCodeNavigationBarColor [UIColor colorWithHexString:@"#47B879"]                  //导航条颜色

/**
 *  tableView
 */
#define iCodeTableviewBgColor [UIColor colorWithHexString:@"#E2EAF2"]                  //tableview背景颜色
#define iCodeTableViewSectionMargin 25                                                 //section间距

/**
 *  头像cell高度
 */
#define iconRowHeight 74

/**
 *  普通cell高度
 */
#define nomalRowHeight 44

/**
 *  Code圈
 */
#define circleCellMargin 15  //间距
#define circleCelliconWH 40  //头像高度、宽度
#define circleCellWidth [UIScreen mainScreen].bounds.size.width - 2 * circleCellMargin  //cell的宽度
#define circleCellNameattributes @{NSFontAttributeName : [UIFont systemFontOfSize:16]}  //昵称att
#define circleCellNameFont [UIFont systemFontOfSize:16]                                 //昵称字号
#define circleCellTimeattributes @{NSFontAttributeName : [UIFont systemFontOfSize:13]}  //时间att
#define circleCellTimeFont [UIFont systemFontOfSize:13]                                 //时间字号
#define circleCellTextattributes @{NSFontAttributeName : [UIFont systemFontOfSize:17]}  //正文att
#define circleCellTextFont [UIFont systemFontOfSize:17]                                 //正文字号
#define circleCellPhotosWH (circleCellWidth - 2 * (circleCellMargin + circleCellPhotosMargin)) / 3                                                                                   //图片的宽高
#define circleCellPhotosMargin 5                                                        //图片间距
#define circleCellToolBarHeight 35                                                      //cell工具条高度
#define circleCellToolBarTintColor [UIColor colorWithHexString:@"#ffffff"]              //工具条图标、字体颜色
#define circleCellToolBarTittleFont [UIFont systemFontOfSize:14]                        //工具条btn字号

// 颜色(RGB)
#define RGBCOLOR(r, g, b)       [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r, g, b, a)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define YYRandomColor  RGBCOLOR(arc4random_uniform(256),arc4random_uniform(256),arc4random_uniform(256))

// View 圆角和加边框
#define ViewBorderRadius(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define ViewRadius(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

///常用颜色
#define black_color     [UIColor blackColor]
#define blue_color      [UIColor blueColor]
#define brown_color     [UIColor brownColor]
#define clear_color     [UIColor clearColor]
#define darkGray_color  [UIColor darkGrayColor]
#define darkText_color  [UIColor darkTextColor]
#define white_color     [UIColor whiteColor]
#define yellow_color    [UIColor yellowColor]
#define red_color       [UIColor redColor]
#define orange_color    [UIColor orangeColor]
#define purple_color    [UIColor purpleColor]
#define lightText_color [UIColor lightTextColor]
#define lightGray_color [UIColor lightGrayColor]
#define green_color     [UIColor greenColor]
#define gray_color      [UIColor grayColor]
#define magenta_color   [UIColor magentaColor]

///正常字体
#define H30 [UIFont systemFontOfSize:30]
#define H29 [UIFont systemFontOfSize:29]
#define H28 [UIFont systemFontOfSize:28]
#define H27 [UIFont systemFontOfSize:27]
#define H26 [UIFont systemFontOfSize:26]
#define H25 [UIFont systemFontOfSize:25]
#define H24 [UIFont systemFontOfSize:24]
#define H23 [UIFont systemFontOfSize:23]
#define H22 [UIFont systemFontOfSize:22]
#define H20 [UIFont systemFontOfSize:20]
#define H19 [UIFont systemFontOfSize:19]
#define H18 [UIFont systemFontOfSize:18]
#define H17 [UIFont systemFontOfSize:17]
#define H16 [UIFont systemFontOfSize:16]
#define H15 [UIFont systemFontOfSize:15]
#define H14 [UIFont systemFontOfSize:14]
#define H13 [UIFont systemFontOfSize:13]



