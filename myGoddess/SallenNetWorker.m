//
//  SallenNetWorker.m
//  sallenReactiveCocoa
//
//  Created by jefactoria on 16/12/28.
//  Copyright © 2016年 djmulder. All rights reserved.
//

#import "SallenNetWorker.h"
@implementation SallenNetWorker

+(RACSignal *)loginWithUserName:(NSString *) userName password:(NSString *)password
{
    //RACSubscriber 订阅者
   // RACDisposable 用于取消订阅或者清理资源，当信号发送完成或者发送错误的时候，就会自动触发它。
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           
            JYAPIClient *client = [[JYAPIClient alloc]init];
            
            NSDictionary *param = @{@"username":userName,
                                    @"password":password};
            
            
            [client postLoginWithParameters:param Success:^(id responseData) {
                
                NSString *token = [responseData objectForKey:@"token"];
                [[NSUserDefaults standardUserDefaults]setObject:token forKey:@"token"];
                
                
                [subscriber sendNext:@"success"];
                [subscriber sendCompleted];
                
            } responseFailure:^{
                [subscriber sendNext:@"faild"];
                [subscriber sendCompleted];
                
            } failure:^(NSError *error) {
                [subscriber sendCompleted];
                
            }];
          
            
        });
        return nil;
    }];
}



@end
