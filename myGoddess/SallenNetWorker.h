//
//  SallenNetWorker.h
//  sallenReactiveCocoa
//
//  Created by jefactoria on 16/12/28.
//  Copyright © 2016年 djmulder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SallenNetWorker : NSObject
//登录事件   返回一个信号
+(RACSignal *)loginWithUserName:(NSString *) userName password:(NSString *)password;

@end
