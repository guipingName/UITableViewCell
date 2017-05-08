//
//  DeviceCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "DeviceCell.h"

@implementation DeviceCell

+(CGFloat)getCellHeightWithCellStyle:(GPModel *)cellModel{
    if (cellModel.subCell) {
        return UIHEIGHT(140);
    }
    return UIHEIGHT(160);
}

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

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    self.lbTitle.text = model.title;
    self.lbSubTitle.text = model.subTitle;
    [self imageJudge:model];
    
    CGRect lbTitleR = [self attributedLabel:self.lbTitle str:@"[" size1:14 color1:[UIColor blackColor] size2:12 color2:[UIColor grayColor]];
    self.lbSubTitle.font = [UIFont systemFontOfSize:18];
    CGRect lbSubTitleR = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 18);
    if (model.subCell) {
        self.bgImageView.backgroundColor = [UIColor whiteColor];
        UIColor *color = THEME_COLOR;
        self.bgImageView.image = [[UIImage imageNamed:model.imageName] rt_tintedImageWithColor:color];
        self.lbSubTitle.font = [UIFont systemFontOfSize:12];
        lbSubTitleR = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 12);
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
        
        [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(280));
            make.width.mas_equalTo(lbTitleR.size.width + 0.5);
            make.height.mas_equalTo(lbTitleR.size.height);
            make.top.equalTo(self.contentView.mas_centerY).offset(-(lbTitleR.size.height + lbSubTitleR.size.height) / 2);
        }];
    }
    else{
        self.bgImageView.image = [UIImage imageNamed:model.imageName];
        [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(141));
            make.width.mas_equalTo(lbTitleR.size.width + 0.5);
            make.height.mas_equalTo(lbTitleR.size.height);
            make.top.equalTo(self.contentView.mas_centerY).offset(-(lbTitleR.size.height + lbSubTitleR.size.height) / 2);
        }];
    }
    self.lbSubTitle.textColor = [UIColor blackColor];
    [self.lbSubTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lbTitle.mas_left);
        make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbSubTitleR.size.height);
        make.bottom.equalTo(self.contentView.mas_centerY).offset((lbTitleR.size.height + lbSubTitleR.size.height) / 2);
    }];
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.bgImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(20));
            make.height.width.mas_equalTo(UIWIDTH(100));
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
        self.bgImageView.layer.cornerRadius = UIWIDTH(50);
        self.bgImageView.layer.masksToBounds = YES;
        
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(20));
            make.right.equalTo(self.contentView.mas_right);
            make.height.mas_equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        self.lineView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        
        if (!_subImageView1) {
            _subImageView1 = [[UIImageView alloc] init];
            [self.contentView addSubview:_subImageView1];
            self.subImageView1.hidden = YES;
            [_subImageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.width.mas_equalTo(20);
                make.centerY.equalTo(self.contentView.mas_centerY);
                make.right.equalTo(self.rightImageView.mas_left).offset(0);
            }];
        }
        
        if (!_subImageView2) {
            _subImageView2 = [[UIImageView alloc] init];
            [self.contentView addSubview:_subImageView2];
            self.subImageView2.hidden = YES;
            [_subImageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.width.mas_equalTo(20);
                make.centerY.equalTo(self.contentView.mas_centerY);
                make.right.equalTo(_subImageView1.mas_left).offset(-3);
            }];
        }
        
        if (!_subImageView3) {
            _subImageView3 = [[UIImageView alloc] init];
            [self.contentView addSubview:_subImageView3];
            self.subImageView3.hidden = YES;
            [_subImageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.width.mas_equalTo(20);
                make.centerY.equalTo(self.contentView.mas_centerY);
                make.right.equalTo(_subImageView2.mas_left).offset(-3);
            }];
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
