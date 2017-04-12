//
//  SystemNotificationViewMdoel.m
//  myGoddess
//
//  Created by jefactoria on 17/2/9.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "SystemNotificationViewMdoel.h"
#import "SystemNotificationModel.h"
@implementation SystemNotificationViewMdoel
-(NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
    
}

-(void)sa_viewModelWithModelBlcok:(void (^)(id))modelBlock{
    
    JYAPIClient *client = [[JYAPIClient alloc] init];
    [client postSystemNotificationWithParameters:nil Success:^(id responseData) {
        
        NSArray *arr = [NSArray arrayWithArray:responseData];
        NSLog(@"```````%@",arr);
        for (NSDictionary *dict in arr) {
            
            SystemNotificationModel *model = [SystemNotificationModel cattractionsWithDict:dict];
            
            [self.dataArray addObject:model];
        }
        if (modelBlock) {
            
            modelBlock(self.dataArray);
        }
    } responseFailure:^{
        
        
    } failure:^(NSError *error) {
        
        
    }];
  
    
}
@end
