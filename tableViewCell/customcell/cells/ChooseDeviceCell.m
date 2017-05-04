//
//  ChooseDeviceCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/24.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "ChooseDeviceCell.h"

@implementation ChooseDeviceCell

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    self.lbTitle.text = model.title;
    self.lbSubTitle.text = model.subTitle;
    self.bgImageView.image = [UIImage imageNamed:model.imageName];
    if (model.selected) {
        _rightButton.selected = YES;
    }
    else{
        _rightButton.selected = NO;
    }
    
    CGRect lbTitleR = [self attributedLabel:self.lbTitle str:@"[" size1:18 color1:[UIColor blackColor] size2:14 color2:[UIColor grayColor]];
    self.lbSubTitle.font = [UIFont systemFontOfSize:14];
    CGRect lbSubTitleR = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 14);
    
    [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(UIWIDTH(141));
        make.width.mas_equalTo(lbTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbTitleR.size.height);
        //make.top.equalTo(self.contentView.mas_centerY).offset(-(lbTitleR.size.height + lbSubTitleR.size.height) / 2);
        make.bottom.equalTo(self.contentView.mas_centerY).offset(- UIHEIGHT(6));
    }];
    
    self.lbSubTitle.textColor = [UIColor blackColor];
    [self.lbSubTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lbTitle);
        make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbSubTitleR.size.height);
        //make.bottom.equalTo(self.contentView.mas_centerY).offset((lbTitleR.size.height + lbSubTitleR.size.height) / 2);
        make.top.equalTo(self.contentView.mas_centerY).offset(UIHEIGHT(6));
    }];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.rightImageView removeFromSuperview];
        if (!_rightButton) {
            _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.contentView addSubview:_rightButton];
            [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.contentView);
                make.right.equalTo(self.contentView).offset(-UIWIDTH(32));
                make.height.width.mas_equalTo(UIWIDTH(37));
            }];
        }
        [_rightButton setImage:[UIImage imageNamed:@"标签_未选"] forState:UIControlStateNormal];
        [_rightButton setImage:[UIImage imageNamed:@"标签_选中"] forState:UIControlStateSelected];
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
