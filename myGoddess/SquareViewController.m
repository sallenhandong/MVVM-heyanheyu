//
//  SquareViewController.m
//  myGoddess
//
//  Created by jefactoria on 17/2/14.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "SquareViewController.h"
#import "SquareViewModel.h"
#import "SquareTabView.h"
@interface SquareViewController ()
@property (nonatomic,strong) SquareTabView *mainTab;
@property (nonatomic,strong) SquareViewModel *viewModel;
@end

@implementation SquareViewController
- (SquareViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[SquareViewModel alloc]init];
    }
    return _viewModel;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.title = @"广场";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)addSubviews{
    
    self.mainTab = [[SquareTabView alloc]initWithViewModel:self.viewModel];
    [self.view addSubview:self.mainTab];
    
}
-(void)bindViewModel{

    // 根据viewModel配置tabview
    [self.mainTab sa_configureViewWithViewModel:self.viewModel];

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
