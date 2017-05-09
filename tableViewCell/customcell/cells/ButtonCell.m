//
//  ButtonCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/24.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "ButtonCell.h"

@implementation ButtonCell

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
        if (!_rightButton) {
            _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [self.contentView addSubview:_rightButton];
            [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self.contentView);
                make.right.equalTo(self.contentView).offset(-UIWIDTH(18));
                make.height.mas_equalTo(30);
                make.width.mas_equalTo(30);
            }];
        }
        [_rightButton setImage:[UIImage imageNamed:@"ok"] forState:UIControlStateSelected];
        //[_rightButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        
        self.lineView.backgroundColor = [UIColor colorWithRed:200/255.0 green:199/255.0 blue:204/255.0 alpha:1];
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
