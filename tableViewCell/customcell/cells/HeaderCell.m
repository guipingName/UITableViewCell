//
//  HeaderCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/25.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "HeaderCell.h"

@implementation HeaderCell{
    GPModel *tempModel;
}

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    tempModel = model;
    self.lbTitle.text = model.title;
    self.bgImageView.image = [UIImage imageNamed:model.imageName];
    CGRect lbtitleR = LABEL_RECT(self.lbTitle.text, 0, 0, 1, 22);
    
    if (!model.subTitle) {
        [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_centerY).offset(-UIHEIGHT(6));
            make.left.equalTo(self.contentView).offset(UIWIDTH(170));
            make.height.mas_equalTo(lbtitleR.size.height);
            make.width.mas_equalTo(lbtitleR.size.width + 0.5);
        }];
    }
    else{
        if (model.subTitle3) {
            self.lbSubTitle.text = [NSString stringWithFormat:@"%@  %@  %@", model.subTitle, model.subTitle2, model.subTitle3];
        }
        else if (model.subTitle2) {
            self.lbSubTitle.text = [NSString stringWithFormat:@"%@  %@", model.subTitle, model.subTitle2];
        }
        else{
            self.lbSubTitle.text = model.subTitle;
        }
        
        
        self.lbSubTitle.textColor = [UIColor grayColor];
        self.lbSubTitle.font = [UIFont systemFontOfSize:12];
        CGRect lbSubTitleR = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 12);
        
        [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_centerY).offset(-(lbtitleR.size.height + lbSubTitleR.size.height + 2) / 2);
            make.left.equalTo(self.contentView).offset(UIWIDTH(170));
            make.height.mas_equalTo(lbtitleR.size.height);
            make.width.mas_equalTo(lbtitleR.size.width + 0.5);

        }];
        
        [self.lbSubTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lbTitle);
            make.top.equalTo(self.lbTitle.mas_bottom).offset(2);
            make.height.mas_equalTo(lbSubTitleR.size.height);
            make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
        }];
    }
    
    // 显示右侧箭头 调整按钮位置
    if (model.subTitle3) {
        [_rightButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(10);
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.rightImageView.mas_left);
        }];
    }
    else{
        [self.rightImageView removeFromSuperview];
    }
    
    // 按钮选中状态
    if (model.isClicked) {
        _rightButton.selected = YES;
    }
    else{
        _rightButton.selected = NO;
    }
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1];
        self.lineView.backgroundColor = [UIColor colorWithRed:223/255.0 green:223/255.0 blue:223/255.0 alpha:1];
        self.bgImageView.backgroundColor = THEME_COLOR;
        [self.bgImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(32));
            make.height.width.mas_equalTo(UIWIDTH(112));
            make.centerY.equalTo(self.contentView);
        }];
        self.bgImageView.layer.cornerRadius = UIWIDTH(56);
        
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.contentView);
            make.height.mas_equalTo(1);
            make.bottom.equalTo(self.contentView);
        }];
        if (!_rightButton) {
            _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.contentView addSubview:_rightButton];
            [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.width.mas_equalTo(10);
                make.centerY.equalTo(self.contentView);
                make.right.equalTo(self.contentView).offset(-UIWIDTH(35));
            }];
        }
        [_rightButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
        [_rightButton setImage:[[UIImage imageNamed:@"triangle"] rt_tintedImageWithColor:[UIColor grayColor]] forState:UIControlStateNormal];
        UIColor *color = THEME_COLOR;
        [_rightButton setImage:[[UIImage imageNamed:@"triangle"] rt_tintedImageWithColor:color] forState:UIControlStateSelected];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonClicked)];
        
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void) buttonClicked{
    _rightButton.selected = !_rightButton.selected;
    if (_rightButton.selected) {
        tempModel.isClicked = YES;
        if (_clickedBlock) {
            _clickedBlock(YES, tempModel);
        }
    }
    else{
        tempModel.isClicked = NO;
        if (_clickedBlock) {
            _clickedBlock(NO, tempModel);
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
