//
//  ThreeLabelsCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "ThreeLabelsCell.h"

@implementation ThreeLabelsCell

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    self.lbTitle.text = model.title;
    self.lbSubTitle.text = model.subTitle;
    _lbTemperature.text = [NSString stringWithFormat:@"%.0f℃", model.temperature];
    _lbHumidness.text = model.humidness;
    self.bgImageView.image = [UIImage imageNamed:model.imageName];
    CGRect lbTitleR = [self attributedLabel:self.lbTitle str:@"[" size1:15 color1:[UIColor blackColor] size2:12 color2:[UIColor grayColor]];
    
    CGRect lbSubTitleR = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 18);
    [self.lbSubTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(UIWIDTH(141));
        make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbSubTitleR.size.height);
        make.centerY.equalTo(self.contentView.mas_centerY);
    }];
    
    [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lbSubTitle.mas_left);
        make.width.mas_equalTo(lbTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbTitleR.size.height);
        make.bottom.equalTo(self.lbSubTitle.mas_top);
    }];
    
    _lbTemperature.font = [UIFont systemFontOfSize:15];
    _lbHumidness.font = [UIFont systemFontOfSize:15];
    CGRect lbTemprR = LABEL_RECT(_lbTemperature.text, 0, 0, 1, 15);
    [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lbSubTitle.mas_left);
        make.height.mas_equalTo(lbTemprR.size.height);
        make.width.mas_equalTo(lbTemprR.size.height);
        make.top.equalTo(self.lbSubTitle.mas_bottom);
    }];
    //_imageView1.backgroundColor = [UIColor redColor];
    
    [_lbTemperature mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imageView1.mas_right).offset(1);
        make.height.mas_equalTo(lbTemprR.size.height);
        make.width.mas_equalTo(lbTemprR.size.width + 0.5);
        make.bottom.equalTo(_imageView1.mas_bottom).offset(2);
    }];
    //_lbTemperature.backgroundColor = [UIColor greenColor];
    
    [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_lbTemperature.mas_right).offset(10);
        make.height.width.mas_equalTo(lbTemprR.size.height);
        make.top.equalTo(self.lbSubTitle.mas_bottom);
    }];
    
    CGRect lbHumidnessR = LABEL_RECT(_lbHumidness.text, 0, 0, 1, 15);
    [_lbHumidness mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_imageView2.mas_right).offset(1);
        make.height.mas_equalTo(lbHumidnessR.size.height);
        make.width.mas_equalTo(lbHumidnessR.size.width + 0.5);
        make.bottom.equalTo(_imageView2.mas_bottom).offset(2);
    }];
    
    [self imageJudge:model];
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.bgImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(20));
            make.height.width.mas_equalTo(UIWIDTH(100));
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
        self.bgImageView.layer.cornerRadius = UIWIDTH(50);
        self.bgImageView.layer.masksToBounds = YES;
        
        self.lbSubTitle.textColor = [UIColor blackColor];
        self.lbSubTitle.font = [UIFont systemFontOfSize:18];
        self.lbSubTitle.textAlignment = NSTextAlignmentLeft;
        
        if (!_imageView1) {
            _imageView1 = [[UIImageView alloc] init];
            [self.contentView addSubview:_imageView1];
            //_imageView1.backgroundColor = [UIColor orangeColor];
            _imageView1.image = [[UIImage imageNamed:@"i8_室温"] rt_tintedImageWithColor:[UIColor grayColor]];
        }
        
        if (!_lbTemperature) {
            _lbTemperature = [[UILabel alloc] init];
            [self.contentView addSubview:_lbTemperature];
            
            //_lbTemperature.backgroundColor = [UIColor redColor];
        }
        
        if (!_imageView2) {
            _imageView2 = [[UIImageView alloc] init];
            [self.contentView addSubview:_imageView2];
            //_imageView2.backgroundColor = [UIColor orangeColor];
            _imageView2.image = [[UIImage imageNamed:@"i8_湿度"] rt_tintedImageWithColor:[UIColor grayColor]];
        }
        
        if (!_lbHumidness) {
            _lbHumidness = [[UILabel alloc] init];
            [self.contentView addSubview:_lbHumidness];
            //_lbHumidness.backgroundColor = [UIColor redColor];
        }
        
        
        [self.lineView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(20));
            make.right.equalTo(self.contentView.mas_right);
            make.height.mas_equalTo(1);
            make.bottom.equalTo(self.contentView.mas_bottom);
        }];
        self.lineView.backgroundColor = [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1];
        
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
