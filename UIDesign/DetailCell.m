//
//  tableCell.m
//  UIDesign
//
//  Created by SJ on 16/8/16.
//  Copyright © 2016年 SJ. All rights reserved.
//

#import "DetailCell.h"
#import "Masonry.h"
#import "Define.h"

@implementation DetailCell

- (void)create{
    for (UIView *view in self.contentView.subviews) {
        [view removeFromSuperview];
    }
    UILabel *orderNumber = [[UILabel alloc]init];
    orderNumber.text = [NSString stringWithFormat:@"订单编号 : %@",_detailStr];
    orderNumber.textColor = color;
    orderNumber.font = [UIFont fontWithName:@"Arial" size:24*scale];
    [self.contentView addSubview:orderNumber];
    [orderNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(24*scale);
        make.width.equalTo(@(kScreenWidth - 30*scale));
        make.left.equalTo(self.mas_left).offset(30*scale);
        make.top.equalTo(self.mas_top).offset(22*scale);
    }];
    
//    UILabel *detailNumber = [[UILabel alloc]init];
//    detailNumber.textColor = color;
//    detailNumber.text = _detailStr;
//    detailNumber.font = [UIFont fontWithName:@"Arial" size:24*scale];
//
//    [self.contentView addSubview:detailNumber];
//    [detailNumber mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.height.offset(24*scale);
//        make.width.equalTo(@(kScreenWidth - 120 * scale - 30));
//        make.left.equalTo(self.mas_left).offset(175 *scale);
//        make.top.equalTo(self.mas_top).offset(22*scale);
//    }];
    
}
@end
