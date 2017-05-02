//
//  EletricCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "EletricCell.h"

@implementation EletricCell

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    self.lbTitle.text = [NSString stringWithFormat:@"%@度", model.electric];
    _lbFengdian.text = [NSString stringWithFormat:@"峰电%@", model.electricfeng];
    _lbGudian.text = [NSString stringWithFormat:@"谷电%@", model.electricgu];
    _month.text = [NSString stringWithFormat:@"%ld月", (long)model.month];
    if (model.month % 2) {
        self.rightImageView.backgroundColor = THEME_COLOR;
    }
    else{
        self.rightImageView.backgroundColor = [UIColor colorWithRed:0/255.0 green:139/255.0 blue:180/255.0 alpha:1];
    }
    UIColor *color = THEME_COLOR;
    CGRect lbMonthR = [self attributedLabel:_month str:@"月" size1:16 color1:color size2:10 color2:color];
    self.bgImageView.image = [[UIImage imageNamed:@"日历"] rt_tintedImageWithColor:color];
    [_month mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bgImageView.mas_centerY).offset(3);
        make.centerX.equalTo(self.bgImageView.mas_centerX);
        make.height.mas_equalTo(lbMonthR.size.height);
        make.width.mas_equalTo(lbMonthR.size.width + 0.5);
    }];
    
    CGRect lbTitleR = [self attributedLabel:self.lbTitle str:@"度" size1:30 color1:[UIColor blackColor] size2:18 color2:[UIColor blackColor]];
    [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView).offset(UIWIDTH(190));
        make.height.mas_equalTo(lbTitleR.size.height);
        make.width.mas_equalTo(lbTitleR.size.width + 0.5);
    }];
    
    CGRect lbFengdianR = LABEL_RECT(_lbFengdian.text, 0, 0, 1, 8);
    [_lbFengdian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.rightImageView.mas_centerY).offset(-5);
        make.centerX.equalTo(self.rightImageView);
        make.height.mas_equalTo(lbFengdianR.size.height);
        make.width.mas_equalTo(lbFengdianR.size.width + 0.5);
    }];
    
    CGRect lbGudianR = LABEL_RECT(_lbGudian.text, 0, 0, 1, 8);
    [_lbGudian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rightImageView.mas_centerY).offset(5);
        make.centerX.equalTo(self.rightImageView);
        make.height.mas_equalTo(lbGudianR.size.height);
        make.width.mas_equalTo(lbGudianR.size.width + 0.5);
    }];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(30));
            make.right.equalTo(self.contentView.mas_right);
            make.height.mas_equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        self.lineView.backgroundColor = [UIColor colorWithRed:200/255.0 green:199/255.0 blue:204/255.0 alpha:1];
        
        
        [self.bgImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(UIWIDTH(14));
            make.height.width.mas_equalTo(UIWIDTH(75));
            
        }];
        self.bgImageView.layer.cornerRadius = 0;
        self.bgImageView.layer.masksToBounds = NO;
        self.bgImageView.backgroundColor = [UIColor clearColor];
        
        
        if (!_month) {
            _month = [[UILabel alloc] init];
            [self.bgImageView addSubview:_month];
        }
        
        if (!_moreView) {
            _moreView = [[UIImageView alloc] init];
            [self.contentView addSubview:_moreView];
            [_moreView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(UIHEIGHT(9));
                make.width.mas_equalTo(UIWIDTH(70));
                make.bottom.equalTo(self.contentView).offset(-UIHEIGHT(11));
                make.left.equalTo(self.contentView).offset(UIWIDTH(412));
            }];
            for (int i=0; i<4; i++) {
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(UIWIDTH(20) * i, 0, UIWIDTH(10), UIHEIGHT(9))];
                [_moreView addSubview:view];
                if ( i == 3) {
                    view.backgroundColor = THEME_COLOR;
                }
                else{
                    view.backgroundColor = [UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];;
                }
            }
        }
        
        [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-UIWIDTH(20));
            make.centerY.equalTo(self.contentView);
            make.height.width.mas_equalTo(UIWIDTH(100));
        }];
        self.rightImageView.image = [UIImage imageNamed:@""];
        self.rightImageView.layer.cornerRadius = UIWIDTH(50);
        
        if (!_lbFengdian) {
            _lbFengdian = [[UILabel alloc] init];
            [self.rightImageView addSubview:_lbFengdian];
            _lbFengdian.font = [UIFont systemFontOfSize:8];
            _lbFengdian.textColor = [UIColor whiteColor];
        }
        if (!_lbGudian) {
            _lbGudian = [[UILabel alloc] init];
            [self.rightImageView addSubview:_lbGudian];
            _lbGudian.font = [UIFont systemFontOfSize:8];
            _lbGudian.textColor = [UIColor whiteColor];
        }
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
