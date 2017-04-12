//
//  HomeTabViewViewModel.h
//  basicFramework
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface MineTabViewViewModel :BaseViewModel
@property (nonatomic,strong) RACSubject *cellClickSubJect;
@property (nonatomic,strong) NSString *backgoundColor;
@property (nonatomic,strong) RACCommand *cellClickCommand;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end
