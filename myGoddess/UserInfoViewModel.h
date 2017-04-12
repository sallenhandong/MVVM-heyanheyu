//
//  UserInfoViewModel.h
//  myGoddess
//
//  Created by jefactoria on 17/2/10.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserInfoViewModel : BaseViewModel
@property (nonatomic,strong) RACSubject *cellClickSubJect;
@property (nonatomic,strong) NSString *fileName;
@end
