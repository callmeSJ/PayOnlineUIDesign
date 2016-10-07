//
//  ImageCell.h
//  UIDesign
//
//  Created by SJ on 16/8/17.
//  Copyright © 2016年 SJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageCell : UITableViewCell

@property(nonatomic, strong) NSString *detailStr;
@property(nonatomic, strong) UIImage *detailImg;
@property(nonatomic, strong) NSString *detailPrice;
@property(nonatomic, strong) NSString *detailCount;

- (void)create;

@end
