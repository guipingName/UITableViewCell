//
//  LabelAndSwitchCell.h
//  tableViewCell
//
//  Created by guiping on 2017/4/24.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "LabelCell.h"

@interface LabelAndSwitchCell : LabelCell

@property (nonatomic, strong) UISwitch *rightSwitch;

@property (nonatomic, strong) UILabel *lbSubtitle;

@property (nonatomic, strong) UILabel *lbDate;

@property (nonatomic, copy) void (^valueChanged)(BOOL);

@end
