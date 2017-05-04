//
//  TwoImageViewsLabelCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/24.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "TwoImageViewsLabelCell.h"

typedef NS_ENUM(NSInteger, colorStyle) {
    colorStyleOne = 1,
    colorStyleTwo = 2,
    colorStyleThree = 3,
    colorStyleFour = 4,
    colorStyleGrayColor = 5,
    colorStyleRedColor = 6,
    colorStyleGreenColor = 7,
    colorStyleBlueColor = 8,
    colorStyleCyanColor = 9,
    colorStyleOrangeColor = 10,
    colorStyleBrownColor = 11,
    colorStylePurpleColor = 12,
    colorStyleYellowColor = 13,
};

@implementation TwoImageViewsLabelCell

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    self.lbTitle.text = model.title;
    
    self.lbTitle.font = [UIFont systemFontOfSize:18];
    CGRect lbtitleR = LABEL_RECT(self.lbTitle.text, 0, 0, 1, 18);
    if (model.subCell) {
        [self.bgImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(UIWIDTH(54));
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.centerX.equalTo(self.contentView.mas_left).offset(UIWIDTH(90));
        }];
        self.bgImageView.layer.cornerRadius = UIWIDTH(27);
        
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(30));
            make.right.equalTo(self.contentView.mas_right);
            make.height.mas_equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        self.lineView.backgroundColor = [UIColor colorWithRed:204/255.0 green:203/255.0 blue:207/255.0 alpha:1];
        
        self.lbTitle.font = [UIFont systemFontOfSize:15];
        self.lbTitle.numberOfLines = 0;
        lbtitleR = LABEL_RECT(self.lbTitle.text, UIWIDTH(370), 0, 1, 15);
        self.bgImageView.backgroundColor = [UIColor whiteColor];
        if (model.isNormal) {
            self.bgImageView.image = [[UIImage imageNamed:model.imageName] rt_tintedImageWithColor:[UIColor colorWithRed:123/255.0 green:179/255.0 blue:89/255.0 alpha:1]];
        }
        else{
            self.bgImageView.image = [[UIImage imageNamed:model.imageName] rt_tintedImageWithColor:[UIColor grayColor]];
            self.lbTitle.textColor = [UIColor grayColor];
        }
        
        [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.left.equalTo(self.contentView).offset(UIWIDTH(169));
            make.height.mas_equalTo(lbtitleR.size.height);
            make.width.mas_equalTo(lbtitleR.size.width + 0.5);
        }];
    }
    else{
        [self.bgImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(UIWIDTH(112));
            make.centerY.equalTo(self.contentView.mas_centerY);
            make.centerX.equalTo(self.contentView.mas_left).offset(UIWIDTH(88));
        }];
        self.bgImageView.layer.cornerRadius = UIWIDTH(56);
        
        self.bgImageView.backgroundColor = [self colorWithNumber:model.backGroundColor];
        self.bgImageView.image = [UIImage imageNamed:model.imageName];
        [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_centerY).offset(-UIHEIGHT(6));
            make.left.equalTo(self.contentView).offset(UIWIDTH(170));
            make.height.mas_equalTo(lbtitleR.size.height);
            make.width.mas_equalTo(lbtitleR.size.width + 0.5);
        }];
    }
}

- (UIColor *) colorWithNumber:(NSInteger) number{
    UIColor *color = [UIColor whiteColor];
    switch (number) {
        case colorStyleOne:
            color = [UIColor colorWithRed:69/255.0 green:116/255.0 blue:247/255.0 alpha:1];
            break;
        case colorStyleTwo:
            color = [UIColor colorWithRed:0/255.0 green:177/255.0 blue:198/255.0 alpha:1];
            break;
        case colorStyleThree:
            color = [UIColor colorWithRed:239/255.0 green:130/255.0 blue:80/255.0 alpha:1];
            break;
        case colorStyleFour:
            color = [UIColor colorWithRed:123/255.0 green:179/255.0 blue:89/255.0 alpha:1];
            break;
        case colorStyleGrayColor:
            color = [UIColor grayColor];
            break;
        case colorStyleRedColor:
            color = [UIColor redColor];
            break;
        case colorStyleGreenColor:
            color = [UIColor greenColor];
            break;
        case colorStyleBlueColor:
            color = [UIColor blueColor];
            break;
        case colorStyleCyanColor:
            color = [UIColor cyanColor];
            break;
        case colorStyleOrangeColor:
            color = [UIColor orangeColor];
            break;
        case colorStyleBrownColor:
            color = [UIColor brownColor];
            break;
        case colorStylePurpleColor:
            color = [UIColor purpleColor];
            break;
        case colorStyleYellowColor:
            color = [UIColor yellowColor];
            break;
        default:
            break;
    }
    return color;
}



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        if (!_rightImageView) {
            _rightImageView = [[UIImageView alloc] init];
            [self.contentView addSubview:_rightImageView];
            [_rightImageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.height.width.mas_equalTo(26);
                make.centerY.equalTo(self.contentView.mas_centerY);
                make.right.equalTo(self.contentView).offset(-UIWIDTH(22));
            }];
            
            //self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
            _rightImageView.image = [[UIImage imageNamed:@"标签_右箭头"] rt_tintedImageWithColor:[UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1]];
            //_rightImageView.backgroundColor = [UIColor grayColor];
            //_rightImageView.layer.cornerRadius = 18;
            //_rightImageView.layer.masksToBounds = YES;
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
