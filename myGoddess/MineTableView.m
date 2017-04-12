//
//  HomeTableView.m
//  basicFramework
//
//  Created by jefactoria on 17/1/5.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "MineTableView.h"
#import "MineTabViewViewModel.h"
#import "MineTableViewCell.h"
#import "MineHeaderView.h"
#import "UserProfileModel.h"
@interface MineTableView ()
@property (nonatomic,strong) NSArray *commonMethodArray;
@property (nonatomic,strong) NSArray *operateMethodArray;
@property (nonatomic,strong) MineTabViewViewModel *viewModel;
@property (nonatomic,strong) MineHeaderView *topView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation MineTableView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{

    self.viewModel = (MineTabViewViewModel *)viewModel;
    return [super initWithViewModel:viewModel];

}
-(NSArray *)dataArray{

    if (!_dataArray) {
        _dataArray = [[NSArray alloc]init];
    }
    return _dataArray;
}
-(void)setupViews{
  
    [[self rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate)]subscribeNext:^(RACTuple * x) {
        NSIndexPath *index = x.second;
        if (index.section == 1) {
            if (index.row == 1) {
                if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(sa_view:withEvents:url:)]) {
                    [self.viewDelegate sa_view:self withEvents:nil url:ThemeViewControllerUrl];
                }
            }else{
                if (self.dataArray.count > 0) {
                    UserProfileModel *model = [self.dataArray objectAtIndex:0];
                    if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(sa_view:withEvents:url:)]) {
                        [self.viewDelegate sa_view:self withEvents:@{@"fileName":[model.avatar objectForKey:@"fileName"]} url:UserInfoViewControllerUrl];
                    }
                }
            }
            
        }else if (index.section == 2) {
            if (index.row == 0) {
                if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(sa_view:withEvents:url:)]) {
                    [self.viewDelegate sa_view:self withEvents:nil url:SystemNotificationViewControllerUrl];
                }
            }else{
            
                if (self.viewDelegate && [self.viewDelegate respondsToSelector:@selector(sa_view:withEvents:url:)]) {
                    [self.viewDelegate sa_view:self withEvents:nil url:SettingViewControllerUrl];
                }
            
            }
        }else{
            
            
        }
        
    }];
    
 
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.commonMethodArray = @[@"资料修改",
                               @"主题"
                               ];
    self.operateMethodArray = @[@"系统通知",
                                @"设置",
                                ];
    NSArray *arr = [[NSArray alloc]init];
    self.tableView.bouncesZoom = NO;
    self.tableViewStyle = 0;
    self.tabFrame = CGRectMake(0, 10, SCREEN_WIDTH, self.height - 124);
    self.sectionSum = 3;
    self.rowArray = [NSMutableArray arrayWithObjects:arr,self.commonMethodArray,self.operateMethodArray, nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MineTableViewCell"];

    [super setupViews];
}

-(UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierNormal = @"MineTableViewCell";
    MineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierNormal];
    if (!cell) {
        cell = [[MineTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifierNormal];
    }
    cell.titleLabel.text = self.rowArray[indexPath.section][indexPath.row];
    [cell cellAutoLayoutHeight:self.rowArray[indexPath.section][indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(CGFloat)rootTableView:(UITableView *)tableView rootHForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        
        return 180;
    }else{
        
        return 20;
    }
  
}
-(UIView *)rootTableView:(UITableView *)rootTableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc]init];
    if (section == 0) {
        self.topView = [[MineHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
        if (self.dataArray.count > 0) {
            UserProfileModel *model = [self.dataArray objectAtIndex:section];
            self.topView.titleLabel.text = model.nickName;
            
            NSLog(@"·····描述%@",model.detailDescription);
            
            
            self.topView.descriptionLabel.text = model.detailDescription;
            if ([[model.avatar objectForKey:@"filePath"] isEqualToString:@""]) {
                
                self.topView.headImage.image = [UIImage imageNamed:@"hanwei.jpg"];
                
            }else{
                [self.topView.headImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",[model.avatar objectForKey:@"filePath"] ]]];
                
            
            }
            
            [[NSUserDefaults standardUserDefaults]setObject:model.nickName forKey:@"nickName"];
            [[NSUserDefaults standardUserDefaults]setObject:model.detailDescription forKey:@"description"];
             [[NSUserDefaults standardUserDefaults]setObject:[model.avatar objectForKey:@"filePath"]  forKey:@"filePath"];
            [self.topView layoutIfNeeded];
            
      }
        [view addSubview:self.topView];
        return view;
        
    }else if (section == 1) {
        
   
    }else{
     
        
    }
    return nil;
}

-(CGFloat)rootTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (void)sa_configureViewWithViewModel:(id<SAViewModelProtocol>)viewModel {
    
    [viewModel sa_viewModelWithModelBlcok:^(id model) {
        
        self.viewModel = (MineTabViewViewModel*)viewModel;
        
        self.dataArray = self.viewModel.dataArray;
        NSIndexSet *indexSet = [[NSIndexSet alloc]initWithIndex:0];
        [self.tableView reloadSections:indexSet withRowAnimation:UITableViewRowAnimationAutomatic];
        
        
    }];
     
}


@end
