//
//  SystemNotificationTableViewCell.h
//  myGoddess
//
//  Created by jefactoria on 17/2/9.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SystemNotificationModel.h"
@interface SystemNotificationTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *tittleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateTimeLabel;
@property (nonatomic, strong) SystemNotificationModel *model;
@end
