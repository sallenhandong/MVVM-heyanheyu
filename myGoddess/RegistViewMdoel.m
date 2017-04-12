//
//  RegistViewMdoel.m
//  myGoddess
//
//  Created by jefactoria on 17/2/7.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "RegistViewMdoel.h"

@implementation RegistViewMdoel
-(instancetype)init
{
    if (self = [super init]) {
        RACSignal *userNameLengthSig = [RACObserve(self, userName)
                                        map:^id(NSString *value) {
                                            if (value.length >= 11)
                                                return @(YES);
                                            return @(NO);
                                        }];
        RACSignal *passwordLengthSig = [RACObserve(self, password)
                                        map:^id(NSString *value) {
                                            if (value.length >= 6) return @(YES);
                                            return @(NO);
                                        }];
        RACSignal *registBtnEnable = [RACSignal combineLatest:@[userNameLengthSig, passwordLengthSig] reduce:^id(NSNumber *userName, NSNumber *password){
            return @([userName boolValue] && [password boolValue]);
        }];
        _registCommand = [[RACCommand alloc]initWithEnabled:registBtnEnable signalBlock:^RACSignal *(id input) {
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    JYAPIClient *client = [[JYAPIClient alloc]init];
                    
                    NSDictionary *param = @{@"username":_userName,
                                            @"password":_password};
                    
                    
                    [client postRegistWithParameters:param Success:^(id responseData) {
                        
                        
                        NSLog(@"%@",responseData);
                        
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
        }];
    }
    return self;
}

@end
