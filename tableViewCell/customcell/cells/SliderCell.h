//
//  SliderCell.h
//  tableViewCell
//
//  Created by guiping on 2017/4/27.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "TwoImageViewsLabelCell.h"

@interface SliderCell : TwoImageViewsLabelCell

@property (nonatomic, strong) UISlider *slider;

@property (nonatomic, copy) void (^sliderBlock) (CGFloat sliderValue);
@end
