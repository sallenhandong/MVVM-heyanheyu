//
//  SettingViewController.m
//  myGoddess
//
//  Created by jefactoria on 17/2/10.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "SettingViewController.h"
#import "LoginViewController.h"
#import "SettingViewModel.h"
#import "SettingTabView.h"
@interface SettingViewController ()
@property (nonatomic,strong) SettingTabView *mainTab;
@property (nonatomic,strong) SettingViewModel *viewModel;
@end

@implementation SettingViewController

- (SettingViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[SettingViewModel alloc]init];
    }
    return _viewModel;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.title = @"设置";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createChildView];
    
}
-(void)addSubviews{
    
    self.mainTab = [[SettingTabView alloc]initWithViewModel:self.viewModel];
    [self.view addSubview:self.mainTab];
    
}

-(void)createChildView{
    
    float red  = [[[NSUserDefaults standardUserDefaults] objectForKey:@"redColor"] floatValue];
    float green = [[[NSUserDefaults standardUserDefaults] objectForKey:@"greenColor"] floatValue];
    float blue  = [[[NSUserDefaults standardUserDefaults] objectForKey:@"blueColor"] floatValue];
    NSString *themeColor = [[NSUserDefaults standardUserDefaults] objectForKey:@"redColor"];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(SCREEN_WIDTH/4, 300, SCREEN_WIDTH/2, 40);
    [button setTitle:@"退出" forState:UIControlStateNormal];
    [button setTitleColor:white_color forState:UIControlStateNormal];
    if (themeColor == nil || [themeColor isEqualToString:@""]) {
        
        
        [button setBackgroundColor:[UIColor orangeColor]];
        
    }else{
        [button setBackgroundColor:[UIColor colorWithRed:red green:green blue:blue alpha:1]];
        
    }
  
    [button addTarget:self action:@selector(exitButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];


}
-(void)exitButtonClick{


    NSString *title = NSLocalizedString(@"确定退出?", nil);
    NSString *cancelButtonTitle = NSLocalizedString(@"取消", nil);
    NSString *otherButtonTitle = NSLocalizedString(@"确定", nil);
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelButtonTitle style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        
        
    }];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:otherButtonTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"token"];
        
        
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:[[LoginViewController alloc]init]];
        [[UIApplication sharedApplication] keyWindow].rootViewController = nav;
        
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
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
