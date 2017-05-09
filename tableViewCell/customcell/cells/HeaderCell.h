//
//  HeaderCell.h
//  tableViewCell
//
//  Created by guiping on 2017/4/25.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "BaseCell.h"

@interface HeaderCell : BaseCell

@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, copy) void (^clickedBlock)(BOOL isClicked, GPModel *model);

@end
