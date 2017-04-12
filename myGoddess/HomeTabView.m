//
//  HomeTabView.m
//  myGoddess
//
//  Created by jefactoria on 17/2/13.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "HomeTabView.h"
#import "HomeViewModel.h"
#import "HomeTableViewCell.h"
#import "HomeArticleContents.h"
@interface HomeTabView ()
@property (nonatomic,strong) HomeViewModel *viewModel;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) UIView *cardView;
@end
@implementation HomeTabView
-(instancetype)initWithViewModel:(id<BaseViewModelProtocol>)viewModel{
    
    self.viewModel = (HomeViewModel *)viewModel;
    return [super initWithViewModel:viewModel];
    
}
-(NSMutableArray *)dataArray{
    
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]init];
    }
    return _dataArray;
}
-(void)setupViews{
    
    [[self rac_signalForSelector:@selector(tableView:didSelectRowAtIndexPath:) fromProtocol:@protocol(UITableViewDelegate)]subscribeNext:^(RACTuple * x) {
        NSIndexPath *index = x.second;
        HomeArticleContents *model = [self.dataArray objectAtIndex:index.row];
        
        self.cardView = [[UIView alloc]initWithFrame:CGRectMake(40, 100, SCREEN_WIDTH - 80, SCREEN_HEIGHT - 200)];
        self.cardView.backgroundColor = white_color;
        self.cardView.layer.cornerRadius = 10;
        self.cardView.clipsToBounds = YES;
        self.cardView.layer.borderWidth = 0.5;
        self.cardView.layer.borderColor = [UIColor colorWithHexString:@"#b2acaa"].CGColor;
        self.cardView.layer.shadowOffset = CGSizeMake(0, 1);  // 设置阴影的偏移量
        self.cardView.layer.shadowRadius = 0.5;  // 设置阴影的半径
        self.cardView.layer.shadowColor = [UIColor blackColor].CGColor; // 设置阴影的颜色为黑色
        self.cardView.layer.shadowOpacity = 0.65; // 设置阴影的不透明度
        [self addSubview:self.cardView];
        
        UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, self.cardView.width - 20, self.cardView.height)];
        contentLabel.text = model.content;
        contentLabel.numberOfLines = 0;
        contentLabel.textColor = black_color;
          contentLabel.font = [UIFont fontWithName:@"Arial-ItalicMT" size:15];
        
        [self.cardView addSubview:contentLabel];
        
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        closeBtn.frame = CGRectMake(_cardView.width - 30, 5, 25, 25);
        [closeBtn setBackgroundImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(closeView) forControlEvents:UIControlEventTouchUpInside];
        [self.cardView addSubview:closeBtn];
    
        
        
        
    }];
    
    
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    NSArray *arr = [[NSArray alloc]init];
    self.tableView.bouncesZoom = NO;
    self.tableViewStyle = 0;
    self.tabFrame = CGRectMake(0, 10, SCREEN_WIDTH, self.height - 124);
    self.sectionSum = 1;
    self.rowArray = [NSMutableArray arrayWithObjects:arr, nil];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"HomeTableViewCell"];
    
    [super setupViews];
}

-(UITableViewCell *)rootTableView:(UITableView *)tableView rootCellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifierNormal = @"HomeTableViewCell";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifierNormal];
    if (!cell) {
        NSArray *nibs = [[NSBundle mainBundle]loadNibNamed:@"HomeTableViewCell" owner:nil options:nil];
        cell = [nibs lastObject];
    }
    
    if (self.dataArray.count > 0) {
        HomeArticleContents *model = [self.dataArray objectAtIndex:indexPath.row];
        
        NSString *str= [NSString stringWithFormat:@"%lld",[model.createTime longLongValue]/1000];
        NSTimeInterval time= [str doubleValue];//因为时差问题要加8小时 == 28800 sec
        NSDate *detaildate= [NSDate dateWithTimeIntervalSince1970:time];
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        //设定时间格式,这里可以设置成自己需要的格式
        [dateFormatter setDateFormat:@"dd"];
        NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
        
        NSDateFormatter *timeFormatter = [[NSDateFormatter alloc] init];
        //设定时间格式,这里可以设置成自己需要的格式
        [timeFormatter setDateFormat:@"HH:mm"];
        NSString *currenttimeStr = [timeFormatter stringFromDate: detaildate];
 
        cell.timeLabel.text = currenttimeStr;
        cell.dateLabel.text = currentDateStr;
        cell.weekLabel.text = [Utility weekdayStringFromDate:detaildate];
        cell.tittleLabel.text = model.tittle;
        cell.contentLabel.text = model.content;
       
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

-(CGFloat)rootTableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (void)sa_configureViewWithViewModel:(id<SAViewModelProtocol>)viewModel {
    
    [viewModel sa_viewModelWithModelBlcok:^(id model) {
        
        self.viewModel = (HomeViewModel*)viewModel;
        self.dataArray = self.viewModel.dataArray;
        self.rowArray = [NSMutableArray arrayWithObjects:self.dataArray, nil];
        [self.tableView reloadData];
     
        
    }];
    
}
-(void)closeView{

    [self.cardView removeFromSuperview];

}
@end
