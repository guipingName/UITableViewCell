//
//  EletricCell.h
//  tableViewCell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "TwoImageViewsLabelCell.h"

@interface EletricCell : TwoImageViewsLabelCell

@property (nonatomic, strong) UIImageView *moreView;

@property (nonatomic, strong) UILabel *lbFengdian;
@property (nonatomic, strong) UILabel *lbGudian;

@property (nonatomic, strong) UILabel *month;

@end