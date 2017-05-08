//
//  DeviceSubCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "DeviceSubCell.h"

@implementation DeviceSubCell{
    UIView *seperatedLineView;
}

+(CGFloat)getCellHeightWithCellStyle:(GPModel *)cellModel{
    if (cellModel.subCell) {
        return UIHEIGHT(140);
    }
    return UIHEIGHT(160);
}

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    self.lbTitle.text = model.title;
    self.bgImageView.image = [UIImage imageNamed:model.imageName];
    
    self.lbSubTitle.font = [UIFont systemFontOfSize:18];
    if (model.seperated) {
        [self withS:model];
    }
    else{
        [self withNoSpe:model];
    }
    [self imageJudge:model];
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if (!_lbSubTitle2) {
            _lbSubTitle2 = [[UILabel alloc] init];
            [self.contentView addSubview:_lbSubTitle2];
            _lbSubTitle2.font = [UIFont systemFontOfSize:18];
        }
    }
    return self;
}

- (void) withNoSpe:(GPModel *) model{
    self.lbSubTitle.text = model.subTitle;
    CGRect lbTitleR = CGRectZero;
    if (model.DeviceType) {
        UIColor *color = THEME_COLOR;
        lbTitleR = [self attributedLabel:self.lbTitle str:@"[" size1:16 color1:color size2:12 color2:[UIColor grayColor]];
        _lbSubTitle2.text = [NSString stringWithFormat:@"%ld/%ld", (long)model.online, (long)model.total];
    }
    else{
        lbTitleR = [self attributedLabel:self.lbTitle str:@"[" size1:16 color1:[UIColor blackColor] size2:12 color2:[UIColor grayColor]];
        _lbSubTitle2.text = model.subTitle2;
    }
    CGRect lbSubTitleR = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 18);
    CGRect lbSubTitle2R = LABEL_RECT(_lbSubTitle2.text, 0, 0, 1, 18);
    if (model.subCell) {
        
        self.bgImageView.backgroundColor = [UIColor whiteColor];
        UIColor *color = THEME_COLOR;
        self.bgImageView.image = [[UIImage imageNamed:model.imageName] rt_tintedImageWithColor:color];
        self.lbSubTitle.font = [UIFont systemFontOfSize:12];
        lbSubTitleR = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 12);
        self.lbSubTitle2.font = [UIFont systemFontOfSize:12];
        lbSubTitle2R = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 12);
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
            make.right.equalTo(self.contentView.mas_right);
            make.height.mas_equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        self.lineView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        
        [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(280));
            make.width.mas_equalTo(lbTitleR.size.width + 0.5);
            make.height.mas_equalTo(lbTitleR.size.height);
            make.top.equalTo(self.contentView.mas_centerY).offset(-(lbTitleR.size.height + lbSubTitleR.size.height) / 2);
        }];
    }
    else{
        [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(141));
            make.width.mas_equalTo(lbTitleR.size.width + 0.5);
            make.height.mas_equalTo(lbTitleR.size.height);
            make.top.equalTo(self.contentView.mas_centerY).offset(-(lbTitleR.size.height + lbSubTitleR.size.height) / 2);
        }];
    }
    [self.lbSubTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lbTitle.mas_left);
        make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbSubTitleR.size.height);
        make.bottom.equalTo(self.contentView.mas_centerY).offset((lbTitleR.size.height + lbSubTitleR.size.height) / 2);
    }];
    [_lbSubTitle2 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lbSubTitle.mas_right).offset(10);
        make.top.equalTo(self.lbSubTitle.mas_top);
        make.height.mas_equalTo(lbSubTitle2R.size.height);
        make.width.mas_equalTo(lbSubTitle2R.size.width + 0.5);
    }];
}


- (void) withS:(GPModel *) model{
    if (model.temperature) {
        self.lbSubTitle.text = [NSString stringWithFormat:@"%.1f℃", model.temperature];
        self.lbSubTitle2.text = model.humidness;
    }
    else{
        self.lbSubTitle.text = model.subTitle;
        self.lbSubTitle2.text = model.subTitle2;
    }
    CGRect lbTitleR = [self attributedLabel:self.lbTitle str:@"[" size1:16 color1:[UIColor blackColor] size2:14 color2:[UIColor grayColor]];
    [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(UIWIDTH(141));
        make.bottom.equalTo(self.contentView.mas_centerY);
        make.width.mas_equalTo(lbTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbTitleR.size.height);
    }];
    
    
    CGRect lbSubTitleR = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 18);
    [self.lbSubTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lbTitle.mas_left);
        make.top.equalTo(self.contentView.mas_centerY);
        make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbSubTitleR.size.height);
        
    }];
    
    if (!seperatedLineView) {
        seperatedLineView = [[UIView alloc] init];
        [self.contentView addSubview:seperatedLineView];
        seperatedLineView.backgroundColor = [UIColor grayColor];
    }
    [seperatedLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lbSubTitle.mas_right).offset(10);
        make.top.equalTo(self.lbSubTitle);
        make.height.mas_equalTo(lbSubTitleR.size.height);
        make.width.mas_equalTo(2);
    }];
    
    CGRect lbSubTitle2R = LABEL_RECT(self.lbSubTitle2.text, 0, 0, 1, 18);
    [self.lbSubTitle2 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(seperatedLineView.mas_right).offset(10);
        make.top.equalTo(self.lbSubTitle);
        make.height.mas_equalTo(lbSubTitle2R.size.height);
        make.width.mas_equalTo(lbSubTitle2R.size.width + 0.5);
    }];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
