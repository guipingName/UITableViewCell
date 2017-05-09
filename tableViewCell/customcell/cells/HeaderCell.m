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
    [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_centerY).offset(-UIHEIGHT(6));
        make.left.equalTo(self.contentView).offset(UIWIDTH(170));
        make.height.mas_equalTo(lbtitleR.size.height);
        make.width.mas_equalTo(lbtitleR.size.width + 0.5);
    }];
    
    if (model.subTitle) {
        _lbSubTitle.text = model.subTitle;
        _lbSubTitle.textColor = [UIColor grayColor];
        _lbSubTitle.font = [UIFont systemFontOfSize:12];
        CGRect lbSubTitleR = LABEL_RECT(_lbSubTitle.text, 0, 0, 1, 12);
        [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_centerY).offset(-(lbtitleR.size.height + lbSubTitleR.size.height) / 2);
            make.left.equalTo(self.contentView).offset(UIWIDTH(170));
            make.height.mas_equalTo(lbtitleR.size.height);
            make.width.mas_equalTo(lbtitleR.size.width + 0.5);
        }];
        [_lbSubTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.lbTitle);
            make.top.equalTo(self.lbTitle.mas_bottom);
            make.height.mas_equalTo(lbSubTitleR.size.height);
            make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
        }];
    }
    if (model.subTitle2) {
        _lbSubTitle2.text = model.subTitle2;
        _lbSubTitle2.textColor = [UIColor grayColor];
        _lbSubTitle2.font = [UIFont systemFontOfSize:12];
        CGRect lbSubTitle2R = LABEL_RECT(_lbSubTitle2.text, 0, 0, 1, 12);
        [_lbSubTitle2 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_lbSubTitle.mas_right).offset(10);
            make.top.equalTo(self.lbTitle.mas_bottom);
            make.height.mas_equalTo(lbSubTitle2R.size.height);
            make.width.mas_equalTo(lbSubTitle2R.size.width + 0.5);
        }];
    }
    if (model.subTitle3) {
        _lbSubTitle3.text = model.subTitle3;
        _lbSubTitle3.textColor = [UIColor grayColor];
        _lbSubTitle3.font = [UIFont systemFontOfSize:12];
        CGRect lbSubTitle3R = LABEL_RECT(_lbSubTitle3.text, 0, 0, 1, 12);
        _lbSubTitle3.text = model.subTitle3;
        [_lbSubTitle3 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_lbSubTitle2.mas_right).offset(10);
            make.top.equalTo(self.lbTitle.mas_bottom);
            make.height.mas_equalTo(lbSubTitle3R.size.height);
            make.width.mas_equalTo(lbSubTitle3R.size.width + 0.5);
        }];
        
        if (!_rightImageView) {
            _rightImageView = [[UIImageView alloc] init];
            [self.contentView addSubview:_rightImageView];
            [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.width.mas_equalTo(26);
                make.centerY.equalTo(self.contentView);
                make.right.equalTo(self.contentView).offset(-UIWIDTH(22));
            }];
            _rightImageView.image = [[UIImage imageNamed:@"标签_右箭头"] rt_tintedImageWithColor:[UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1]];
            
            [_rightButton mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.height.width.mas_equalTo(10);
                make.centerY.equalTo(self.contentView);
                make.right.equalTo(_rightImageView.mas_left);
            }];
        }
    }
    
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
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
        self.bgImageView.layer.cornerRadius = UIWIDTH(56);
        
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.contentView);
            make.height.mas_equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        if (!_rightButton) {
            _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.contentView addSubview:_rightButton];
            [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.width.mas_equalTo(10);
                make.centerY.equalTo(self.contentView.mas_centerY);
                make.right.equalTo(self.contentView).offset(-UIWIDTH(35));
            }];
        }
        [_rightButton addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
        [_rightButton setImage:[[UIImage imageNamed:@"triangle"] rt_tintedImageWithColor:[UIColor grayColor]] forState:UIControlStateNormal];
        UIColor *color = THEME_COLOR;
        [_rightButton setImage:[[UIImage imageNamed:@"triangle"] rt_tintedImageWithColor:color] forState:UIControlStateSelected];
        
        if (!_lbSubTitle) {
            _lbSubTitle = [[UILabel alloc] init];
            [self.contentView addSubview:_lbSubTitle];
        }
        if (!_lbSubTitle2) {
            _lbSubTitle2 = [[UILabel alloc] init];
            [self.contentView addSubview:_lbSubTitle2];
        }
        if (!_lbSubTitle3) {
            _lbSubTitle3 = [[UILabel alloc] init];
            [self.contentView addSubview:_lbSubTitle3];
        }
        
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
