//
//  HomeViewModel.m
//  myGoddess
//
//  Created by jefactoria on 17/2/13.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "HomeViewModel.h"
#import "HomeArticleContents.h"
#import "HomeArticle.h"
@implementation HomeViewModel

-(NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
    
}
-(NSMutableArray *)res{
    
    if (!_res) {
        
        _res = [[NSMutableArray alloc]init];
    }
    return _res;
    
}
-(void)sa_viewModelWithModelBlcok:(void (^)(id))modelBlock{
    
    JYAPIClient *client = [[JYAPIClient alloc] init];
    [client postUserArticleWithParameters:nil Success:^(id responseData) {
        self.res = [responseData copy];
        [self.dataArray removeAllObjects];
        if (self.res && self.res.count > 0) {
            
            NSArray *resArray = [self.res[0] objectForKey:@"contents"];
            if (resArray && resArray.count > 0) {
                
                
                for (NSDictionary *dict in resArray) {
                    
                    HomeArticleContents *model = [HomeArticleContents cattractionsWithDict:dict];
                    
                    [self.dataArray addObject:model];
                }
                
            }
            
        }     
        if (modelBlock) {
            
            modelBlock(self.dataArray);
        }
    } responseFailure:^{
        
        
    } failure:^(NSError *error) {
        
        
    }];
    
    
}
@end
