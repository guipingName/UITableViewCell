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
    [super initWithData:cellModel];
    GPModel *model = cellModel;
    
    if (model.selected) {
        _rightButton.selected = YES;
    }
    else{
        _rightButton.selected = NO;
    }
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        //[self.rightImageView removeFromSuperview];
        self.rightImageView.hidden = YES;
        if (!_rightButton) {
            _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.contentView addSubview:_rightButton];
            [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.contentView.mas_centerY);
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
