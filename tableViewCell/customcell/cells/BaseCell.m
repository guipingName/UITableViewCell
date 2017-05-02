//
//  BaseCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/24.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    self.lbTitle.text = model.title;
    self.backgroundColor = THEME_COLOR;
    self.bgImageView.image = [UIImage imageNamed:model.imageName];
    _lbSubTitle.text = [NSString stringWithFormat:@"%ld/%ld", (long)model.online, (long)model.total];
    self.rightImageView.image = [UIImage imageNamed:@"标签_右箭头"];
    
    self.lbTitle.textColor = [UIColor whiteColor];
    _lbSubTitle.textColor = [UIColor whiteColor];
    self.lbTitle.font = [UIFont systemFontOfSize:22];
    CGRect lbTitleR = LABEL_RECT(self.lbTitle.text, 0, 0, 1, 22);
    CGRect lbSubTitleR = LABEL_RECT(_lbSubTitle.text, 0, 0, 1, 14);
    [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_centerY).offset(-UIHEIGHT(30));
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.width.mas_equalTo(lbTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbTitleR.size.height);
    }];
    [_lbSubTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_centerY).offset(UIHEIGHT(58));
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.height.mas_equalTo(lbSubTitleR.size.height);
        make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
    }];  
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.bgImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView);
            make.bottom.equalTo(self.contentView).offset(-UIHEIGHT(8));
            make.left.equalTo(self.contentView.mas_left).offset(UIWIDTH(36));
            make.width.mas_equalTo(UIWIDTH(150));
        }];
        self.bgImageView.layer.cornerRadius = 0;
        self.bgImageView.layer.masksToBounds = NO;
        self.bgImageView.backgroundColor = THEME_COLOR;
        [self.contentView sendSubviewToBack:self.bgImageView];
        
        if (!_lbSubTitle) {
            _lbSubTitle = [[UILabel alloc] init];
            [self.contentView addSubview:_lbSubTitle];
            _lbSubTitle.font = [UIFont systemFontOfSize:14];
        }
        
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(self.contentView);
            make.height.mas_equalTo(UIHEIGHT(8));
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        self.lineView.backgroundColor = [UIColor whiteColor];
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
