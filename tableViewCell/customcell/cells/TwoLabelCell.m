//
//  TwoLabelCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/24.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "TwoLabelCell.h"


@implementation TwoLabelCell{
    UIImageView *imageView;
}

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    self.lbTitle.text = model.title;
    _lbSubTitle.text = model.subTitle;
    self.lbTitle.font = [UIFont systemFontOfSize:18];
    CGRect lbTitleR = LABEL_RECT(self.lbTitle.text, WIDTH / 2, 0, 1, 18);
    
    CGRect lbSubTitleR = LABEL_RECT(_lbSubTitle.text, UIWIDTH(220), 0, 1, 14);
    [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(UIWIDTH(32));
        make.height.mas_equalTo(lbTitleR.size.height);
        make.width.mas_equalTo(lbTitleR.size.width + 0.5);
    }];
    
    _lbSubTitle.textColor = THEME_COLOR;
    _lbSubTitle.textAlignment = NSTextAlignmentRight;
    [_lbSubTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView).offset(-UIWIDTH(32));
        make.height.mas_equalTo(lbSubTitleR.size.height);
        make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
    }];
    
    if (model.needUpdate) {
        if (!imageView) {
            imageView = [[UIImageView alloc] init];
            [self.contentView addSubview:imageView];
        }
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(-UIWIDTH(32));
            make.height.width.mas_equalTo(15);
        }];
        if (model.progress == 1.0) {
            imageView.image = [[UIImage imageNamed:@"升级100%"] rt_tintedImageWithColor:[UIColor greenColor]];
        }
        else{
            imageView.image = [[UIImage imageNamed:@"升级60%72"] rt_tintedImageWithColor:[UIColor greenColor]];
        }
        [_lbSubTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(imageView.mas_left).offset(-10);
            make.height.mas_equalTo(lbSubTitleR.size.height);
            make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
        }];
    }
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if (!_lbSubTitle) {
            _lbSubTitle = [[UILabel alloc] init];
            [self.contentView addSubview:_lbSubTitle];
            _lbSubTitle.font = [UIFont systemFontOfSize:14];
        }
        self.lineView.backgroundColor = [UIColor colorWithRed:221/255.0 green:220/255.0 blue:223/255.0 alpha:1];
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
