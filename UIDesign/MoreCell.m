//
//  MoreCell.m
//  UIDesign
//
//  Created by SJ on 16/8/21.
//  Copyright © 2016年 SJ. All rights reserved.
//

#import "MoreCell.h"
#import "Define.h"
#import "Masonry.h"

@implementation MoreCell

- (void)create{
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    UILabel *label = [[UILabel alloc]init];
    label.text = @"查看更多支付方式";
    label.font = [UIFont systemFontOfSize:24*scale];
    label.textColor = [UIColor colorWithRed:135/255.0 green:135/255.0 blue:135/255.0 alpha:1];
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(200*scale);
        make.top.offset(30*scale);
        make.height.offset(24*scale);
        make.width.equalTo(@(kScreenWidth - 420*scale));
    }];
    [self downDirection];
    
}

- (void)downDirection{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.strokeColor = [UIColor lightGrayColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 1;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(kScreenWidth-224*scale, 35*scale)];
    [path addLineToPoint:CGPointMake(kScreenWidth-212*scale, 50*scale)];
    [path addLineToPoint:CGPointMake(kScreenWidth-200*scale, 35*scale)];
    layer.path = path.CGPath;
    [self.layer addSublayer:layer];
    
}


@end
