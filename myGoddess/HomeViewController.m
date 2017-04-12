//
//  HomeViewController.m
//  sallenReactiveCocoa
//
//  Created by jefactoria on 16/12/28.
//  Copyright © 2016年 djmulder. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewModel.h"
#import "HomeTabView.h"
@interface HomeViewController ()
@property (nonatomic,strong) HomeViewModel *viewModel;
@property (nonatomic,strong) HomeTabView *mainTab;
@end

@implementation HomeViewController
- (HomeViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[HomeViewModel alloc]init];
    }
    return _viewModel;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.title = @"首页";
    // 根据viewModel配置tabview
    [self.mainTab sa_configureViewWithViewModel:self.viewModel];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
}
-(void)addSubviews{
    
    self.mainTab = [[HomeTabView alloc]initWithViewModel:self.viewModel];
    [self.view addSubview:self.mainTab];
    
}
-(void)bindViewModel{
    
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
