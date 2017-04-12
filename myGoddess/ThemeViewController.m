//
//  ThemeViewController.m
//  myGoddess
//
//  Created by jefactoria on 17/2/10.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "ThemeViewController.h"

@interface ThemeViewController ()
@property (nonatomic,strong) NSArray *redColorArr;
@property (nonatomic,strong) NSArray *greenColorArr;
@property (nonatomic,strong) NSArray *blueColorArr;
@end

@implementation ThemeViewController

static NSString * const reuseIdentifier = @"Cell";
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.tabBarController.tabBar.hidden = YES;
    self.navigationItem.title = @"主题";
}
#pragma mark - 初始化
- (instancetype)init {
    // 设置流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    CGFloat width = ([UIScreen mainScreen].bounds.size.width - 80) / 3;
    layout.itemSize = CGSizeMake(width, width);
    layout.minimumLineSpacing = 20;
    layout.minimumInteritemSpacing = 20;
    return [self initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.redColorArr = @[@"0.694118",
                         @"0.211765",
                         @"0.258824",
                         @"0.572549",
                         @"0.360784",
                         @"0.160784",
                         @"0.345098",
                         @"0.964706",
                         @"0.592157"
                      ];
    self.greenColorArr = @[@"0.0196078",
                         @"0.854902",
                         @"0.0705882",
                         @"0.72549",
                         @"0.352941",
                         @"0.490196",
                         @"0.184314",
                         @"0.780392",
                         @"0.505882"
                         ];
    self.blueColorArr = @[@"0.294118",
                         @"0.619608",
                         @"0.780392",
                         @"0.611765",
                         @"0.333333",
                         @"0.180392",
                         @"0.968627",
                         @"0.552941",
                         @"0.0627451"
                         ];
    
    
    
    self.collectionView.yy_x = 20;
    self.collectionView.yy_y = 0;
    self.collectionView.yy_width = [UIScreen mainScreen].bounds.size.width - 40;
    self.collectionView.yy_height = [UIScreen mainScreen].bounds.size.height - 40;
    self.collectionView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsVerticalScrollIndicator = NO;
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    float red  = [[NSString stringWithFormat:@"%@",self.redColorArr[indexPath.row]] floatValue];
    float green  = [[NSString stringWithFormat:@"%@",self.greenColorArr[indexPath.row]] floatValue];
    float blue  = [[NSString stringWithFormat:@"%@",self.blueColorArr[indexPath.row]] floatValue];
    cell.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];
    cell.layer.cornerRadius = 10;
    return cell;
}

#pragma mark <UICollectionViewDelegate>
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    // 取出选中cell，设置主题颜色
    UICollectionViewCell *selectedCell = [collectionView cellForItemAtIndexPath:indexPath];
    [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@",self.redColorArr[indexPath.row]] forKey:@"redColor"];
     [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@",self.greenColorArr[indexPath.row]] forKey:@"greenColor"];
     [[NSUserDefaults standardUserDefaults]setObject:[NSString stringWithFormat:@"%@",self.blueColorArr[indexPath.row]] forKey:@"blueColor"];
    [self yy_setThemeColor:selectedCell.backgroundColor];
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
