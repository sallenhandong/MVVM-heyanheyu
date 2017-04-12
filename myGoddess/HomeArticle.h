//
//  HomeArticle.h
//  myGoddess
//
//  Created by jefactoria on 17/2/13.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeArticle : NSObject
@property (nonatomic,strong) NSString *user_id;
@property (nonatomic,strong) NSString *_id;
@property (nonatomic,strong) NSArray *contents;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)cattractionsWithDict:(NSDictionary *)dict;
@end
