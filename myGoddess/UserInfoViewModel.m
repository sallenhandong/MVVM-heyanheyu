//
//  UserInfoViewModel.m
//  myGoddess
//
//  Created by jefactoria on 17/2/10.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "UserInfoViewModel.h"

@implementation UserInfoViewModel
- (RACSubject *)cellClickSubJect {
    
    if (!_cellClickSubJect) {
        
        _cellClickSubJect = [RACSubject subject];
    }
    
    return _cellClickSubJect;
}
-(void)sa_viewModelWithModelBlcok:(void (^)(id))modelBlock{
    
    JYAPIClient *client = [[JYAPIClient alloc] init];
    
    NSDictionary *param = @{@"fileName":self.fileName};
    
    [client postUploadImageWithParameters:param Success:^(id responseData) {
    
        NSLog(@"服务器返回%@",responseData);
        
        
        
    } responseFailure:^{
        
        
    } failure:^(NSError *error) {
        
        
    }];
    
    
    
    
}

@end
