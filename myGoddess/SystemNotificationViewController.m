//
//  SystemNotificationViewController.m
//  myGoddess
//
//  Created by jefactoria on 17/2/9.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "SystemNotificationViewController.h"
#import "SyestemNotificationView.h"
#import "SystemNotificationViewMdoel.h"
@interface SystemNotificationViewController ()
@property (nonatomic,strong) SyestemNotificationView *mainTab;
@property (nonatomic,strong) SystemNotificationViewMdoel *viewModel;
@end

@implementation SystemNotificationViewController
- (SystemNotificationViewMdoel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[SystemNotificationViewMdoel alloc]init];
    }
    return _viewModel;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.title = @"系统通知";
    self.tabBarController.tabBar.hidden = YES;
//    //返回按钮
//    UIBarButtonItem *leftItem = [UIBarButtonItem buttonWithNoramalImageName:@"nav_back@2x" highlightImageName:@"nav_back@2x" target:self action:@selector(leftAction) isCustom:YES];
//    self.navigationItem.leftBarButtonItem = leftItem;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)addSubviews{
    
    self.mainTab = [[SyestemNotificationView alloc]initWithViewModel:self.viewModel];
    [self.view addSubview:self.mainTab];
    
}
-(void)bindViewModel{

    // 根据viewModel配置tabview
    [self.mainTab sa_configureViewWithViewModel:self.viewModel];
}
- (void)leftAction{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
