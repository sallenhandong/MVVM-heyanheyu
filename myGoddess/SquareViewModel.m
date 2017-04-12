//
//  SquareViewModel.m
//  myGoddess
//
//  Created by jefactoria on 17/2/14.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "SquareViewModel.h"
#import "SquareModel.h"
@implementation SquareViewModel
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
    [client postAllUserArticleWithParameters:nil Success:^(id responseData) {
        self.res = [responseData copy];
        [self.dataArray removeAllObjects];
        if (self.res && self.res.count > 0) {
            for (int i = 0; i<self.res.count; i++) {
                
                NSArray *resArray = [self.res[i] objectForKey:@"contents"];
                
                if (resArray && resArray.count > 0) {
                    
                    for (NSDictionary *dict in resArray) {
                        
                        SquareModel *model = [SquareModel cattractionsWithDict:dict];
                        
                        [self.dataArray addObject:model];
                        
                    }
                    
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
