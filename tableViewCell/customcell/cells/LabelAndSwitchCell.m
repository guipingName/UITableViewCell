//
//  LabelAndSwitchCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/24.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "LabelAndSwitchCell.h"

@implementation LabelAndSwitchCell{
    UIImageView *lightImageView;
    GPModel *tempModel;
}

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    tempModel = model;
    self.lbTitle.text = model.title;
    
    if (model.isOn) {
        _rightSwitch.on = YES;
    }
    else{
        _rightSwitch.on = NO;
    }
    if (!model.timerSetted) {
        self.lbTitle.font = [UIFont systemFontOfSize:18];
        CGRect lbtitleR = LABEL_RECT(self.lbTitle.text, 0, 0, 1, 18);
        [self.lbTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.left.equalTo(self.contentView).offset(UIWIDTH(21));
            make.height.mas_equalTo(lbtitleR.size.height);
            make.width.mas_equalTo(lbtitleR.size.width + 0.5);
        }];
    }
    else{
        [self moreRows:model];
    }
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if (!_rightSwitch) {
            _rightSwitch = [[UISwitch alloc] init];
            [self.contentView addSubview:_rightSwitch];
        }
        [_rightSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.right.equalTo(self.contentView).offset(-UIWIDTH(18));
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(50);
        }];
        [_rightSwitch addTarget:self action:@selector(doSwitch:) forControlEvents:UIControlEventValueChanged];
        self.lineView.backgroundColor = [UIColor colorWithRed:200/255.0 green:199/255.0 blue:204/255.0 alpha:1];
        
        if (!_lbSubtitle) {
            _lbSubtitle = [[UILabel alloc] init];
            [self.contentView addSubview:_lbSubtitle];
        }
        
        if (!_lbDate) {
            _lbDate = [[UILabel alloc] init];
            [self.contentView addSubview:_lbDate];
        }
        if (!lightImageView) {
            lightImageView = [[UIImageView alloc] init];
            [self.contentView addSubview:lightImageView];
            [lightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView.mas_left).offset(0);
                make.centerY.equalTo(self.contentView.mas_centerY);
                make.height.width.mas_equalTo(UIHEIGHT(95));
            }];
        }
        lightImageView.hidden = YES;
        
    }
    return self;
}

- (void) doSwitch:(UISwitch *) sender{
    if (sender.isOn) {
        tempModel.isOn = YES;
        if (_valueChanged) {
            _valueChanged(YES);
        }
    }
    else{
        tempModel.isOn = NO;
        if (_valueChanged) {
            _valueChanged(NO);
        }
    }
    [self changeColor:sender];
}

- (void) moreRows:(GPModel *) model{
    _lbDate.text = model.date;
    _lbDate.font = [UIFont systemFontOfSize:12];
    CGRect lbDateR = LABEL_RECT(_lbDate.text, 0, 0, 1, 12);
    
    if (model.isLight) {
        lightImageView.hidden = NO;
        if (model.backGroundColor == 1) {
            lightImageView.image = [[UIImage imageNamed:@"LEDE定时器-无效灯"] rt_tintedImageWithColor:[UIColor orangeColor]];
        }
        else{
            lightImageView.image = [[UIImage imageNamed:@"LEDE定时器-无效灯"] rt_tintedImageWithColor:[UIColor blueColor]];
        }
        
        _lbSubtitle.text = model.title;
        CGRect lbSubTitleR = [self attributedLabel:self.lbSubtitle str:@" " size1:30 color1:nil size2:12 color2:nil];
        if (model.date) {
            [_lbSubtitle mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.contentView.mas_centerY).offset(10);
                make.left.equalTo(self.contentView.mas_left).offset(UIWIDTH(105));
                make.height.mas_equalTo(lbSubTitleR.size.height);
                make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
            }];
        }
        else{
            [_lbSubtitle mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.contentView.mas_centerY);
                make.left.equalTo(self.contentView.mas_left).offset(UIWIDTH(105));
                make.height.mas_equalTo(lbSubTitleR.size.height);
                make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
            }];
        }
        
    }
    else{
        if (model.timerMode == 1) {
            [self.lbTitle removeFromSuperview];
            _lbSubtitle.text = model.title;
            CGRect lbSubTitleR = [self attributedLabel:self.lbSubtitle str:@" " size1:25 color1:nil size2:15 color2:nil];
            [_lbSubtitle mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.equalTo(self.contentView.mas_centerY).offset(10);
                make.left.equalTo(self.contentView).offset(UIWIDTH(31));
                make.height.mas_equalTo(lbSubTitleR.size.height);
                make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
            }];
        }
        else{
            _lbSubtitle.text = model.subTitle;
            CGRect lbtitleR = [self attributedLabel:self.lbTitle str:@" " size1:25 color1:nil size2:15 color2:nil];
            CGRect lbSubTitleR = [self attributedLabel:self.lbSubtitle str:@" " size1:25 color1:nil size2:15 color2:nil];
            [self.lbTitle mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.contentView.mas_top).offset(5);
                make.left.equalTo(self.contentView).offset(UIWIDTH(31));
                make.height.mas_equalTo(lbtitleR.size.height);
                make.width.mas_equalTo(lbtitleR.size.width + 0.5);
            }];
            [self.lbSubtitle mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.lbTitle.mas_bottom);
                make.left.equalTo(self.lbTitle.mas_left);
                make.height.mas_equalTo(lbSubTitleR.size.height);
                make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
            }];
        }
    }
    [_lbDate mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-UIHEIGHT(10));
        make.left.equalTo(_lbSubtitle.mas_left);
        make.height.mas_equalTo(lbDateR.size.height);
        make.width.mas_equalTo(lbDateR.size.width + 0.5);
    }];
    [self changeColor:_rightSwitch];
}

/**灯的定时器是否启用  调整颜色*/
- (void) changeColor:(UISwitch *) sender{
    if (sender.isOn) {
        self.backgroundColor = [UIColor whiteColor];
        self.lbSubtitle.textColor = [UIColor blackColor];
        self.lbDate.textColor = [UIColor blackColor];
        self.lbTitle.textColor = [UIColor blackColor];
        if (tempModel.isLight) {
            if (tempModel.backGroundColor == 1) {
                lightImageView.image = [lightImageView.image rt_tintedImageWithColor:[UIColor orangeColor]];
            }
            else{
                lightImageView.image = [lightImageView.image rt_tintedImageWithColor:[UIColor blueColor]];
            }
        }
    }
    else{
        self.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1];
        self.lbSubtitle.textColor = [UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];;
        self.lbDate.textColor = [UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];
        self.lbTitle.textColor = [UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];;
        if (tempModel.isLight) {
            lightImageView.image = [UIImage imageNamed:@"LEDE定时器-无效灯"];
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
