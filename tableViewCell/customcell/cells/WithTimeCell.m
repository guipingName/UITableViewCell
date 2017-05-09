//
//  WithTimeCell.m
//  tableViewCell
//
//  Created by guiping on 2017/4/21.
//  Copyright © 2017年 pingui. All rights reserved.
//

#import "WithTimeCell.h"

@implementation WithTimeCell

+(CGFloat)getCellHeightWithCellStyle:(GPModel *)cellModel{
    return UIHEIGHT(130);
}

-(void)initWithData:(id)cellModel{
    GPModel *model = cellModel;
    self.lbTitle.text = model.title;
    self.lbSubTitle.text = model.subTitle;
    self.bgImageView.image = [UIImage imageNamed:model.imageName];
    
    CGRect lbTitleR = [self attributedLabel:self.lbTitle str:@"[" size1:18 color1:[UIColor blackColor] size2:12 color2:[UIColor grayColor]];
    self.lbSubTitle.textColor = [UIColor grayColor];
    
    [self.lbTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(UIWIDTH(158));
        make.bottom.equalTo(self.contentView.mas_centerY).offset(-5);
        make.width.mas_equalTo(lbTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbTitleR.size.height);
    }];
    
    CGRect lbSubTitleR = LABEL_RECT(self.lbSubTitle.text, 0, 0, 1, 12);
    [self.lbSubTitle mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lbTitle);
        make.top.equalTo(self.contentView.mas_centerY).offset(5);
        make.width.mas_equalTo(lbSubTitleR.size.width + 0.5);
        make.height.mas_equalTo(lbSubTitleR.size.height);
        
    }];
    
    if (model.time) {
        self.lbSubTitle2.text = model.time;
        self.lbSubTitle2.textColor = [UIColor grayColor];
        CGRect lbSubTitle2R = LABEL_RECT(self.lbSubTitle2.text, 0, 0, 1, 12);
        [self.lbSubTitle2 mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-UIWIDTH(40));
            make.bottom.equalTo(self.contentView).offset(-UIHEIGHT(9));
            make.height.mas_equalTo(lbSubTitle2R.size.height);
            make.width.mas_equalTo(lbSubTitle2R.size.width + 0.5);
        }];
    }
    
    if (!model.badge) {
        self.rightImageView.hidden = YES;
    }
    else{
        [self.rightImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.height.width.mas_equalTo(UIWIDTH(43));
            make.centerY.equalTo(self.contentView);
            make.right.equalTo(self.contentView).offset(-UIWIDTH(40));
        }];
        self.rightImageView.layer.cornerRadius = UIWIDTH(43) / 2.0;
        self.rightImageView.layer.masksToBounds = YES;
        
        self.rightImageView.image = [self imageWithColor:[UIColor redColor]];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        label.text = [NSString stringWithFormat:@"%ld", (long)model.badge];
        label.center = CGPointMake(UIWIDTH(43) / 2.0, UIWIDTH(43) / 2.0);
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        [self.rightImageView addSubview:label];
    }
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.subImageView1 removeFromSuperview];
        [self.subImageView2 removeFromSuperview];
        [self.subImageView3 removeFromSuperview];
        
        [self.bgImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(UIWIDTH(34));
            make.height.width.mas_equalTo(UIWIDTH(88));
            make.centerY.equalTo(self.contentView);
        }];
        self.bgImageView.layer.cornerRadius = UIWIDTH(44);
        
        self.lbTitle.font = [UIFont systemFontOfSize:18];
        self.lbTitle.textAlignment = NSTextAlignmentLeft;
        
        self.lbSubTitle.font = [UIFont systemFontOfSize:12];
        self.lbSubTitle.textAlignment = NSTextAlignmentLeft;
        
        self.lbSubTitle2.font = [UIFont systemFontOfSize:12];
    }
    return self;
}

-(UIImage *)imageWithColor:(UIColor *)color{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
