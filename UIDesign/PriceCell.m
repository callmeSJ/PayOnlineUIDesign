//
//  PriceCell.m
//  UIDesign
//
//  Created by SJ on 16/8/20.
//  Copyright © 2016年 SJ. All rights reserved.
//

#import "PriceCell.h"
#import "Masonry.h"
#import "Define.h"
@implementation PriceCell


- (void)create{
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    UILabel *label = [[UILabel alloc]init];
    label.text = @"支付金额: ";
    label.font = [UIFont systemFontOfSize:26*scale];
    label.textColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1];
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(330*scale);
        make.top.offset(30*scale);
        make.height.offset(26*scale);
        make.width.equalTo(@(120*scale));
        
    }];
    
    UILabel *priceLabel = [[UILabel alloc]init];
    priceLabel.textColor = [UIColor colorWithRed:255/255.0 green:121/255.0 blue:118/255.0 alpha:1];
    NSString *strs = [NSString stringWithFormat:@"¥%@",_priceStr];
    NSLog(@"%ld",(long)strs.length);
    NSUInteger countAll = strs.length;
    priceLabel.font = [UIFont systemFontOfSize:26*scale];

    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:strs];
    [str addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:36*scale] range:NSMakeRange(1, countAll-3)];
    priceLabel.text = strs;
    priceLabel.attributedText = str;
    [self.contentView addSubview:priceLabel];
    [priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(450*scale);
        make.top.offset(30*scale);
        make.height.offset(26*scale);
        make.width.equalTo(@(220*scale));
    }];
    
    
    
}



@end
