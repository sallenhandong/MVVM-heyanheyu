//
//  SquareModel.h
//  myGoddess
//
//  Created by jefactoria on 17/2/14.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SquareModel : NSObject
@property (nonatomic,strong) NSString *tittle;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *createTime;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)cattractionsWithDict:(NSDictionary *)dict;
@end
