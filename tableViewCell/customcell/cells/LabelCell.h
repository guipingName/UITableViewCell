//
//  BaseCell1.h
//  tableViewCell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "BaseTableViewCell.h"

@interface LabelCell : BaseTableViewCell

@property (nonatomic, strong) UILabel *lbTitle;

@property (nonatomic, strong) UIView *lineView;

/**设置字符串的字号及颜色*/
- (CGRect) attributedLabel:(UILabel *) label
                       str:(NSString *) str
                     size1:(CGFloat) size1
                    color1:(UIColor *) color1
                     size2:(CGFloat) size2
                    color2:(UIColor *) color2;

@end
