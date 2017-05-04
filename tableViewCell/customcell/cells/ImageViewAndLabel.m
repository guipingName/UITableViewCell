//
//  ImageViewAndLabel.m
//  tableViewCell
//
//  Created by guiping on 2017/4/24.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "ImageViewAndLabel.h"

@implementation ImageViewAndLabel

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    self.lbTitle.text = model.title;
    self.lbTitle.font = [UIFont systemFontOfSize:18];
    
    _bgImageView.backgroundColor = [UIColor whiteColor];
    self.bgImageView.image = [UIImage imageNamed:model.imageName];
    
    CGRect lbtitleR = LABEL_RECT(self.lbTitle.text, 0, 0, 1, 18);
    [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.left.equalTo(self.bgImageView.mas_right).offset(5);
        make.height.mas_equalTo(lbtitleR.size.height);
        make.width.mas_equalTo(lbtitleR.size.width + 0.5);
    }];
    
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if (!_bgImageView) {
            _bgImageView = [[UIImageView alloc] init];
            [self.contentView addSubview:_bgImageView];
            [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView).offset(UIWIDTH(26));
                make.height.width.mas_equalTo(40);
                make.centerY.equalTo(self.contentView.mas_centerY);
            }];
            //_bgImageView.backgroundColor = THEME_COLOR;
            self.bgImageView.layer.cornerRadius = 20;
            self.bgImageView.layer.masksToBounds = YES;
            self.lbTitle.textColor = [UIColor blackColor];
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
