//
//  HeaderCell.h
//  tableViewCell
//
//  Created by guiping on 2017/4/25.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "ImageViewAndLabel.h"

@interface HeaderCell : ImageViewAndLabel

@property (nonatomic, strong) UIButton *rightButton;

@property (nonatomic, strong) UILabel *lbSubTitle;

@property (nonatomic, strong) UILabel *lbSubTitle2;

@property (nonatomic, strong) UILabel *lbSubTitle3;

@property (nonatomic, strong) UIImageView *rightImageView;

@property (nonatomic, copy) void (^clickedBlock)(BOOL isClicked, GPModel *model);

@end
