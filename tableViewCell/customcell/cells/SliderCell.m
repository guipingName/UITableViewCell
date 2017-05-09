//
//  SliderCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/27.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "SliderCell.h"

@implementation SliderCell{
    GPModel *tempModel;
}

+(CGFloat)getCellHeightWithCellStyle:(GPModel *)cellModel{
    return 50;
}

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    tempModel = model;
    self.bgImageView.image = [[UIImage imageNamed:@"声音控制"] rt_tintedImageWithColor:[UIColor grayColor]];
    self.rightImageView.image = [[UIImage imageNamed:@"声音控制"] rt_tintedImageWithColor:[UIColor grayColor]];
    _slider.value = model.sliderValue;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.bgImageView.backgroundColor = [UIColor whiteColor];
        [self.bgImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(22));
            make.height.width.mas_equalTo(40);
            make.centerY.equalTo(self.contentView);
        }];
        
        [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(40);
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(-UIWIDTH(22));
        }];
        
        if (!_slider) {
            _slider = [[UISlider alloc] init];
            [self.contentView addSubview:_slider];
            [_slider mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.contentView);
                make.left.equalTo(self.bgImageView.mas_right).offset(5);
                make.right.equalTo(self.rightImageView.mas_left).offset(-5);
                make.height.mas_equalTo(10);
            }];
            [_slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
            [_slider addTarget:self action:@selector(sliderTouchOut:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

- (void)sliderTouchOut:(UISlider *)aSlider{
    CGFloat sliderValue = aSlider.value;
    tempModel.sliderValue = sliderValue;
    if (self.sliderBlock) {
        self.sliderBlock(sliderValue);
    }
}


- (void)sliderChanged:(UISlider *)aSlider{
//    CGFloat sliderValue = aSlider.value;
//    if (self.sliderBlock) {
//        self.sliderBlock(sliderValue);
//    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
