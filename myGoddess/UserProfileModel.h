//
//  UserProfileModel.h
//  myGoddess
//
//  Created by jefactoria on 17/2/11.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserProfileModel : NSObject
@property (nonatomic,strong) NSString *_id;
@property (nonatomic,strong) NSString *detailDescription;
@property (nonatomic,strong) NSString *nickName;
@property (nonatomic,strong) NSDictionary *avatar;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)cattractionsWithDict:(NSDictionary *)dict;
@end
