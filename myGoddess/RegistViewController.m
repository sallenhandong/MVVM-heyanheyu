//
//  RegistViewController.m
//  myGoddess
//
//  Created by jefactoria on 17/2/7.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "RegistViewController.h"
#import "RegistView.h"
#import "RegistViewMdoel.h"
#import "LoginViewController.h"
#import "YYTabBarController.h"
@interface RegistViewController ()
@property (nonatomic,strong) RegistView *registView;
@property (nonatomic,strong) RegistViewMdoel *viewModel;
@end

@implementation RegistViewController
-(RegistView *)registView{
    
    if (!_registView) {
        
        _registView = [[RegistView alloc]init];
    }
    
    return _registView;
}
-(RegistViewMdoel *)viewModel{
    
    if (!_viewModel) {
        
        _viewModel = [[RegistViewMdoel alloc]init];
    }
    
    return _viewModel;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
 
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"注册";
    [self setUpRegistView];
    [self registEvent];
}
-(void)setUpRegistView{
    
    self.registView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view addSubview:self.registView];
    
    
    //返回按钮
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:@"< 返回" forState:UIControlStateNormal];
    backBtn.titleLabel.font = H15;
    [backBtn setTitleColor:black_color forState:UIControlStateNormal];
    backBtn.frame = CGRectMake(10, 30, 50, 30);
    [backBtn addTarget:self action:@selector(leftAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    
}
-(void)registEvent{
    //RAC(TARGET, [KEYPATH, [NIL_VALUE]])：用于给某个对象的某个属性绑定
    RAC(self.viewModel, userName) = self.registView.userNameTextfield.rac_textSignal;
    RAC(self.viewModel, password) = self.registView.passWordTextfield.rac_textSignal;
    //rac_command：一般用来绑定button
    self.registView.registButton.rac_command = self.viewModel.registCommand;
    [[self.viewModel.registCommand executionSignals]
     subscribeNext:^(RACSignal *x) {
         //也可以在此处设置loading
         [x subscribeNext:^(NSString *x) {
             [MBProgressHUD hideHUDForView:nil animated:YES];
             NSLog(@"``````%@",x);
             if (x == nil) {
                 return;
             }else if ([x isEqualToString:@"success"]){
                 
                 [self performSelector:@selector(popLoginVC) withObject:self afterDelay:0.2];
             }
             
         }];
     }];

    
    @weakify(self);
    
    [self.registView.userNameTextfield.rac_textSignal subscribeNext:^(NSString * x){
        
        static NSInteger const maxIntegerlength = 11;
        if (x.length) {
            if (x.length > 11) {
                @strongify(self);
                self.registView.userNameTextfield.text = [self.registView.userNameTextfield.text substringToIndex:maxIntegerlength];
            }
            
        }
    }];
    
    [self.registView.passWordTextfield.rac_textSignal subscribeNext:^(NSString * x){
        
        static NSInteger const maxIntegerlength = 20;
        if (x.length) {
            if (x.length > 20) {
                @strongify(self);
                self.registView.passWordTextfield.text = [self.registView.passWordTextfield.text substringToIndex:maxIntegerlength];
            }
            
        }
    }];
    
}
-(void)popLoginVC{
    
    [DCURLRouter popToRootViewControllerAnimated:YES];
    
}
- (void)leftAction{
    [DCURLRouter popToRootViewControllerAnimated:YES];
    
    NSLog(@"点击返回");
    
    
    
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
