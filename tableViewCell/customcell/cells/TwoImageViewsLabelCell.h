//
//  TwoImageViewsLabelCell.h
//  tableViewCell
//
//  Created by guiping on 2017/4/24.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "ImageViewAndLabel.h"

@interface TwoImageViewsLabelCell : ImageViewAndLabel

@property (nonatomic, strong) UIImageView *rightImageView;

- (UIColor *) colorWithNumber:(NSInteger) number;
@end
