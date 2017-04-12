//
//  HomeArticleContents.h
//  myGoddess
//
//  Created by jefactoria on 17/2/13.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeArticleContents : NSObject
//"_id" = 58a164158c27e20aac72dbb2;
//content = "\U8bf7\U8f93\U5165\U6b63\U6587sdsdsjkaghsaghagjkghsadcghashgdkaj";
//createTime = 1486971925422;
//isShow = 1;
//tittle = Hansen;
@property (nonatomic,strong) NSString *_id;
@property (nonatomic,strong) NSString *content;
@property (nonatomic,strong) NSString *createTime;
@property (nonatomic,assign) int isShow;
@property (nonatomic,strong) NSString *tittle;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)cattractionsWithDict:(NSDictionary *)dict;
@end
