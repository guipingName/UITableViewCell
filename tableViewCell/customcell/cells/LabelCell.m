//
//  BaseCell1.h
//  tableViewCell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "LabelCell.h"
#define CELL_DEFAULT_HEIGHT 50.f

@implementation LabelCell
+(CGFloat)getCellHeightWithCellStyle:(GPModel *)cellModel{
    return CELL_DEFAULT_HEIGHT;
}
-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    _lbTitle.text = model.title;
    _lbTitle.font = [UIFont systemFontOfSize:18];
    CGRect lbtitleR = LABEL_RECT(_lbTitle.text, 0, 0, 1, 18);
    [_lbTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView).offset(UIWIDTH(21));
        make.height.mas_equalTo(lbtitleR.size.height);
        make.width.mas_equalTo(lbtitleR.size.width + 0.5);
    }];
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if (!_lbTitle) {
            _lbTitle = [[UILabel alloc] init];
            [self.contentView addSubview:_lbTitle];
        }
        if (!_lineView) {
            _lineView = [[UIView alloc] init];
            [self.contentView addSubview:_lineView];
            [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView).offset(UIWIDTH(30));
                make.right.equalTo(self.contentView.mas_right);
                make.height.mas_equalTo(1);
                make.bottom.equalTo(self.contentView.mas_bottom);
            }];
            _lineView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        }
        
    }
    return self;
}


- (CGRect) attributedLabel:(UILabel *) label
                       str:(NSString *) str
                     size1:(CGFloat) size1
                    color1:(UIColor *) color1
                     size2:(CGFloat) size2
                    color2:(UIColor *) color2{
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSRange ra = [label.text rangeOfString:str];
    if (ra.location != NSNotFound) {
        NSRange range = NSMakeRange(0, ra.location);
        [noteStr addAttribute:NSForegroundColorAttributeName value:color1 == nil ? [UIColor blackColor] : color1 range:range];
        [noteStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:size1] range:range];
        NSRange range1 = NSMakeRange(ra.location, label.text.length - ra.location);
        [noteStr addAttribute:NSForegroundColorAttributeName value:color2 == nil ? [UIColor blackColor] : color2 range:range1];
        [noteStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:size2] range:range1];
    }
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect labelRect = [noteStr boundingRectWithSize:CGSizeMake(150, CGFLOAT_MAX) options:options context:nil];
    //NSLog(@"size:%@", NSStringFromCGSize(labelRect.size));
    label.attributedText = noteStr;
    return labelRect;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
