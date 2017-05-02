//
//  WarningCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "WarningCell.h"

@implementation WarningCell

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    self.lbTitle.text = model.title;
    self.lbSubTitle.text = model.subTitle;
    
    CGRect lbTitleR = CGRectZero;
    if (model.warmingCount) {
        UIColor *color = THEME_COLOR;
        lbTitleR = [self attributedLabel:self.lbTitle str:@"[" size1:16 color1:color size2:14 color2:[UIColor grayColor]];
        self.lbSubTitle.text = [NSString stringWithFormat:@"%ld台报警", (long)model.warmingCount];
    }
    else{
        lbTitleR = [self attributedLabel:self.lbTitle str:@"[" size1:16 color1:[UIColor blackColor] size2:14 color2:[UIColor grayColor]];
        self.lbSubTitle.text = @"报警";
    }
    [self imageJudge:model];
    self.bgImageView.image = [UIImage imageNamed:model.imageName];
    
    self.lbSubTitle.font = [UIFont systemFontOfSize:18];
    
    CGRect lbSubTitleR = LABEL_RECT(self.lbTitle.text, 0, 0, 1, 18);
    [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(UIWIDTH(141));
        make.width.mas_equalTo(lbTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbTitleR.size.height);
        make.top.equalTo(self.contentView.mas_centerY).offset(-(lbTitleR.size.height + lbSubTitleR.size.height) / 2);
    }];
    [self.lbSubTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lbTitle.mas_left);
        make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbSubTitleR.size.height);
        make.bottom.equalTo(self.contentView.mas_centerY).offset((lbTitleR.size.height + lbSubTitleR.size.height) / 2);
    }];
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.bgImageView.backgroundColor = [UIColor redColor];
        self.lbSubTitle.textColor = [UIColor redColor];
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
