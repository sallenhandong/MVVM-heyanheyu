//
//  UserInfoView.m
//  myGoddess
//
//  Created by jefactoria on 17/2/10.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "UserInfoView.h"
#import "UserInfoViewModel.h"
#import "UserInfoTableViewCell.h"
#import "UserInfoTwoTableViewCell.h"
@interface UserInfoView ()
@property (nonatomic,strong) UserInfoViewModel *viewModel;
@property (nonatomic,strong) NSArray *dataArr;
@end

@implementation UserInfoView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    
    self.viewModel = (UserInfoViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
    
}

-(void)setupViews{
    
    [[self rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate)]subscribeNext:^(RACTuple * x) {
        NSIndexPath *index = x.second;
        if (index.row == 0) {
            
            [self.viewModel.cellClickSubJect sendNext:@"你好"];
            
            
        }else if (index.row == 1){
        
            [self.viewModel.cellClickSubJect sendNext:@"昵称"];
            
        }else{
        
            [self.viewModel.cellClickSubJect sendNext:@"签名"];
        }
        
    }];
    
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.dataArr = @[@"头像",@"昵称",@"签名"];
    self.tableView.bouncesZoom = NO;
    self.tableViewStyle = 0;
    self.tabFrame = CGRectMake(0, 10, SCREEN_WIDTH, self.height - 124);
    self.sectionSum = 1;
    self.rowArray = [NSMutableArray arrayWithObjects:self.dataArr, nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UserInfoTableViewCell"];
    
    [super setupViews];
}

-(UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierNormal = @"UserInfoTableViewCell";
    if (indexPath.row == 0) {
        
        UserInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierNormal];
        if (!cell) {
            NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"UserInfoTableViewCell" owner:nil options:nil];
            cell = [nibs lastObject];
        }
        cell.nickNameLabel.text = self.dataArr[0];
        NSString *filePath = [[NSUserDefaults standardUserDefaults] objectForKey:@"filePath"];
        if (filePath == nil || [filePath isEqualToString:@""]) {
            
            
            cell.headImage.image = [UIImage imageNamed:@"hanwei.jpg"];
        }else{
        
            [cell.headImage sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",filePath]]];
        }
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }else{
    
        UserInfoTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UserInfoTwoTableViewCell"];
        if (!cell) {
            NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"UserInfoTwoTableViewCell" owner:nil options:nil];
            cell = [nibs lastObject];
        }
        cell.nickNameLabel.text = self.dataArr[indexPath.row];
        
        NSString *nickName  = [[NSUserDefaults standardUserDefaults] objectForKey:@"nickName"];
         NSString *description  = [[NSUserDefaults standardUserDefaults] objectForKey:@"description"];
        if (indexPath.row == 1) {
            cell.detailLabel.text = nickName;
        }else{
            cell.detailLabel.text = description;
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }

}


-(CGFloat)rootTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (void)sa_configureViewWithViewModel:(id<SAViewModelProtocol>)viewModel {
    
    [viewModel sa_viewModelWithModelBlcok:^(id model) {
        
      
        
    }];
}
@end
