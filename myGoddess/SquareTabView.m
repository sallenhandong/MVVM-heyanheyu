//
//  SquareTabView.m
//  myGoddess
//
//  Created by jefactoria on 17/2/14.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "SquareTabView.h"
#import "SquareViewModel.h"
#import "SquareTableViewCell.h"
#import "SquareModel.h"
@interface SquareTabView ()
@property (nonatomic,strong) NSArray *tittleArray;
@property (nonatomic,strong) SquareViewModel *viewModel;
@property (nonatomic,strong) NSArray *dataArray;
@end
@implementation SquareTabView

-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    
    self.viewModel = (SquareViewModel *)viewModel;
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
                         @"版本号",
                         @"清除缓存"
                         ];
    self.tableView.bouncesZoom = NO;
    self.tableViewStyle = 0;
    self.tabFrame = CGRectMake(0, 10, SCREEN_WIDTH, SCREEN_HEIGHT - 90);
    self.sectionSum = 1;
    self.rowArray = [NSMutableArray arrayWithObjects:self.tittleArray, nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"SquareTableViewCell"];
    
    [super setupViews];
}

-(UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierNormal = @"SquareTableViewCell";
    SquareTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierNormal];
    if (!cell) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"SquareTableViewCell" owner:nil options:nil];
        cell = [nibs lastObject];
    }
    if (self.dataArray && self.dataArray.count > 0) {
        
        SquareModel *model = [self.dataArray objectAtIndex:indexPath.row];
        NSString *str= [NSString stringWithFormat:@"%lld",[model.createTime longLongValue]/1000];
        NSTimeInterval time= [str doubleValue];//因为时差问题要加8小时 == 28800 sec
        NSDate *detaildate= [NSDate dateWithTimeIntervalSince1970:time];
        //实例化一个NSDateFormatter对象
        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
        //设定时间格式,这里可以设置成自己需要的格式
        [timeFormatter setDateFormat:@"HH:mm"];
        NSString *currenttimeStr = [timeFormatter stringFromDate: detaildate];
        
        cell.contentLabel.text = model.content;
        cell.timeLabel.text = currenttimeStr;
        
    }

    return cell;
}

-(CGFloat)rootTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}
- (void)sa_configureViewWithViewModel:(id<SAViewModelProtocol>)viewModel {
    
    
    [viewModel sa_viewModelWithModelBlcok:^(id model) {
        
        self.viewModel = (SquareViewModel *)viewModel;
        self.dataArray = self.viewModel.dataArray;
        self.rowArray = [NSMutableArray arrayWithObjects:self.dataArray, nil];
        [self.tableView reloadData];
        
        
    }];
    
}


@end
