//
//  ThreeLabelsCell.h
//  tableViewCell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "DeviceCell.h"

@interface ThreeLabelsCell : DeviceCell

@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UILabel *lbTemperature;
@property (nonatomic, strong) UIImageView *imageView2;
@property (nonatomic, strong) UILabel *lbHumidness;

@end
