//
//  DeviceCell.h
//  tableViewCell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "BaseCell.h"

@interface DeviceCell : BaseCell

/**右侧图1*/
@property (nonatomic, strong) UIImageView *subImageView1;

/**右侧图2*/
@property (nonatomic, strong) UIImageView *subImageView2;

/**右侧图2*/
@property (nonatomic, strong) UIImageView *subImageView3;

/**升级、低电量、警告提醒图标显示*/
-(void) imageJudge:(GPModel *) model;
@end
