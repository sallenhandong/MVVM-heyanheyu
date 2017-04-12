//
//  JYAPIClient.h
//  WoYaoJiaYou
//
//  Created by jefactoria on 16/5/3.
//  Copyright © 2016年 jefactoria. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface JYAPIClient : AFHTTPSessionManager

@property (nonatomic,assign) BOOL isIgnoreNetworkAlert;

/**添加构造方法*/
- (instancetype)initWithToken;
/** 登陆*/
- (void)postLoginWithParameters:(NSDictionary *)paramDic
                                      Success:(void(^)(id responseData))success
                              responseFailure:(void(^)())responseFailure
                                      failure:(void(^)(NSError *error))failure;
/** 注册*/
- (void)postRegistWithParameters:(NSDictionary *)paramDic
                        Success:(void(^)(id responseData))success
                responseFailure:(void(^)())responseFailure
                        failure:(void(^)(NSError *error))failure;
/** 卡片url*/
- (void)postCardImageUrlWithParameters:(NSDictionary *)paramDic
                         Success:(void(^)(id responseData))success
                 responseFailure:(void(^)())responseFailure
                         failure:(void(^)(NSError *error))failure;
/** 系统通知*/
- (void)postSystemNotificationWithParameters:(NSDictionary *)paramDic
                               Success:(void(^)(id responseData))success
                       responseFailure:(void(^)())responseFailure
                               failure:(void(^)(NSError *error))failure;
/** 个人中心*/
- (void)postUserProfileWithParameters:(NSDictionary *)paramDic
                              Success:(void(^)(id responseData))success
                      responseFailure:(void(^)())responseFailure
                              failure:(void(^)(NSError *error))failure;
/**上传照片*/
- (void)postUploadImageWithParameters:(NSDictionary *)paramDic
                              Success:(void(^)(id responseData))success
                      responseFailure:(void(^)())responseFailure
                              failure:(void(^)(NSError *error))failure;
/**修改个人信息*/
- (void)postUpdateUserInfoWithParameters:(NSDictionary *)paramDic
                              Success:(void(^)(id responseData))success
                      responseFailure:(void(^)())responseFailure
                              failure:(void(^)(NSError *error))failure;
/**上传文章*/
- (void)postUploadArticleWithParameters:(NSDictionary *)paramDic
                                 Success:(void(^)(id responseData))success
                         responseFailure:(void(^)())responseFailure
                                 failure:(void(^)(NSError *error))failure;
/**获取用户文章*/
- (void)postUserArticleWithParameters:(NSDictionary *)paramDic
                          Success:(void(^)(id responseData))success
                  responseFailure:(void(^)())responseFailure
                          failure:(void(^)(NSError *error))failure;
/**获取所有用户文章*/
- (void)postAllUserArticleWithParameters:(NSDictionary *)paramDic
                                 Success:(void(^)(id responseData))success
                         responseFailure:(void(^)())responseFailure
                                 failure:(void(^)(NSError *error))failure;
@end
