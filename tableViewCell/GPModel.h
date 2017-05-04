//
//  GPModel.h
//  tableViewcell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CellStyle) {
    CellStyleLabelCell = 0,
    CellStyleTwoLabelCell = 1,
    CellStyleButtonCell = 2,
    CellStyleLabelAndSwitchCell = 3,
    CellStyleImageViewAndLabel = 4,
    CellStyleTwoImageViewsLabelCell = 5,
    CellStyleBaseCell = 6,
    CellStyleDeviceCell = 7,
    CellStyleDeviceSubCell = 8,
    CellStyleWarningCell = 9,
    CellStyleWithTimeCell = 10,
    CellStyleEletricCell = 11,
    CellStyleDeviceListCell = 12,
    CellStyleThreeLabelsCell = 13,
    CellStyleChooseDeviceCell = 14,
    CellStyleLogListCell = 15,
    CellStyleHeaderCell = 16,
    CellStyleTimerCell = 17,
    CellStyleSliderCell = 18,
    CellStyleLightCell = 19,
};

@interface GPModel : NSObject

/**cell的类型*/
@property (nonatomic, assign) CellStyle cellstyle;

/**一级标题*/
@property (nonatomic,copy) NSString *title;

/**二级标题*/
@property (nonatomic,copy) NSString *subTitle;

/**三级标题*/
@property (nonatomic,copy) NSString *subTitle2;

/**四级标题*/
@property (nonatomic,copy) NSString *subTitle3;

/**颜色数组*/
@property (nonatomic,strong) NSArray *colors;

/**电量数组*/
@property (nonatomic,strong) NSArray *monthElectrics;

/**设备Id??*/
@property (nonatomic,copy) NSString *deviceId;

/**第二行文本中是否显示分隔线*/
@property (nonatomic, assign) BOOL seperated;

/**是否需要升级*/
@property (nonatomic, assign) BOOL needUpdate;

/**是否低电量*/
@property (nonatomic, assign) BOOL isLowPower;

/**是否报警提醒*/
@property (nonatomic, assign) BOOL isWarning;

/**设备总数*/
@property (nonatomic, assign) NSInteger total;

/**显示图片名称*/
@property (nonatomic,copy) NSString *imageName;

/**峰电电量*/
@property (nonatomic,copy) NSString *electricCrest;

/**谷电电量*/
@property (nonatomic,copy) NSString *electricValley;

/**电量月份*/
@property (nonatomic, assign) NSInteger month;

/**背景色类型(用int代替)*/
@property (nonatomic, assign) NSInteger backGroundColor;

/**是否是展开的cell*/
@property (nonatomic, assign) BOOL subCell;

/**是否是nomal状态*/
@property (nonatomic, assign) BOOL isNormal;

/**是否是灯*/
@property (nonatomic, assign) BOOL isLight;

/**switch的状态*/
@property (nonatomic, assign) BOOL isOn;

/**是否是设备分类(区分设备/类型)*/
@property (nonatomic, assign) BOOL DeviceType;

/**是否选中*/
@property (nonatomic, assign) BOOL selected;

/**是否点击*/
@property (nonatomic, assign) BOOL isClicked;

/**是否设置定时相关操作*/
@property (nonatomic, assign) BOOL timerSetted;

/**定时类型(1单个 2两个,指时间段)*/
@property (nonatomic, assign) NSInteger timerMode;

/**设备在线数*/
@property (nonatomic, assign) NSInteger online;

/**设备离线数*/
@property (nonatomic, assign) NSInteger offline;

/**报警设备数*/
@property (nonatomic, assign) NSInteger warmingCount;

/**设备的工作状态？*/
@property (nonatomic, copy) NSString *state;

/**二级图片名称*/
@property (nonatomic, copy) NSString *subImageName;

/**室内温度*/
@property (nonatomic, assign) NSInteger indoorTemperature;

/**温度*/
@property (nonatomic, assign) CGFloat temperature;

/**slider的值*/
@property (nonatomic, assign) CGFloat sliderValue;

/**升级的进度*/
@property (nonatomic, assign) CGFloat progress;

/**湿度*/
@property (nonatomic, copy) NSString *humidness;

/**时间*/
@property (nonatomic, copy) NSString *time;

/**徽章值*/
@property (nonatomic, assign) NSInteger badge;

/**时间*/
@property (nonatomic, copy) NSString *date;

@end
