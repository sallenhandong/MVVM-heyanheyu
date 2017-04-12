//
//  UserInfoViewController.m
//  myGoddess
//
//  Created by jefactoria on 17/2/10.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "UserInfoViewController.h"
#import "UserInfoViewModel.h"
#import "UserInfoView.h"
#include <CommonCrypto/CommonCrypto.h>
#import "QN_GTM_Base64.h"
@interface UserInfoViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property(nonatomic,strong)UserInfoView *mainTab;
@property(nonatomic,strong)UserInfoViewModel *viewModel;
@property (strong, nonatomic) UIAlertController *actionSheet;
@property (nonatomic , assign) int expires;
@property(nonatomic,strong)NSString *token;
@property(nonatomic,strong)NSString *uuidString;
@property(nonatomic,strong)NSString *goddessFilekey;
@property(nonatomic,strong)NSString *goddessImageName;
@property (nonatomic, assign)NSUInteger sourceType;//相机类型
@property(nonatomic,strong)QNUploadManager *upManager;
@end

@implementation UserInfoViewController

- (UserInfoViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[UserInfoViewModel alloc]init];
    }
    return _viewModel;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.title = @"资料修改";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    if ([[self.params objectForKey:@"fileName"] isEqualToString:@""]) {
        
        self.goddessImageName = [self getUniqueStrByUUID];
        self.goddessFilekey = @"mygoddess";
    }else{
        
        
        self.goddessImageName = [self.params objectForKey:@"fileName"];
        self.goddessFilekey = [NSString stringWithFormat:@"mygoddess:%@",self.goddessImageName ];
        
    }
    NSLog(@"%@",[self.params objectForKey:@"fileName"]);
    self.upManager = [[QNUploadManager alloc]init];
    [self makeToken:QINIUAk secretKey:QINIUSK];
}
- (NSString *)makeToken:(NSString *)accessKey secretKey:(NSString *)secretKey
{
    const char *secretKeyStr = [secretKey UTF8String];
    
    NSString *policy = [self marshal];
    
    NSData *policyData = [policy dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *encodedPolicy = [QN_GTM_Base64 stringByWebSafeEncodingData:policyData padded:TRUE];
    const char *encodedPolicyStr = [encodedPolicy cStringUsingEncoding:NSUTF8StringEncoding];
    
    char digestStr[CC_SHA1_DIGEST_LENGTH];
    bzero(digestStr, 0);
    
    
    CCHmac(kCCHmacAlgSHA1, secretKeyStr, strlen(secretKeyStr), encodedPolicyStr, strlen(encodedPolicyStr), digestStr);
    
    NSString *encodedDigest = [QN_GTM_Base64 stringByWebSafeEncodingBytes:digestStr length:CC_SHA1_DIGEST_LENGTH padded:TRUE];
    
    self.token = [NSString stringWithFormat:@"%@:%@:%@",  accessKey, encodedDigest, encodedPolicy];
    
    
    return self.token;//得到了token
}
- (NSString *)marshal
{
    time_t deadline;
    time(&deadline);//返回当前系统时间
    
    deadline += (self.expires > 0) ? self.expires : 3600; // +3600秒,即默认token保存1小时.
    
    
    NSNumber *deadlineNumber = [NSNumber numberWithLongLong:deadline];
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    [dic setObject:self.goddessFilekey forKey:@"scope"];
    
    [dic setObject:deadlineNumber forKey:@"deadline"];
    
    
    NSString *json = [dic mj_JSONString];
    
    return json;
}
//生成uuid
- (NSString *)getUniqueStrByUUID
{
    CFUUIDRef    uuidObj = CFUUIDCreate(nil);//create a new UUID
    
    //get the string representation of the UUID
    
    NSString *str = (__bridge_transfer NSString *)CFUUIDCreateString(nil, uuidObj);
    
    CFRelease(uuidObj);
    
    return str ;
    
}
-(void)addSubviews{
    
    self.mainTab = [[UserInfoView alloc]initWithViewModel:self.viewModel];
    [self.view addSubview:self.mainTab];
    
}
-(void)bindViewModel{
    
    @weakify(self);
    [[self.viewModel.cellClickSubJect takeUntil:self.rac_willDeallocSignal ]subscribeNext:^(id x) {
        
        @strongify(self);
       
   
        if ([x isEqualToString:@"昵称"]) {
            
            [DCURLRouter pushURLString:[NSString stringWithFormat:@"%@?tittle=昵称",UpdateUserInfoViewControllerUrl] animated:YES];
            
        }else if ([x isEqualToString:@"签名"]){
            
           [DCURLRouter pushURLString:[NSString stringWithFormat:@"%@?tittle=签名",UpdateUserInfoViewControllerUrl] animated:YES];
        
        }else{
        
            if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
                
                _actionSheet = [UIAlertController alertControllerWithTitle: @"选择图像"                                                                             message: nil                                                                       preferredStyle:UIAlertControllerStyleActionSheet];
                _sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                //添加Button
                [_actionSheet addAction: [UIAlertAction actionWithTitle: @"拍照" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                    _sourceType =UIImagePickerControllerSourceTypeCamera;
                    
                    // 跳转到相机或相册页面
                    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
                    imagePickerController.delegate = self;
                    imagePickerController.allowsEditing = YES;
                    imagePickerController.sourceType = _sourceType;
                    imagePickerController.navigationController.navigationBarHidden = YES;
                    [self presentViewController:imagePickerController animated:YES completion:^{
                        
                    }];
                }]];
                [_actionSheet addAction: [UIAlertAction actionWithTitle: @"从相册选取" style: UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                    //处理点击从相册选取
                    _sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                    // 跳转到相机或相册页面
                    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
                    imagePickerController.delegate = self;
                    imagePickerController.allowsEditing = YES;
                    imagePickerController.sourceType = _sourceType;
                    
                    [self presentViewController:imagePickerController animated:YES completion:^{
                        
                    }];
                }]];
                [_actionSheet addAction: [UIAlertAction actionWithTitle: @"取消" style: UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                    
                }]];
                
                
            }else{
                self.actionSheet = [UIAlertController alertControllerWithTitle: @"选择图像"                                                                             message: nil                                                                       preferredStyle:UIAlertControllerStyleActionSheet];
            }
            [self presentViewController: _actionSheet animated: YES completion: nil];
           
        }
    }];
    
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    picker.allowsEditing = YES;
    //当选择的类型是图片
    if ([type isEqualToString:@"public.image"] == NO)
    {
        return;
    }
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    NSData *data;
    // 绘制改变大小的图片
    UIGraphicsBeginImageContext(CGSizeMake(200, 200));
    // 从当前context中创建一个改变大小后的图片
    //    UIImage* scaledImage =UIGraphicsGetImageFromCurrentImageContext();
    //    // 使当前的context出堆栈
    //    UIGraphicsEndImageContext();
    //返回为JPEG图像
    if (UIImagePNGRepresentation(image) == nil)
    {
        data = UIImageJPEGRepresentation(image, 0.75);
    }
    else
    {
        data = UIImageJPEGRepresentation(image,0.75);
    }
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self.upManager putData:data key:self.goddessImageName token:self.token complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
        
        NSLog(@"七牛错误信息%@", info.error);
        NSLog(@"七牛返回信息%@", resp);
        if ([resp objectForKey:@"key"] != nil ||![[resp objectForKey:@"key"] isEqualToString:@""]) {
            
            self.viewModel.fileName = key;
            // 根据viewModel配置tabview
            [self.mainTab sa_configureViewWithViewModel:self.viewModel];
        }
    
    } option:nil];
    
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
