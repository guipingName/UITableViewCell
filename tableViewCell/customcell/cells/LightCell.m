//
//  LightCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/27.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "LightCell.h"

@implementation LightCell{
    GPModel *tempModel;
    CAGradientLayer *gradientLayer;
    UIVisualEffectView *view;
    NSTimer *timer;
    NSArray *colors;
    int index;
}

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    tempModel = model;
    self.lbTitle.text = model.title;
    NSArray *array = model.colors;
    self.lbTitle.font = [UIFont systemFontOfSize:18];
    CGRect lbTitleR = LABEL_RECT(self.lbTitle.text, 0, 0, 1, 18);
    [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bgImageView.mas_left).offset(UIWIDTH(21));
        make.bottom.equalTo(self.bgImageView.mas_centerY);
        make.height.mas_equalTo(lbTitleR.size.height);
        make.width.mas_equalTo(lbTitleR.size.width + 0.5);
    }];
    self.rightImageView.image = [[UIImage imageNamed:@"LEDE定时器-其他灯"] rt_tintedImageWithColor:[UIColor whiteColor]];
    
    NSArray *colorsArray = [NSArray array];
    NSArray *locationsArray = [NSArray array];
    if (array.count == 0) {
        UIColor *color = [self colorWithNumber:999];
        id layerColor = (__bridge id)color.CGColor;
        colorsArray = @[layerColor, layerColor];
        locationsArray = @[@0.0, @1.0];
        self.rightImageView.image = [self.rightImageView.image rt_tintedImageWithColor:color];
    }
    if (array.count == 1) {
        NSInteger colorNumber = [array.firstObject integerValue];
        UIColor *color = [self colorWithNumber:colorNumber];
        id layerColor = (__bridge id)color.CGColor;
        colorsArray = @[layerColor, layerColor];
        locationsArray = @[@0.0, @1.0];
        self.rightImageView.image = [self.rightImageView.image rt_tintedImageWithColor:color];
    }
    else{
        NSMutableArray *tempArray = [NSMutableArray array];
        NSMutableArray *tem = [NSMutableArray array];
        NSMutableArray *aaarray = [NSMutableArray array];
        for (int i=0; i<array.count; i++) {
            NSInteger colorNumber = [array[i] integerValue];
            UIColor *color = [self colorWithNumber:colorNumber];
            [aaarray addObject:color];
            id layerColor = (__bridge id)color.CGColor;
            [tempArray addObject:layerColor];
            [tem addObject:@(1.0 * i / array.count)];
        }
        colorsArray = [tempArray copy];
        locationsArray = [tem copy];
        colors = [aaarray copy];
        
        if (!timer) {
            timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(changeImage:) userInfo:nil repeats:YES];
            timer.fireDate = [NSDate distantPast];
        }        
    }
    index= 0;
    gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = colorsArray;
    gradientLayer.locations = locationsArray;
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 0);
    [self.bgImageView.layer addSublayer:gradientLayer];
    
    UIBlurEffect *beffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleProminent];
    view = [[UIVisualEffectView alloc]initWithEffect:beffect];
    [self.bgImageView addSubview:view];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(isClicked:)];
    [self addGestureRecognizer:tap];
    
    if (model.isClicked) {
        [self addLayerColor];
    }
}

- (void) isClicked:(UITapGestureRecognizer *) sender{
    tempModel.isClicked = YES;
    if (self.cellIsClicked) {
        self.cellIsClicked(YES);
    }
    [self addLayerColor];
}

- (void) addLayerColor{
    self.bgImageView.layer.borderWidth = UIHEIGHT(6);
    self.bgImageView.layer.borderColor = [UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1].CGColor;
}

-(void) changeImage:(NSTimer *) sender{
    UIColor *color = colors[index % colors.count];
    self.rightImageView.image = [self.rightImageView.image rt_tintedImageWithColor:color];
    index++;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.lineView removeFromSuperview];
        [self.contentView sendSubviewToBack:self.bgImageView];
        self.backgroundColor = [UIColor blackColor];
        [self.bgImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(UIHEIGHT(10));
            make.left.equalTo(self.contentView).offset(UIWIDTH(20));
            make.right.equalTo(self.contentView).offset(-UIWIDTH(20));
            make.bottom.equalTo(self.contentView).offset(-UIHEIGHT(10));
        }];
        self.bgImageView.backgroundColor = [UIColor whiteColor];
        self.bgImageView.layer.cornerRadius = 15;
        self.bgImageView.layer.masksToBounds = YES;
        
        [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.contentView.mas_centerY).offset(-10);
            make.right.equalTo(self.contentView).offset(-UIWIDTH(51));
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(30);
        }];
        self.rightImageView.image = nil;
    }
    return self;
}

-(void)layoutSubviews{
    gradientLayer.frame = CGRectMake(0, 0, self.contentView.bounds.size.width - UIWIDTH(40), self.contentView.bounds.size.height - UIHEIGHT(20));
    view.frame = CGRectMake(0, 0, gradientLayer.bounds.size.width, gradientLayer.bounds.size.height - UIHEIGHT(30));
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
