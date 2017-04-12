//
//  SquareTableViewCell.m
//  myGoddess
//
//  Created by jefactoria on 17/2/14.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "SquareTableViewCell.h"

@implementation SquareTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   
    self.headImage.clipsToBounds = YES;
    self.headImage.layer.cornerRadius = 30;
    
    
}
- (IBAction)likeClick:(id)sender {
    
    _likeBtn.selected = !_likeBtn.selected;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
