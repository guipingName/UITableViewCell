//
//  TimerCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/26.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "TimerCell.h"

@implementation TimerCell

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    self.lbTitle.text = model.title;
    self.lbTitle.numberOfLines = 0;
    self.lbTitle.font = [UIFont systemFontOfSize:15];
    self.bgImageView.image = [[UIImage imageNamed:model.imageName] rt_tintedImageWithColor:[UIColor colorWithRed:123/255.0 green:179/255.0 blue:89/255.0 alpha:1]];
    
    CGRect lbTitleR = LABEL_RECT(self.lbTitle.text, UIWIDTH(300), 40, 1, 15);
    [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.contentView).offset(UIWIDTH(170));
        make.width.mas_equalTo(lbTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbTitleR.size.height);
    }];
    if (model.isClicked) {
        _lbSubTitle2.text = [self currentTime];
        lbTitleR = LABEL_RECT(self.lbTitle.text, 150, 20, 1, 15);
        CGRect lbSubTitle2R = LABEL_RECT(_lbSubTitle2.text, 0, 0, 1, 12);
        
        [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_centerY).offset(-UIHEIGHT(5));
            make.left.equalTo(self.contentView).offset(UIWIDTH(170));
            make.width.mas_equalTo(lbTitleR.size.width + 0.5);
            make.height.mas_equalTo(lbTitleR.size.height);
        }];
        [_lbSubTitle2 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_centerY).offset(UIHEIGHT(5));
            make.left.equalTo(self.lbTitle.mas_left);
            make.width.mas_equalTo(lbSubTitle2R.size.width + 0.5);
            make.height.mas_equalTo(lbSubTitle2R.size.height);
        }];
    }
}

- (NSString *) currentTime{
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"HH:mm"];
    return [NSString stringWithFormat:@"%@ 执行", [formater stringFromDate:[NSDate date]]];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.rightImageView removeFromSuperview];
        [self.subImageView1 removeFromSuperview];
        [self.subImageView2 removeFromSuperview];
        [self.subImageView3 removeFromSuperview];
        
        [self.bgImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(27);
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.centerX.equalTo(self.contentView.mas_left).offset(UIWIDTH(90));
        }];
        self.bgImageView.layer.cornerRadius = 13.5;
        self.bgImageView.backgroundColor = [UIColor whiteColor];
        
        self.lbSubTitle.text = @"试一试";
        self.lbSubTitle.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:217/255.0];
        self.lbSubTitle.font = [UIFont systemFontOfSize:14];
        CGRect lbSubTitleR = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 14);
        [self.lbSubTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.right.equalTo(self.contentView).offset(-UIWIDTH(19));
            make.width.mas_equalTo(lbSubTitleR.size.width + 20);
            make.height.mas_equalTo(lbSubTitleR.size.height + 10);
        }];
        self.lbSubTitle.textAlignment = NSTextAlignmentCenter;
        self.lbSubTitle.layer.cornerRadius = lbSubTitleR.size.height / 2 + 5;
        self.lbSubTitle.layer.borderWidth = 1;
        self.lbSubTitle.layer.borderColor = [UIColor colorWithRed:217/255.0 green:217/255.0 blue:217/255.0 alpha:217/255.0].CGColor;
        
        
        if (!_lbSubTitle2) {
            _lbSubTitle2 = [[UILabel alloc] init];
            [self.contentView addSubview:_lbSubTitle2];
            _lbSubTitle2.font = [UIFont systemFontOfSize:12];
            _lbSubTitle2.textColor = [UIColor grayColor];
        }
        
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(30));
            make.right.equalTo(self.contentView.mas_right);
            make.height.mas_equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        self.lineView.backgroundColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:221/255.0 alpha:217/255.0];
        
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
