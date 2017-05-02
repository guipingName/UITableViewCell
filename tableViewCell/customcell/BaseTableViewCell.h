//
//  BaseTableViewCell.h
//  tableViewcell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

+(BaseTableViewCell *)createCellWithCellModel:(id)cellModel;

- (void) initWithData:(id) cellModel;

@end
