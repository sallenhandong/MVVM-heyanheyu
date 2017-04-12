//
//  RegistViewMdoel.h
//  myGoddess
//
//  Created by jefactoria on 17/2/7.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RegistViewMdoel : NSObject
@property(nonatomic, copy) NSString *userName;
@property(nonatomic, copy) NSString *password;
@property(nonatomic, strong, readonly) RACCommand *registCommand;
@end
