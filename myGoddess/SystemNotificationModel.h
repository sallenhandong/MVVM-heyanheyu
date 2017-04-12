//
//  SystemNotificationModel.h
//  myGoddess
//
//  Created by jefactoria on 17/2/9.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SystemNotificationModel : NSObject
@property (nonatomic,strong) NSString *tittle;
@property (nonatomic,strong) NSString *detail;
@property (nonatomic,strong) NSString *webUrl;
@property (nonatomic,strong) NSString *createTime;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)cattractionsWithDict:(NSDictionary *)dict;
@end
