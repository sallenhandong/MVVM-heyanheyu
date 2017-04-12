//
//  SettingTabView.m
//  myGoddess
//
//  Created by jefactoria on 17/2/14.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "SettingTabView.h"
#import "SettingViewModel.h"
#import "SettingTableViewCell.h"
@interface SettingTabView ()
@property (nonatomic,strong) NSArray *tittleArray;
@property (nonatomic,strong) SettingViewModel *viewModel;
@property (nonatomic,strong) NSArray *dataArray;
@end@implementation SettingTabView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    
    self.viewModel = (SettingViewModel *)viewModel;
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
//        NSIndexPath *index = x.second;
 
        
    }];
    
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tittleArray = @[@"关于我们",
                         @"意见反馈",
                         @"版本号"
                         ];
    self.tableView.bouncesZoom = NO;
    self.tableViewStyle = 0;
    self.tabFrame = CGRectMake(0, 10, SCREEN_WIDTH, 250);
    self.sectionSum = 1;
    self.rowArray = [NSMutableArray arrayWithObjects:self.tittleArray, nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SettingTableViewCell"];
    
    [super setupViews];
}

-(UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierNormal = @"SettingTableViewCell";
    SettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierNormal];
    if (!cell) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"SettingTableViewCell" owner:nil options:nil];
        cell = [nibs lastObject];
    }
    cell.tittleLabel.text = self.tittleArray[indexPath.row];
    if (indexPath.row == 2) {
        
        cell.detailLabel.text = @"v1.0.0";
        cell.accessoryType = UITableViewCellAccessoryNone;
    }else{
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(CGFloat)rootTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (void)sa_configureViewWithViewModel:(id<SAViewModelProtocol>)viewModel {
    
    [viewModel sa_viewModelWithModelBlcok:^(id model) {
        
       
    }];
    
}






@end
