//
//  UpdateUserInfoViewController.m
//  myGoddess
//
//  Created by jefactoria on 17/2/11.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "UpdateUserInfoViewController.h"
#import "UpdateUserInfoView.h"
@interface UpdateUserInfoViewController ()
@property (nonatomic,strong) UpdateUserInfoView *userInfoView;
@end

@implementation UpdateUserInfoViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
      self.navigationItem.title = [self.params objectForKey:@"tittle"];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.frame = CGRectMake(0, 0, 50, 30);
    [rightButton setTitle:@"完成" forState:UIControlStateNormal];
    [rightButton setTitleColor:white_color forState:UIControlStateNormal];
    [rightButton addTarget:self action:@selector(comfirmClick)forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem= rightItem;
}
-(void)addSubviews{

    self.userInfoView = [[UpdateUserInfoView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:self.userInfoView];
    NSString *nickName  = [[NSUserDefaults standardUserDefaults] objectForKey:@"nickName"];
    NSString *description  = [[NSUserDefaults standardUserDefaults] objectForKey:@"description"];
    self.userInfoView.nickNameTextField.text = nickName;
    self.userInfoView.signTextView.text = description;
    if ([[self.params objectForKey:@"tittle"] isEqualToString:@"昵称"]) {
        
        self.userInfoView.signTextView.hidden = YES;
        
    }else{
    
        self.userInfoView.nickNameTextField.hidden = YES;
    }
    

}
-(void)comfirmClick{

    NSDictionary *param = @{};
    
    if (self.userInfoView.nickNameTextField.text.length > 0 && self.userInfoView.signTextView.hidden == YES) {
        
        param = @{@"nickName":self.userInfoView.nickNameTextField.text};
    }
    if (self.userInfoView.signTextView.text.length > 0 && self.userInfoView.nickNameTextField.hidden == YES) {
        
        param = @{@"detailDescription":self.userInfoView.signTextView.text};
    }

    
    JYAPIClient *client = [[JYAPIClient alloc]init];
  
    
    [client postUpdateUserInfoWithParameters:param Success:^(id responseData) {
        
        if ([responseData objectForKey:@""]) {
            [[NSUserDefaults standardUserDefaults]setObject:[responseData objectForKey:@"nickName"] forKey:@"nickName"];
         
        }else{
        
            [[NSUserDefaults standardUserDefaults]setObject:[responseData objectForKey:@"detailDescription"] forKey:@"description"];
            
        
        }
        
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
        
        
    } responseFailure:^{
        
        
    } failure:^(NSError *error) {
        
        
    }];
}
-(void)bindViewModel{
    
    @weakify(self);
    
    [self.userInfoView.nickNameTextField.rac_textSignal subscribeNext:^(NSString * x){
        
        static NSInteger const maxIntegerlength = 10;
        if (x.length) {
            if (x.length > 10) {
                @strongify(self);
                self.userInfoView.nickNameTextField.text = [self.userInfoView.nickNameTextField.text substringToIndex:maxIntegerlength];
            }
            
        }
    }];
    [self.userInfoView.signTextView.rac_textSignal subscribeNext:^(NSString * x){
        
        static NSInteger const maxIntegerlength = 50;
        if (x.length) {
            if (x.length > 50) {
                @strongify(self);
                self.userInfoView.signTextView.text = [self.userInfoView.signTextView.text substringToIndex:maxIntegerlength];
            }
            
        }
    }];
    
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
