//
//  EletricCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "EletricCell.h"

@implementation EletricCell{
    NSMutableArray *monthArray;
}


-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    _lbCrest.text = [NSString stringWithFormat:@"峰电%@", model.electricCrest];
    _lbValley.text = [NSString stringWithFormat:@"谷电%@", model.electricValley];
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
    
    CGRect lbCrestR = LABEL_RECT(_lbCrest.text, 0, 0, 1, 8);
    [_lbCrest mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.rightImageView.mas_centerY).offset(-UIHEIGHT(11));
        make.centerX.equalTo(self.rightImageView);
        make.height.mas_equalTo(lbCrestR.size.height);
        make.width.mas_equalTo(lbCrestR.size.width + 0.5);
    }];
    
    CGRect lbValleyR = LABEL_RECT(_lbValley.text, 0, 0, 1, 8);
    [_lbValley mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.rightImageView.mas_centerY).offset(UIHEIGHT(11));
        make.centerX.equalTo(self.rightImageView);
        make.height.mas_equalTo(lbValleyR.size.height);
        make.width.mas_equalTo(lbValleyR.size.width + 0.5);
    }];
    
    [self arcforNumbers:model];
}

- (void) arcforNumbers:(GPModel *) aModel{
//    monthArray = [NSMutableArray array];
//    NSMutableArray *array = [NSMutableArray array];
//    for (int i=0; i<30; i++) {
//        NSInteger a = arc4random() % 10;
//        [array addObject:@(a)];
//    }
//    monthArray = [array copy];
//    [self dealData:array];
    
    [self dealElectricData:aModel.monthElectrics];
    
}

// 显示每周的电量图
- (void) dealElectricData:(NSArray *) array{
    CGFloat firstWeek = 0;
    CGFloat secondWeek = 0;
    CGFloat thirdWeek = 0;
    CGFloat fourthWeek = 0;
    NSInteger total = 50;
    
    for (int i=0; i<7; i++) {
        firstWeek += [array[i] integerValue];
    }
    
    for (int i=7; i<14; i++) {
        secondWeek += [array[i] integerValue];
    }
    
    for (int i=14; i<21; i++) {
        thirdWeek += [array[i] integerValue];
    }
    
    for (int i=21; i<array.count; i++) {
        fourthWeek += [array[i] integerValue];
    }
    
    self.lbTitle.text = [NSString stringWithFormat:@"%.0f度", firstWeek + secondWeek + thirdWeek + fourthWeek];
    CGRect lbTitleR = [self attributedLabel:self.lbTitle str:@"度" size1:30 color1:[UIColor blackColor] size2:18 color2:[UIColor blackColor]];
    [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY);
        make.right.equalTo(self.contentView.mas_left).offset(UIWIDTH(309));
        make.height.mas_equalTo(lbTitleR.size.height);
        make.width.mas_equalTo(lbTitleR.size.width + 0.5);
    }];
    
    firstWeek /= total;
    secondWeek /= total;
    thirdWeek /= total;
    fourthWeek /= total;
    
    //NSLog(@"%f %f %f %f", firstWeek, secondWeek, thirdWeek, fourthWeek);
    
    UIView *view0 = [[UIView alloc] init];
    [_moreView addSubview:view0];
    [view0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_moreView.mas_left);
        make.bottom.equalTo(_moreView.mas_bottom);
        make.width.mas_equalTo(UIWIDTH(10));
        make.height.mas_equalTo(UIHEIGHT(9) + UIHEIGHT(80) * firstWeek);
    }];
    
    UIView *view1 = [[UIView alloc] init];
    [_moreView addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_moreView.mas_left).offset(UIWIDTH(20));;
        make.bottom.equalTo(_moreView.mas_bottom);
        make.width.mas_equalTo(UIWIDTH(10));
        make.height.mas_equalTo(UIHEIGHT(9) + UIHEIGHT(80) * secondWeek);
    }];
    
    UIView *view2 = [[UIView alloc] init];
    [_moreView addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_moreView.mas_left).offset(UIWIDTH(40));
        make.bottom.equalTo(_moreView.mas_bottom);
        make.width.mas_equalTo(UIWIDTH(10));
        make.height.mas_equalTo(UIHEIGHT(9) + UIHEIGHT(80) * thirdWeek);
    }];
    
    UIView *view3 = [[UIView alloc] init];
    [_moreView addSubview:view3];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_moreView.mas_left).offset(UIWIDTH(60));;
        make.bottom.equalTo(_moreView.mas_bottom);
        make.width.mas_equalTo(UIWIDTH(10));
        make.height.mas_equalTo(UIHEIGHT(9) + UIHEIGHT(80) * fourthWeek);
    }];
    UIColor *color = [UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];
    view0.backgroundColor = color;
    view1.backgroundColor = color;
    view2.backgroundColor = color;
    view3.backgroundColor = THEME_COLOR;
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
                make.top.equalTo(self.contentView).offset(UIHEIGHT(11));
                make.width.mas_equalTo(UIWIDTH(70));
                make.bottom.equalTo(self.contentView).offset(-UIHEIGHT(11));
                make.left.equalTo(self.contentView).offset(UIWIDTH(412));
            }];
        }
        
        [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-UIWIDTH(20));
            make.centerY.equalTo(self.contentView);
            make.height.width.mas_equalTo(UIWIDTH(100));
        }];
        self.rightImageView.image = [UIImage imageNamed:@""];
        self.rightImageView.layer.cornerRadius = UIWIDTH(50);
        
        if (!_lbCrest) {
            _lbCrest = [[UILabel alloc] init];
            [self.rightImageView addSubview:_lbCrest];
            _lbCrest.font = [UIFont systemFontOfSize:8];
            _lbCrest.textColor = [UIColor whiteColor];
        }
        if (!_lbValley) {
            _lbValley = [[UILabel alloc] init];
            [self.rightImageView addSubview:_lbValley];
            _lbValley.font = [UIFont systemFontOfSize:8];
            _lbValley.textColor = [UIColor whiteColor];
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
