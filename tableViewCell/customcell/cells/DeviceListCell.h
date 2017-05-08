//
//  DeviceListCell.h
//  tableViewCell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "DeviceCell.h"

@interface DeviceListCell : DeviceCell

@property (nonatomic, copy) void (^buttonClickedBlock)(BOOL);

@end
