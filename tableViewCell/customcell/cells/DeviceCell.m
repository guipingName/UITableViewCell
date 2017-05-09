//
//  DeviceCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "DeviceCell.h"

@implementation DeviceCell{
    GPModel *currentModel;
}

#pragma mark --------------- cell高度设置 ----------------
+(CGFloat)getCellHeightWithCellStyle:(GPModel *)cellModel{
    if (cellModel.subCell) {
        return UIHEIGHT(140);
    }
    return UIHEIGHT(160);
}



-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    currentModel = model;
    
    self.lbTitle.text = model.title;
    self.bgImageView.image = [UIImage imageNamed:model.imageName];
    
    CGRect lbTitleR = CGRectZero;
    CGRect lbSubTitleR = CGRectZero;
    CGRect lbSubTitle2Height = CGRectZero;
    
    #pragma mark --------------- 赋值 ----------------
    if (model.isThreeRow) { // 三行文字的
        self.lbSubTitle.text = model.subTitle;
        self.lbSubTitle.textColor = [UIColor blackColor];
        lbTitleR = [self attributedFirstSize:14 lastSize:12];
        self.lbSubTitle.font = [UIFont systemFontOfSize:18];
        lbSubTitleR = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 18);
        lbSubTitle2Height = [self setUpAttributedStringFontOfSize:14];
    }
    else{
        if (model.subTitle2) { // 两行文字 且第二行文字需要拼接
            if (model.seperated) { // 中间有竖线
                if (model.temperature) {
                    self.lbSubTitle.text = [NSString stringWithFormat:@"%.1f℃  |  %@", model.temperature, model.humidness];
                }
                else{
                    self.lbSubTitle.text = [NSString stringWithFormat:@"%@  |  %@", model.subTitle, model.subTitle2];
                }
                lbTitleR = [self attributedLbtitle];
            }
            else{ // 中间无竖线
                if (model.DeviceType) {
                    UIColor *color = THEME_COLOR;
                    lbTitleR = [self attributedLbtitleFirstColor:color];
                    self.lbSubTitle.text = [NSString stringWithFormat:@"%@  %ld/%ld",model.subTitle, (long)model.online, (long)model.total];
                }
                else{
                    lbTitleR = [self attributedLbtitle];
                    self.lbSubTitle.text = [NSString stringWithFormat:@"%@  %@",model.subTitle, model.subTitle2];
                }
            }
            self.lbSubTitle.textColor = [UIColor blackColor];
        }
        else{ // 两行文字 没有拼接
            if (model.warning) { // 如果是报警类
                if (model.warmingCount) { // 有数字提示
                    UIColor *color = THEME_COLOR;
                    lbTitleR = [self attributedLbtitleFirstColor:color];
                    self.lbSubTitle.text = [NSString stringWithFormat:@"%ld台报警", (long)model.warmingCount];
                }
                else{
                    lbTitleR = [self attributedLbtitle];
                    self.lbSubTitle.text = @"报警";
                }
                self.bgImageView.backgroundColor = [UIColor redColor];
                self.lbSubTitle.textColor = [UIColor redColor];
            }
            else{
                self.lbSubTitle.text = model.subTitle;
                self.lbSubTitle.textColor = [UIColor blackColor];
                lbTitleR = [self attributedLbtitle];
            }
        }
        self.lbSubTitle.font = [UIFont systemFontOfSize:18];
        lbSubTitleR = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 18);
    }
    
    
    #pragma mark --------------- 调整布局 ----------------
    if (!model.isThreeRow) {
        [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(141));
            make.width.mas_equalTo(lbTitleR.size.width + 0.5);
            make.height.mas_equalTo(lbTitleR.size.height);
            make.top.equalTo(self.contentView.mas_centerY).offset(-(lbTitleR.size.height + lbSubTitleR.size.height + 2) / 2);
        }];
        [self.lbSubTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lbTitle);
            make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
            make.height.mas_equalTo(lbSubTitleR.size.height);
            make.bottom.equalTo(self.contentView.mas_centerY).offset((lbTitleR.size.height + lbSubTitleR.size.height + 2) / 2);
        }];
    }
    else {
        [self.lbSubTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(141));
            make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
            make.height.mas_equalTo(lbSubTitleR.size.height);
            make.centerY.equalTo(self.contentView);
        }];
        
        [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lbSubTitle);
            make.width.mas_equalTo(lbTitleR.size.width + 0.5);
            make.height.mas_equalTo(lbTitleR.size.height);
            make.bottom.equalTo(self.lbSubTitle.mas_top).offset(-2);
        }];
        
        [_lbSubTitle2 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lbTitle);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(lbSubTitle2Height.size.height);
            make.top.equalTo(self.lbSubTitle.mas_bottom).offset(2);
        }];
    }
    
    // 是否是展开的cell
    [self cellisSubcell:lbTitleR];
    
    // 是否可选
    [self cellisOptonal];
}

- (void) cellisSubcell:(CGRect) lbTitleR{
    if (currentModel.subCell) {
        [self isSubCell:currentModel.imageName titleR:lbTitleR];
    }
}

- (void) cellisOptonal{
    if (currentModel.isOptional) {
        [self.rightImageView removeFromSuperview];
        [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(-UIWIDTH(32));
            make.height.width.mas_equalTo(UIWIDTH(37));
        }];
        if (currentModel.selected) {
            _rightButton.selected = YES;
        }
        else{
            _rightButton.selected = NO;
        }
    }
    else{
        [self imageJudge:currentModel];
    }
}

// 生成富文本
- (CGRect) setUpAttributedStringFontOfSize:(CGFloat) size{
    NSString *str = [NSString stringWithFormat:@" %.0f℃  ", currentModel.temperature];
    NSAttributedString *textAttr = [[NSAttributedString alloc] initWithString: str attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]}];
    CGRect rectR = [str boundingRectWithSize:CGSizeMake(0, 0) options:1 attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]} context:nil];
    
    NSTextAttachment *attachment = [[NSTextAttachment alloc] init];
    attachment.image = [[UIImage imageNamed:@"i8_室温"] rt_tintedImageWithColor:[UIColor grayColor]];
    attachment.bounds = CGRectMake(0, 0, rectR.size.height - 2, rectR.size.height - 2);
    NSAttributedString *imageAttr = [NSAttributedString attributedStringWithAttachment:attachment];
    
    
    NSTextAttachment *attachment1 = [[NSTextAttachment alloc] init];
    attachment1.image = [[UIImage imageNamed:@"i8_湿度"] rt_tintedImageWithColor:[UIColor grayColor]];
    attachment1.bounds = CGRectMake(0, 0, rectR.size.height - 2, rectR.size.height - 2);
    NSAttributedString *imageAttr1 = [NSAttributedString attributedStringWithAttachment:attachment1];
    
    NSAttributedString *textAttr1 = [[NSAttributedString alloc] initWithString: [NSString stringWithFormat:@" %@",currentModel.humidness] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]}];
    
    NSMutableAttributedString *mutableAttr = [[NSMutableAttributedString alloc] init];
    [mutableAttr appendAttributedString:imageAttr];
    [mutableAttr appendAttributedString:textAttr];
    [mutableAttr appendAttributedString:imageAttr1];
    [mutableAttr appendAttributedString:textAttr1];
    _lbSubTitle2.attributedText = mutableAttr;
    return rectR;
}

#pragma mark --------------- cell展开 ----------------
- (void) isSubCell:(NSString *) imageName titleR:(CGRect) titleR{
    self.bgImageView.backgroundColor = [UIColor whiteColor];
    UIColor *color = THEME_COLOR;
    self.bgImageView.image = [[UIImage imageNamed:imageName] rt_tintedImageWithColor:color];
    self.lbSubTitle.font = [UIFont systemFontOfSize:12];
    CGRect lbSubR = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 12);
    [self.bgImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(UIWIDTH(193));
        make.height.mas_equalTo(50);
        make.width.mas_equalTo(40);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    self.bgImageView.layer.cornerRadius = 0;
    self.bgImageView.layer.masksToBounds = NO;
    
    [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(UIWIDTH(168));
        make.right.equalTo(self.contentView);
        make.height.mas_equalTo(1);
        make.bottom.equalTo(self.contentView);
    }];
    
    if (!currentModel.isThreeRow) {
        [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(280));
            make.width.mas_equalTo(titleR.size.width + 0.5);
            make.height.mas_equalTo(titleR.size.height);
            make.top.equalTo(self.contentView.mas_centerY).offset(-(titleR.size.height + lbSubR.size.height + 2) / 2);
        }];
    }
    else{
        CGRect lbSubTitle2Height = [self setUpAttributedStringFontOfSize:12];
        self.lbSubTitle.font = [UIFont systemFontOfSize:16];
        CGRect lbSubTitleR = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 16);
        [self.lbSubTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(280));
            make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
            make.height.mas_equalTo(lbSubTitleR.size.height);
            make.centerY.equalTo(self.contentView);
        }];
        
        [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lbSubTitle);
            make.width.mas_equalTo(titleR.size.width + 0.5);
            make.height.mas_equalTo(titleR.size.height);
            make.bottom.equalTo(self.lbSubTitle.mas_top).offset(-2);
        }];
        
        [_lbSubTitle2 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lbTitle);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(lbSubTitle2Height.size.height);
            make.top.equalTo(self.lbSubTitle.mas_bottom).offset(2);
        }];
    }
}

#pragma mark --------------- init ----------------
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.bgImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(20));
            make.height.width.mas_equalTo(UIWIDTH(100));
            make.centerY.equalTo(self.contentView);
        }];
        self.bgImageView.layer.cornerRadius = UIWIDTH(50);
        self.bgImageView.layer.masksToBounds = YES;
        
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(20));
            make.right.equalTo(self.contentView);
            make.height.mas_equalTo(1);
            make.bottom.equalTo(self.contentView);
        }];
        self.lineView.backgroundColor = CELL_LINE_COLOR;
        
        if (!_subImageView1) {
            _subImageView1 = [[UIImageView alloc] init];
            [self.contentView addSubview:_subImageView1];
            self.subImageView1.hidden = YES;
            [_subImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.width.mas_equalTo(20);
                make.centerY.equalTo(self.contentView);
                make.right.equalTo(self.rightImageView.mas_left).offset(0);
            }];
        }
        
        if (!_subImageView2) {
            _subImageView2 = [[UIImageView alloc] init];
            [self.contentView addSubview:_subImageView2];
            self.subImageView2.hidden = YES;
            [_subImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.width.mas_equalTo(20);
                make.centerY.equalTo(self.contentView);
                make.right.equalTo(_subImageView1.mas_left).offset(-3);
            }];
        }
        
        if (!_subImageView3) {
            _subImageView3 = [[UIImageView alloc] init];
            [self.contentView addSubview:_subImageView3];
            self.subImageView3.hidden = YES;
            [_subImageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.width.mas_equalTo(20);
                make.centerY.equalTo(self.contentView);
                make.right.equalTo(_subImageView2.mas_left).offset(-3);
            }];
        }
        
        if (!_lbSubTitle2) {
            _lbSubTitle2 = [[UILabel alloc] init];
            [self.contentView addSubview:_lbSubTitle2];
        }
        
        if (!_rightButton) {
            _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.contentView addSubview:_rightButton];
        }
        [_rightButton setImage:[UIImage imageNamed:@"标签_未选"] forState:UIControlStateNormal];
        [_rightButton setImage:[UIImage imageNamed:@"标签_选中"] forState:UIControlStateSelected];
    }
    return self;
}

#pragma mark --------------- 判断是否显示升级、低电量图标 ----------------
-(void) imageJudge:(GPModel *) model{
    if (model.needUpdate) {
        self.subImageView1.hidden = NO;
        self.subImageView1.image = [[UIImage imageNamed:@"升级100%"] rt_tintedImageWithColor:[UIColor greenColor]];
        if (model.isWarning) {
            UIImage *warmingImage = [[UIImage imageNamed:@"报警"] rt_tintedImageWithColor:[UIColor redColor]];
            self.subImageView2.hidden = NO;
            self.subImageView2.image = warmingImage;
            if (model.isLowPower) {
                self.subImageView3.hidden = NO;
                self.subImageView3.image = [[UIImage imageNamed:@"电量"] rt_tintedImageWithColor:[UIColor redColor]];
            }
        }
        else{
            if (model.isLowPower) {
                self.subImageView2.hidden = NO;
                self.subImageView2.image = [[UIImage imageNamed:@"电量"] rt_tintedImageWithColor:[UIColor redColor]];
            }
        }
    }
    else{
        if (model.isWarning) {
            UIImage *warmingImage = [[UIImage imageNamed:@"报警"] rt_tintedImageWithColor:[UIColor redColor]];
            self.subImageView1.hidden = NO;
            self.subImageView1.image = warmingImage;
            if (model.isLowPower) {
                self.subImageView2.hidden = NO;
                self.subImageView2.image = [[UIImage imageNamed:@"电量"] rt_tintedImageWithColor:[UIColor redColor]];
            }
        }
        else{
            if (model.isLowPower) {
                self.subImageView1.hidden = NO;
                self.subImageView1.image = [[UIImage imageNamed:@"电量"] rt_tintedImageWithColor:[UIColor redColor]];
            }
        }
    }
}


- (CGRect) attributedLbtitle{
   return [self attributedLbtitleFirstColor:[UIColor blackColor]];
}

- (CGRect) attributedLbtitleFirstColor:(UIColor *) color{
    return [self attributedFirstSize:16 firstColor:color lastSize:12];
}

- (CGRect) attributedFirstSize:(CGFloat) firstSize lastSize:(CGFloat) lastSize{
    return [self attributedFirstSize:firstSize firstColor:[UIColor blackColor] lastSize:lastSize];
}

- (CGRect) attributedFirstSize:(CGFloat) firstSize firstColor:(UIColor *) firstColor lastSize:(CGFloat) lastSize{
    return [self attributedLabel:self.lbTitle str:@"[" size1:firstSize color1:firstColor size2:lastSize color2:[UIColor grayColor]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
