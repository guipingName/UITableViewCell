//
//  BaseTableViewCell.m
//  tableViewcell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

+ (BaseTableViewCell *)createCellWithCellModel:(id)cellModel{
    GPModel *model = cellModel;
    BaseTableViewCell *cell = nil;
    NSString *cellClasssName = [self getClassName:model.cellstyle];
    Class classForCell = NSClassFromString(cellClasssName);
    cell = [[classForCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellClasssName];
    [cell initWithData:cellModel];
    return cell;
}

+ (NSString *) getClassName:(CellStyle) cellStyle{
    NSString *className = nil;
    switch (cellStyle) {
        case CellStyleLabelCell:
            className = @"LabelCell";
            break;
        case CellStyleTwoLabelCell:
            className = @"TwoLabelCell";
            break;
        case CellStyleImageViewAndLabel:
            className = @"ImageViewAndLabel";
            break;
        case CellStyleBaseCell:
            className = @"BaseCell";
            break;
        case CellStyleTwoImageViewsLabelCell:
            className = @"TwoImageViewsLabelCell";
            break;
        case CellStyleEletricCell:
            className = @"EletricCell";
            break;
        case CellStyleThreeLabelsCell:
            className = @"ThreeLabelsCell";
            break;
        case CellStyleDeviceCell:
            className = @"DeviceCell";
            break;
        case CellStyleWarningCell:
            className = @"WarningCell";
            break;
        case CellStyleDeviceSubCell:
            className = @"DeviceSubCell";
            break;
        case CellStyleWithTimeCell:
            className = @"WithTimeCell";
            break;
        case CellStyleDeviceListCell:
            className = @"DeviceListCell";
            break;
        case CellStyleLabelAndSwitchCell:
            className = @"LabelAndSwitchCell";
            break;
        case CellStyleButtonCell:
            className = @"ButtonCell";
            break;
        case CellStyleChooseDeviceCell:
            className = @"ChooseDeviceCell";
            break;
        case CellStyleLogListCell:
            className = @"LogListCell";
            break;
        case CellStyleHeaderCell:
            className = @"HeaderCell";
            break;
        case CellStyleTimerCell:
            className = @"TimerCell";
            break;
        case CellStyleSliderCell:
            className = @"SliderCell";
            break;
        case CellStyleLightCell:
            className = @"LightCell";
            break;
        default:
            className = @"LabelCell";
            break;
    }
    return className;
}

-(void)initWithData:(id)cellModel{
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
