//
//  ImageCell.m
//  UIDesign
//
//  Created by SJ on 16/8/17.
//  Copyright © 2016年 SJ. All rights reserved.
//

#import "ImageCell.h"
#import "Define.h"
#import "Masonry.h"
@implementation ImageCell

- (void)create{
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    //图片
    UIImageView *img = [[UIImageView alloc]init];
    [self.contentView addSubview:img];
    [img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(30*scale);
        make.top.equalTo(self.mas_top).offset(26*scale);
        make.width.equalTo(@(200*scale));
        make.height.offset(132*scale);
    }];
    img.backgroundColor = [UIColor redColor];
    
    //详情
    UILabel *label = [[UILabel alloc]init];
    label.text = _detailStr;
    label.numberOfLines = 0;
    label.textColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1];
    label.font = [UIFont fontWithName:@"Arial" size:28*scale];
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(254*scale);
        make.top.offset(56*scale);
        make.width.equalTo(@(kScreenWidth - 230*scale - 20));
        make.height.offset(56*scale);
    }];
    
    //数量
    UILabel *laabelCount = [[UILabel alloc]init];
    laabelCount.text = [NSString stringWithFormat:@"X%@",_detailCount];
    laabelCount.textColor = [UIColor colorWithRed:85/255.0 green:85/255.0 blue:85/255.0 alpha:1];
    laabelCount.font = [UIFont fontWithName:@"Arial" size:24*scale];
    [self.contentView addSubview:laabelCount];
    [laabelCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-30 * scale);
        make.top.offset(150*scale);
        make.height.offset(24*scale);
        make.width.equalTo(@(50*scale));
        
    }];
    
    //价格
    UILabel *labelPrice = [[UILabel alloc]init];
    labelPrice.text = [NSString stringWithFormat:@"¥%@",_detailPrice];
    labelPrice.textColor = [UIColor colorWithRed:255/255.0 green:121/255.0 blue:118/255.0 alpha:1];
    labelPrice.font = [UIFont fontWithName:@"Arial" size:24*scale];
    [self.contentView addSubview:labelPrice];
    [labelPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(254*scale);
        make.bottom.equalTo(self.mas_bottom).offset(-26*scale);
        make.width.equalTo(@(150*scale));
        make.height.offset(24*scale);
        
    }];
    
}

@end
