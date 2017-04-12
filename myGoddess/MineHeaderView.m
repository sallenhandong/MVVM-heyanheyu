//
//  HomeView.m
//  basicFramework
//
//  Created by jefactoria on 17/1/3.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "MineHeaderView.h"

@interface MineHeaderView ()
@end

@implementation MineHeaderView


-(void)addChildView{

    self.titleLabel = [[UILabel alloc]init];
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.textColor = black_color;
    self.titleLabel.text = @"何言何语";
    [self addSubview:self.titleLabel];
    self.headImage = [[UIImageView alloc]init];
    self.headImage.image = [UIImage imageNamed:@"hanwei.jpg"];
    [self addSubview:self.headImage];
    
    self.descriptionLabel = [[UILabel alloc]init];
    self.descriptionLabel.font = [UIFont systemFontOfSize:14];
    self.descriptionLabel.text = @"一言一语一杯酒，带上故事一起走";
    self.descriptionLabel.textAlignment = NSTextAlignmentCenter;
    self.descriptionLabel.numberOfLines = 0;
    self.descriptionLabel.textColor = lightGray_color;
    [self addSubview:self.descriptionLabel];
    
    [self setNeedsUpdateConstraints];
    [self updateConstraints];
}
-(void)updateConstraints{
    
    CGSize size = [self.titleLabel.text sizeWithAttributes:@{ NSFontAttributeName: self.titleLabel.font }];
    self.titleLabel.sd_layout.topSpaceToView(self,90).heightIs(size.height).widthIs(size.width).centerXEqualToView(self);
    self.headImage.sd_layout.topSpaceToView(self,0).heightIs(80).widthIs(80).centerXEqualToView(self);
    self.descriptionLabel.sd_layout.topSpaceToView(self.titleLabel,5).heightIs(60).widthIs(SCREEN_WIDTH - 80).centerXEqualToView(self);
    self.headImage.clipsToBounds = YES;
    self.headImage.layer.cornerRadius = 40 ;
    [super updateConstraints];
}


@end
