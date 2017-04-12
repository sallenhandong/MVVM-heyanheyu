//
//  代码地址：https://github.com/VictDog/YYTheme
//  作者地址：https://github.com/VictDog/
//
//  YYAddController.m
//  YYTheme
//
//  Created by Mac on 2016.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "YYAddController.h"

@interface YYAddController ()
@property (weak, nonatomic) IBOutlet UITextField *tittleTextField;
@property (weak, nonatomic) IBOutlet UITextView *articleTextView;

@end

@implementation YYAddController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)bindViewModel{

    @weakify(self);
    
    [self.tittleTextField.rac_textSignal subscribeNext:^(NSString * x){
        
        static NSInteger const maxIntegerlength = 30;
        if (x.length) {
            if (x.length > 30) {
                @strongify(self);
                self.tittleTextField.text = [self.tittleTextField.text substringToIndex:maxIntegerlength];
            }
            
        }
    }];
    [self.articleTextView.rac_textSignal subscribeNext:^(NSString * x){
        
        static NSInteger const maxIntegerlength = 1000;
        if (x.length) {
            if (x.length > 1000) {
                @strongify(self);
                self.articleTextView.text = [self.articleTextView.text substringToIndex:maxIntegerlength];
            }
            
        }
    }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)publish:(id)sender {
    
    
    JYAPIClient *client = [[JYAPIClient alloc]init];
    NSDictionary *param = @{@"tittle":self.tittleTextField.text,@"content":self.articleTextView.text,@"isShow":@(1)};
    
    
    [client postUploadArticleWithParameters:param Success:^(id responseData) {
        
        
    } responseFailure:^{
        
        
    } failure:^(NSError *error) {
        
        
    }];
    
    
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
