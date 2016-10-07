//
//  bankCell.m
//  UIDesign
//
//  Created by SJ on 16/8/20.
//  Copyright © 2016年 SJ. All rights reserved.
//

#import "bankCell.h"
#import "Define.h"
#import "Masonry.h"

@implementation bankCell

- (void)create{
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    
    UILabel *label = [[UILabel alloc]init];
    label.textColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1];
    label.text = _bankName;
    label.font = [UIFont systemFontOfSize:28*scale];
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(30*scale);
        make.top.offset(33*scale);
        make.height.offset(28*scale);
        make.width.equalTo(@(kScreenWidth-150*scale));
        
    }];
    
    _checkBtn = [[UIButton alloc]init];
    _checkBtn.layer.masksToBounds = YES;
    _checkBtn.layer.borderWidth = 0.5;
    _checkBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _checkBtn.layer.cornerRadius = 18*scale;
//    _checkBtn.backgroundColor =[UIColor colorWithRed:37/255.0f green:161/255.0f blue:174/255.0f alpha:1];
    [self.contentView addSubview:_checkBtn];
    _checkBtn.userInteractionEnabled = YES;
    _checkBtn.selected = NO;
    [_checkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-60*scale);
        make.top.offset(33*scale);
        make.height.offset(36*scale);
        make.width.equalTo(@(36*scale));
    }];
    
    [self drawTick];
}
- (void)drawTick{
    
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor = [UIColor whiteColor].CGColor;
    layer.lineWidth = 2;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(kScreenWidth - 85*scale, 50*scale)];
    [path addLineToPoint:CGPointMake(kScreenWidth- 80*scale, 60*scale)];
    [path addLineToPoint:CGPointMake(kScreenWidth - 65*scale, 45*scale)];
    layer.path = path.CGPath;
    [self.layer addSublayer:layer];
}

@end
