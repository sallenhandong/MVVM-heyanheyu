//
//  SystemNotificationModel.m
//  myGoddess
//
//  Created by jefactoria on 17/2/9.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "SystemNotificationModel.h"

@implementation SystemNotificationModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
-(instancetype)initWithDict:(NSDictionary *)dict{
    
    if (self = [super init]) {
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return self;
}

+(instancetype)cattractionsWithDict:(NSDictionary *)dict{
    
    return [[self alloc] initWithDict:dict];
}
@end
