//
//  HomeTabViewViewModel.m
//  basicFramework
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "MineTabViewViewModel.h"
#import "UserProfileModel.h"
@implementation MineTabViewViewModel
-(NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
    
}
- (RACSubject *)cellClickSubJect {
    
    if (!_cellClickSubJect) {
        
        _cellClickSubJect = [RACSubject subject];
    }
    
    return _cellClickSubJect;
}

- (RACCommand *)cellClickCommand{


    if (!_cellClickCommand) {
        
        _cellClickCommand = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
            
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    [subscriber sendNext:@"change"];
                    [subscriber sendCompleted];
                });
                return nil;
            }];
            
        }];
    }
    return _cellClickCommand;
}
-(void)sa_viewModelWithModelBlcok:(void (^)(id))modelBlock{
    
    [self.dataArray removeAllObjects];
    
    JYAPIClient *client = [[JYAPIClient alloc] init];
    [client postUserProfileWithParameters:nil Success:^(id responseData) {
        
        NSLog(@"返回个人信息%@",responseData);
        
        UserProfileModel *model = [UserProfileModel cattractionsWithDict:responseData];
        
        [self.dataArray addObject:model];
        
        if (modelBlock) {
            
            modelBlock(self.dataArray);
        }
        
    } responseFailure:^{
        
        
    } failure:^(NSError *error) {
        
        
    }];
    
    
    
    
}


@end
