
//
//  JYAPIClient.m
//  WoYaoJiaYou
//
//  Created by jefactoria on 16/5/3.
//  Copyright © 2016年 jefactoria. All rights reserved.
//

#import "JYAPIClient.h"



@implementation JYAPIClient

- (instancetype)init{
    return [self initWithToken];
}

- (instancetype)initWithToken{
    NSURL * url = [NSURL URLWithString:urlHead];
    if (self = [super initWithBaseURL:url]) {
        NSString *str = [[NSUserDefaults standardUserDefaults]objectForKey:@"token"];
        [self produceHTTPSign:str];
    }
  
    return self;
}

/**
 *  生成一个API访问签名
 */
- (void)produceHTTPSign:(NSString *)token{

    AFJSONRequestSerializer *serializer = [AFJSONRequestSerializer serializer];
    self.requestSerializer = serializer;
    [self.requestSerializer setValue: @"application/json" forHTTPHeaderField:@"Content-Type"];
    [self.requestSerializer setValue: @"application/json" forHTTPHeaderField:@"Accept"];
    if(token != nil){
        [self.requestSerializer setValue: token forHTTPHeaderField:@"token"];
    }
}
- (void)postRequest:(NSString *)url
             params:(NSDictionary *)paramDic
            Success:(void(^)(id responseData))success
            failure:(void(^)(NSError *error))failure
        showLoading:(bool) showLoading
        showMessage:(NSString *) message{
    
    [self postRequest:url params:paramDic Success:^(id responseData) {
        if(success){
            success(responseData);
        }
    } responseFailure:nil failure:^(NSError *error) {
        if(failure){
            failure(error);
        }
    } showLoading:showLoading showMessage:message];
}

- (void)postRequest:(NSString *)url
                params:(NSDictionary *)paramDic
               Success:(void(^)(id responseData))success
       responseFailure:(void(^)())responseFailure
               failure:(void(^)(NSError *error))failure
           showLoading:(bool) showLoading
           showMessage:(NSString *) message{

    
    if(showLoading && (message == nil || [message isEqualToString:@""])){
        message = @"加载中";
    }
    
    if(showLoading){
        [MBProgressHUD showMessag:message toView:nil];
    }
    
    
    [self POST:url
    parameters:paramDic
      progress:nil
       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"~~~%@", responseObject);
    
        if ([responseObject[@"IsSuccess"] integerValue] == 1) {
            if (success) {
                success(responseObject[@"Data"]);
            }
        }else{
            NSLog(@"%@",responseObject[@"Message"]);
        
          [MBProgressHUD showError:responseObject[@"Message"] toView:nil];
          if(responseFailure){
                responseFailure();
            }
             
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        NSHTTPURLResponse* r = (NSHTTPURLResponse*)task.response;
        if(r.statusCode == 401){
        
        }
    
        
        if (failure) {
            failure(error);
        }
    }];
}

//- (BOOL)checkNetwork
//{
//    // 如果要检测网络状态的变化,必须用检测管理器的单例的startMonitoring
//    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
//    __block   BOOL network =  network ;  //
//    __block   BOOL change =  change ;  //
//    change = NO;
//    network = NO;
//    
//    // 检测网络连接的单例,网络变化时的回调方法
//    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
//     {
//         switch (status) {
//             case AFNetworkReachabilityStatusNotReachable:
//             {
//                 [MBProgressHUD showError:@"您的网络处于关闭状态，请打开" toView:nil];
//                 network = NO;
//                 change = YES;
//                 break;
//             }
//                 
//             case AFNetworkReachabilityStatusReachableViaWiFi:
//             {
//                 NSLog(@"WiFi网络");
//                 network = YES;
//                 change = YES;
//                 break;
//             }
//                 
//             case AFNetworkReachabilityStatusReachableViaWWAN:
//             {
//                 NSLog(@"无线网络");
//                 network = YES;
//                 change = YES;
//                 break;
//             }
//                 
//             default:
//                 break;
//         }
//     }];
//    
//    return YES;
//}


- (void)postLoginWithParameters:(NSDictionary *)paramDic
                                      Success:(void(^)(id responseData))success
                              responseFailure:(void(^)())responseFailure
                                      failure:(void(^)(NSError *error))failure{
    
    [self postRequest:@"/phone_api/login" params:paramDic Success:^(id responseData) {
        if (success) {
            success(responseData);
        }
    } responseFailure:^{
        if (responseFailure) {
            responseFailure();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }showLoading:NO showMessage:nil];

}
- (void)postRegistWithParameters:(NSDictionary *)paramDic
                        Success:(void(^)(id responseData))success
                responseFailure:(void(^)())responseFailure
                        failure:(void(^)(NSError *error))failure{
    
    [self postRequest:@"/phone_api/register" params:paramDic Success:^(id responseData) {
        if (success) {
            success(responseData);
        }
    } responseFailure:^{
        if (responseFailure) {
            responseFailure();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }showLoading:NO showMessage:nil];
    
}
- (void)postCardImageUrlWithParameters:(NSDictionary *)paramDic
                               Success:(void(^)(id responseData))success
                       responseFailure:(void(^)())responseFailure
                               failure:(void(^)(NSError *error))failure{
    [self postRequest:@"/phone_api/cardUrl" params:paramDic Success:^(id responseData) {
        if (success) {
            success(responseData);
        }
    } responseFailure:^{
        if (responseFailure) {
            responseFailure();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }showLoading:NO showMessage:nil];

}
/** 系统通知*/
- (void)postSystemNotificationWithParameters:(NSDictionary *)paramDic
                                     Success:(void(^)(id responseData))success
                             responseFailure:(void(^)())responseFailure
                                     failure:(void(^)(NSError *error))failure{
    [self postRequest:@"/phone_api/systemNotification" params:paramDic Success:^(id responseData) {
        if (success) {
            success(responseData);
        }
    } responseFailure:^{
        if (responseFailure) {
            responseFailure();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }showLoading:NO showMessage:nil];

}
/** 个人中心*/
- (void)postUserProfileWithParameters:(NSDictionary *)paramDic
                                     Success:(void(^)(id responseData))success
                             responseFailure:(void(^)())responseFailure
                                     failure:(void(^)(NSError *error))failure{
    [self postRequest:@"/phone_api/userProfile" params:paramDic Success:^(id responseData) {
        if (success) {
            success(responseData);
        }
    } responseFailure:^{
        if (responseFailure) {
            responseFailure();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }showLoading:NO showMessage:nil];
    
}
/**上传照片*/
- (void)postUploadImageWithParameters:(NSDictionary *)paramDic
                              Success:(void(^)(id responseData))success
                      responseFailure:(void(^)())responseFailure
                              failure:(void(^)(NSError *error))failure{
    [self postRequest:@"/phone_api/uploadImage" params:paramDic Success:^(id responseData) {
        if (success) {
            success(responseData);
        }
    } responseFailure:^{
        if (responseFailure) {
            responseFailure();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }showLoading:NO showMessage:nil];
    
}
/**修改个人信息*/
- (void)postUpdateUserInfoWithParameters:(NSDictionary *)paramDic
                                 Success:(void(^)(id responseData))success
                         responseFailure:(void(^)())responseFailure
                                 failure:(void(^)(NSError *error))failure{
    [self postRequest:@"/phone_api/updateUserInfo" params:paramDic Success:^(id responseData) {
        if (success) {
            success(responseData);
        }
    } responseFailure:^{
        if (responseFailure) {
            responseFailure();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }showLoading:NO showMessage:nil];

}
/**上传文章*/
- (void)postUploadArticleWithParameters:(NSDictionary *)paramDic
                          Success:(void(^)(id responseData))success
                  responseFailure:(void(^)())responseFailure
                          failure:(void(^)(NSError *error))failure{
    [self postRequest:@"/phone_api/updateArticle" params:paramDic Success:^(id responseData) {
        if (success) {
            success(responseData);
        }
    } responseFailure:^{
        if (responseFailure) {
            responseFailure();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }showLoading:NO showMessage:nil];

}
/**获取用户文章*/
- (void)postUserArticleWithParameters:(NSDictionary *)paramDic
                             Success:(void(^)(id responseData))success
                     responseFailure:(void(^)())responseFailure
                             failure:(void(^)(NSError *error))failure{
    [self postRequest:@"/phone_api/getUserArticle" params:paramDic Success:^(id responseData) {
        if (success) {
            success(responseData);
        }
    } responseFailure:^{
        if (responseFailure) {
            responseFailure();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }showLoading:NO showMessage:nil];

}
/**获取所有用户文章*/
- (void)postAllUserArticleWithParameters:(NSDictionary *)paramDic
                              Success:(void(^)(id responseData))success
                      responseFailure:(void(^)())responseFailure
                              failure:(void(^)(NSError *error))failure{
    [self postRequest:@"/phone_api/getAllUserArticle" params:paramDic Success:^(id responseData) {
        if (success) {
            success(responseData);
        }
    } responseFailure:^{
        if (responseFailure) {
            responseFailure();
        }
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }showLoading:NO showMessage:nil];
    
}


@end

