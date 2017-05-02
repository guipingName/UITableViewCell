//
//  LightCell.h
//  tableViewCell
//
//  Created by guiping on 2017/4/27.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "TwoImageViewsLabelCell.h"

@interface LightCell : TwoImageViewsLabelCell

@property (nonatomic, copy) void (^cellIsClicked)(BOOL);

@end
