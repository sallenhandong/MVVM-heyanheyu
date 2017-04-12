//
//  HomeArticleContents.m
//  myGoddess
//
//  Created by jefactoria on 17/2/13.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "HomeArticleContents.h"

@implementation HomeArticleContents
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
