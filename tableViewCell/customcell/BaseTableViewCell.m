//
//  BaseTableViewCell.m
//  tableViewcell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "BaseTableViewCell.h"

#define LABEL_CELL                      @"LabelCell"
#define TWO_LABEL_CELL                  @"TwoLabelCell"
#define IMAGEVIEW_LABEL_CELL            @"ImageViewAndLabel"
#define BASE_CELL                       @"BaseCell"
#define TWO_IMAGEVIEWS_LABEL_CELL       @"TwoImageViewsLabelCell"
#define ELECTRIC_CELL                   @"EletricCell"
#define DEVICE_CELL                     @"DeviceCell"
#define TIME_CELL                       @"WithTimeCell"
#define DEVICE_LIST_CELL                @"DeviceListCell"
#define LABEL_SWITCH_CELL               @"LabelAndSwitchCell"
#define BUTTON_CELL                     @"ButtonCell"
#define DEVICE_CHOOSE_CELL              @"ChooseDeviceCell"
#define LOG_LIST_CELL                   @"LogListCell"
#define HEADER_CELL                     @"HeaderCell"
#define TIMER_CELL                      @"TimerCell"
#define SLIDER_CELL                     @"SliderCell"
#define LIGHT_CELL                      @"LightCell"



@implementation BaseTableViewCell

+ (BaseTableViewCell *)createCellWithCellModel:(id)cellModel{
    GPModel *model = cellModel;
    BaseTableViewCell *cell = nil;
    NSString *cellClasssName = [self getClassName:model.cellStyle];
    Class classForCell = NSClassFromString(cellClasssName);
    cell = [[classForCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellClasssName];
    [cell initWithData:cellModel];
    return cell;
}

+(CGFloat)getCellHeightWithCellStyle:(GPModel *) cellModel{
    NSString *cellClasssName = [self getClassName:cellModel.cellStyle];
    Class classForCell = NSClassFromString(cellClasssName);
    return [classForCell getCellHeightWithCellStyle:cellModel];
}

+ (NSString *) getClassName:(CellStyle) cellStyle{
    NSString *className = nil;
    switch (cellStyle) {
        case CellStyleLabelCell:
            className = LABEL_CELL;
            break;
        case CellStyleTwoLabelCell:
            className = TWO_LABEL_CELL;
            break;
        case CellStyleImageViewAndLabel:
            className = IMAGEVIEW_LABEL_CELL;
            break;
        case CellStyleBaseCell:
            className = BASE_CELL;
            break;
        case CellStyleTwoImageViewsLabelCell:
            className = TWO_IMAGEVIEWS_LABEL_CELL;
            break;
        case CellStyleEletricCell:
            className = ELECTRIC_CELL;
            break;
        case CellStyleDeviceCell:
            className = DEVICE_CELL;
            break;
        case CellStyleWithTimeCell:
            className = TIME_CELL;
            break;
        case CellStyleDeviceListCell:
            className = DEVICE_LIST_CELL;
            break;
        case CellStyleLabelAndSwitchCell:
            className = LABEL_SWITCH_CELL;
            break;
        case CellStyleButtonCell:
            className = BUTTON_CELL;
            break;
        case CellStyleChooseDeviceCell:
            className = DEVICE_CHOOSE_CELL;
            break;
        case CellStyleLogListCell:
            className = LOG_LIST_CELL;
            break;
        case CellStyleHeaderCell:
            className = HEADER_CELL;
            break;
        case CellStyleTimerCell:
            className = TIMER_CELL;
            break;
        case CellStyleSliderCell:
            className = SLIDER_CELL;
            break;
        case CellStyleLightCell:
            className = LIGHT_CELL;
            break;
        default:
            className = LABEL_CELL;
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
