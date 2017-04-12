//
//  SyestemNotificationView.m
//  myGoddess
//
//  Created by jefactoria on 17/2/9.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "SyestemNotificationView.h"
#import "SystemNotificationTableViewCell.h"
#import "SystemNotificationViewMdoel.h"
#import "SystemNotificationModel.h"
@interface SyestemNotificationView ()
@property (nonatomic,strong) SystemNotificationViewMdoel *viewModel;
@property (nonatomic,strong) NSMutableArray *dataArray;
@end
@implementation SyestemNotificationView
-(NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
    
}
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    
    self.viewModel = (SystemNotificationViewMdoel *)viewModel;
    return [super initWithViewModel:viewModel];
    
}
-(void)setupViews{
    
    [[self rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate)]subscribeNext:^(RACTuple * x) {
        NSIndexPath *index = x.second;
        if (index) {
            
        }
   
    }];
    
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    self.tableView.bouncesZoom = NO;
    self.tableViewStyle = 0;
    self.tabFrame = CGRectMake(0, 10, SCREEN_WIDTH, self.height - 64);
    self.sectionSum = 1;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SystemNotificationTableViewCell"];
    self.tableView.backgroundColor = red_color;
    
    [super setupViews];
}
-(UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierNormal = @"SystemNotificationTableViewCell";
    SystemNotificationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierNormal];
    if (!cell) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"SystemNotificationTableViewCell" owner:nil options:nil];
        cell = [nibs lastObject];
    }
    SystemNotificationModel *model = [self.dataArray objectAtIndex:indexPath.row];
    NSString *str= [NSString stringWithFormat:@"%lld",[model.createTime longLongValue]/1000];
    NSTimeInterval time= [str doubleValue];//因为时差问题要加8小时 == 28800 sec
    NSDate *detaildate= [NSDate dateWithTimeIntervalSince1970:time];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    cell.tittleLabel.text = model.tittle;
    cell.detailLabel.text = model.detail;
    cell.dateTimeLabel.text = currentDateStr;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)rootTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (void)sa_configureViewWithViewModel:(id<SAViewModelProtocol>)viewModel {
    
    
    [viewModel sa_viewModelWithModelBlcok:^(id model) {
        
        self.viewModel = (SystemNotificationViewMdoel*)viewModel;
        
        self.dataArray = self.viewModel.dataArray;
        self.rowArray = [NSMutableArray arrayWithObjects:self.dataArray, nil];
        [self.tableView reloadData];
      
        
    }];
}
@end
