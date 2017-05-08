//
//  BaseTableViewCell.h
//  tableViewcell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

/**
 * @brief 创建cell对象
 * @param  cellModel 数据模型
 *
 * @return cell对象
 */
+(BaseTableViewCell *)createCellWithCellModel:(id)cellModel;


/**
 * @brief cell赋值
 * @param  cellModel 数据模型
 */
- (void) initWithData:(id) cellModel;


+(CGFloat)getCellHeightWithCellStyle:(GPModel *) cellModel;

@end
