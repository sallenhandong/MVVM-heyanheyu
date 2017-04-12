//
//  UserProfileModel.m
//  myGoddess
//
//  Created by jefactoria on 17/2/11.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "UserProfileModel.h"

@implementation UserProfileModel
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
