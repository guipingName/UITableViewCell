//
//  LogListCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/24.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "LogListCell.h"

@implementation LogListCell{
    UIView *line;
}

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    self.lbTitle.text = model.title;
    self.lbSubTitle.text = model.subTitle;
    
    self.lbSubTitle.text = model.subTitle;
    self.lbSubTitle2.text = model.subTitle2;
    _lbDeviceId.text = model.deviceId;
    
    
    self.lbSubTitle2.textColor = [UIColor blackColor];
    self.lbTitle.textColor = [UIColor whiteColor];
    self.lbSubTitle.textColor = [UIColor whiteColor];
    _lbDeviceId.textColor = [UIColor whiteColor];

    CGRect lbTitleR = LABEL_RECT(self.lbTitle.text, 0, 0, 1, 18);
    CGRect lbSubTitleR = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 15);
    
    [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rightImageView.mas_right).offset(20);
        make.top.equalTo(self.contentView).offset(10);
        make.width.mas_equalTo(lbTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbTitleR.size.height);
    }];
    [self.lbSubTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lbTitle.mas_left);
        make.top.equalTo(self.lbTitle.mas_bottom);
        make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbSubTitleR.size.height);
        
    }];
    
    CGRect lbDeviceIdR = LABEL_RECT(_lbDeviceId.text, 0, 0, 1, 15);
    CGRect lbSubTitle2R = LABEL_RECT(self.lbSubTitle2.text, 0, 0, 1, 15);
    [_lbDeviceId mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lbTitle.mas_left);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.width.mas_equalTo(lbDeviceIdR.size.width + 0.5);
        make.height.mas_equalTo(lbDeviceIdR.size.height);
        
    }];
    
    [self.lbSubTitle2 mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lbTitle.mas_left);
        make.bottom.equalTo(_lbDeviceId.mas_top);
        make.width.mas_equalTo(lbSubTitle2R.size.width + 0.5);
        make.height.mas_equalTo(lbSubTitle2R.size.height);
        
    }];
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.lineView removeFromSuperview];
        [self.bgImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.left.bottom.right.mas_equalTo(self.contentView);
        }];
        self.bgImageView.layer.cornerRadius = 0;
        
        if (!_lbDeviceId) {
            _lbDeviceId = [[UILabel alloc] init];
            [self.contentView addSubview:_lbDeviceId];
        }
        
        
        if (!line) {
            line = [[UIView alloc] init];
            [self.contentView addSubview:line];
            [line mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView.mas_left).offset(80);
                make.top.bottom.equalTo(self.contentView);
                make.width.mas_equalTo(1);
            }];
            line.backgroundColor = [UIColor grayColor];
        }
        [self.contentView bringSubviewToFront:self.rightImageView];
        
        [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(10);
            make.height.width.mas_equalTo(40);
            make.centerX.equalTo(line.mas_centerX);
        }];
        self.rightImageView.layer.cornerRadius = 20;
        self.rightImageView.layer.borderWidth = 1;
        self.rightImageView.layer.borderColor = [UIColor cyanColor].CGColor;
        self.rightImageView.backgroundColor = THEME_COLOR;
        self.rightImageView.image = [UIImage imageNamed:@""];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        label.text = @"联";
        label.center = CGPointMake(20, 20);
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        [self.rightImageView addSubview:label];
        
        
        self.lbTitle.font = [UIFont systemFontOfSize:18];
        self.lbSubTitle.font = [UIFont systemFontOfSize:15];
        self.lbSubTitle2.font = [UIFont systemFontOfSize:15];
        _lbDeviceId.font = [UIFont systemFontOfSize:15];
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