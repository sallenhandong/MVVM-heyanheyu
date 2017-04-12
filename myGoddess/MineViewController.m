//
//  MineViewController.m
//  myGoddess
//
//  Created by jefactoria on 17/2/7.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "MineViewController.h"
#import "MineHeaderView.h"
#import "MineTabViewViewModel.h"
#import "MineTableView.h"
@interface MineViewController ()
@property(nonatomic,strong)MineTableView *mainTab;
@property(nonatomic,strong)MineHeaderView *homeTopView;
@property(nonatomic,strong)MineTabViewViewModel *viewModel;
@property(nonatomic,strong)SAViewManager *viewManager;
@end

@implementation MineViewController
- (SAViewManager *)viewManager {
    if (_viewManager == nil) {
        _viewManager = [[SAViewManager alloc]init];
    }
    return _viewManager;
}
- (MineTabViewViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[MineTabViewViewModel alloc]init];
    }
    return _viewModel;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
     self.tabBarController.tabBar.hidden = NO;
    self.navigationItem.title = @"我的";
    
    // 根据viewModel配置tabview
    [self.mainTab sa_configureViewWithViewModel:self.viewModel];
}
-(void)addSubviews{
  
    self.mainTab = [[MineTableView alloc]initWithViewModel:self.viewModel];
    [self.view addSubview:self.mainTab];
    
}
-(void)registEvent{
    
    [self.mainTab sa_viewWithViewManger:self.viewManager];
    
}

-(void)bindViewModel{
    
  
   
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registEvent];
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
