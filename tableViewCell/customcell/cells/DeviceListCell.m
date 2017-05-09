//
//  DeviceListCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "DeviceListCell.h"

@implementation DeviceListCell{
    CGRect tempRect;
    UIButton *button;
}

+(CGFloat)getCellHeightWithCellStyle:(GPModel *)cellModel{
    return UIHEIGHT(320);
}

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    UIColor *color = THEME_COLOR;
    self.rightImageView.image = [[UIImage imageNamed:model.imageName] rt_tintedImageWithColor:color];
    
    if (!model.DeviceType) {
        self.lbTitle.text = [NSString stringWithFormat:@"%ld款在线", (long)model.online];
        self.lbSubTitle.text = model.title;
        self.lbSubTitle2.text = [NSString stringWithFormat:@"%ld款离线", (long)model.offline];
        
        self.lbSubTitle.font = [UIFont systemFontOfSize:15];
        CGRect lbSubTitleR = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 15);
        
        [self.lbSubTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-UIHEIGHT(28));
            make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
            make.height.mas_equalTo(lbSubTitleR.size.height);
        }];
        self.lbSubTitle.textColor = [UIColor whiteColor];
    }
    else{
        self.lbTitle.text = [NSString stringWithFormat:@"%ld新设备", (long)model.online];
        self.lbSubTitle2.text = @"一键绑定";
        if (!button) {
            button = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.contentView addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.contentView);
                make.bottom.equalTo(self.contentView).offset(-UIHEIGHT(28));
                make.height.width.mas_equalTo(10);
            }];
        }
        [button setImage:[[UIImage imageNamed:@"triangle"] rt_tintedImageWithColor:[UIColor whiteColor]] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    self.rightImageView.backgroundColor = [UIColor whiteColor];
    
    self.lbTitle.font = [UIFont systemFontOfSize:15];
    CGRect lbTitleR = LABEL_RECT(self.lbTitle.text, 0, 0, 1, 15);
    [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(UIWIDTH(72));
        make.bottom.equalTo(self.contentView).offset(-UIHEIGHT(28));
        make.width.mas_equalTo(lbTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbTitleR.size.height);
    }];
    tempRect = lbTitleR;
    self.lbTitle.textColor = [UIColor whiteColor];
    
    self.lbSubTitle2.font = [UIFont systemFontOfSize:15];
    CGRect lbSubTitle2R = LABEL_RECT(self.lbSubTitle2.text, 0, 0, 1, 15);
    [self.lbSubTitle2 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-UIWIDTH(72));
        make.bottom.equalTo(self.lbTitle);
        make.height.mas_equalTo(lbSubTitle2R.size.height);
        make.width.mas_equalTo(lbSubTitle2R.size.width + 0.5);
    }];
    self.lbSubTitle2.textColor = [UIColor whiteColor];
    
    [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.contentView).offset(UIHEIGHT(40));
        make.bottom.equalTo(self.lbTitle.mas_top).offset(-UIHEIGHT(27));
        make.width.equalTo(self.rightImageView.mas_height);
    }];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.bgImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.mas_equalTo(self.contentView);
        }];
        self.bgImageView.backgroundColor = THEME_COLOR;
        self.bgImageView.layer.cornerRadius = 0;
        
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.contentView);
            make.height.mas_equalTo(1);
            make.bottom.equalTo(self.contentView);
        }];
        self.lineView.backgroundColor = [UIColor colorWithRed:114/255.0 green:207/255.0 blue:237/255.0 alpha:1];
    }
    return self;
}

-(void)layoutSubviews{
    self.rightImageView.layer.cornerRadius = (self.contentView.bounds.size.height - UIHEIGHT(95) - tempRect.size.height) / 2;
}

- (void) buttonClicked:(UIButton *) sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        if (_buttonClickedBlock) {
            _buttonClickedBlock(YES);
        }
    }
    else{
        if (_buttonClickedBlock) {
            _buttonClickedBlock(NO);
        }
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
