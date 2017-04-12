//
//  MessageViewController.m
//  myGoddess
//
//  Created by jefactoria on 17/2/7.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "MessageViewController.h"
#import "CardView.h"
#import "YSLDraggableCardContainer.h"
@interface MessageViewController ()<YSLDraggableCardContainerDelegate,YSLDraggableCardContainerDataSource>
@property (nonatomic, strong) YSLDraggableCardContainer *container;
@property (nonatomic, strong) NSMutableArray *imageUrlArr;
@end

@implementation MessageViewController
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
    self.navigationItem.title = @"卡片";
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = RGBCOLOR(235, 235, 235);
    
    _container = [[YSLDraggableCardContainer alloc]init];
    _container.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _container.backgroundColor = [UIColor clearColor];
    _container.dataSource = self;
    _container.delegate = self;
    _container.canDraggableDirection = YSLDraggableDirectionLeft | YSLDraggableDirectionRight | YSLDraggableDirectionUp;
    [self.view addSubview:_container];
    [self getImageUrl];
    self.imageUrlArr = [NSMutableArray array];
    
}
-(void)getImageUrl{
    
    JYAPIClient *client = [[JYAPIClient alloc]init];
    [client postCardImageUrlWithParameters:nil Success:^(id responseData) {
        
        if (responseData) {
            NSArray *imageArr = [responseData objectForKey:@"image_url"];
            if (imageArr.count >0) {
                for (int i = 0; i<imageArr.count; i++) {
                    
                    [ self.imageUrlArr addObject:imageArr[i]];
                    
                }
                [_container reloadCardContainer];
                
            }
        }
      
    } responseFailure:^{
        
        
        
    } failure:^(NSError *error) {
        
        
    }];


}
#pragma mark -- YSLDraggableCardContainer DataSource
- (UIView *)cardContainerViewNextViewWithIndex:(NSInteger)index
{
    CardView *view = [[CardView alloc]initWithFrame:CGRectMake(10, 100, SCREEN_WIDTH-20, SCREEN_HEIGHT/2 + 80)];
    view.backgroundColor = [UIColor whiteColor];
    [view.imageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",self.imageUrlArr[index]]]];
    // view.label.text = [NSString stringWithFormat:@"%@  %ld",dict[@"name"],(long)index];
    return view;
}

- (NSInteger)cardContainerViewNumberOfViewInIndex:(NSInteger)index
{
    return  self.imageUrlArr.count;
}

#pragma mark -- YSLDraggableCardContainer Delegate
- (void)cardContainerView:(YSLDraggableCardContainer *)cardContainerView didEndDraggingAtIndex:(NSInteger)index draggableView:(UIView *)draggableView draggableDirection:(YSLDraggableDirection)draggableDirection
{
    if (draggableDirection == YSLDraggableDirectionLeft) {
        [cardContainerView movePositionWithDirection:draggableDirection
                                         isAutomatic:NO];
    }
    
    if (draggableDirection == YSLDraggableDirectionRight) {
        [cardContainerView movePositionWithDirection:draggableDirection
                                         isAutomatic:NO];
    }
    
    if (draggableDirection == YSLDraggableDirectionUp) {
        [cardContainerView movePositionWithDirection:draggableDirection
                                         isAutomatic:NO];
    }
}

- (void)cardContainderView:(YSLDraggableCardContainer *)cardContainderView updatePositionWithDraggableView:(UIView *)draggableView draggableDirection:(YSLDraggableDirection)draggableDirection widthRatio:(CGFloat)widthRatio heightRatio:(CGFloat)heightRatio
{
    CardView *view = (CardView *)draggableView;
    
    if (draggableDirection == YSLDraggableDirectionDefault) {
        view.selectedView.alpha = 0;
    }
    
    if (draggableDirection == YSLDraggableDirectionLeft) {
        view.selectedView.backgroundColor = RGBCOLOR(215, 104, 91);
        view.selectedView.alpha = widthRatio > 0.8 ? 0.8 : widthRatio;
    }
    
    if (draggableDirection == YSLDraggableDirectionRight) {
        view.selectedView.backgroundColor = RGBCOLOR(114, 209, 142);
        view.selectedView.alpha = widthRatio > 0.8 ? 0.8 : widthRatio;
    }
    
    if (draggableDirection == YSLDraggableDirectionUp) {
        view.selectedView.backgroundColor = RGBCOLOR(66, 172, 225);
        view.selectedView.alpha = heightRatio > 0.8 ? 0.8 : heightRatio;
    }
}

- (void)cardContainerViewDidCompleteAll:(YSLDraggableCardContainer *)container;
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [container reloadCardContainer];
    });
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
