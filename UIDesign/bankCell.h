//
//  bankCell.h
//  UIDesign
//
//  Created by SJ on 16/8/20.
//  Copyright © 2016年 SJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface bankCell : UITableViewCell

@property(nonatomic, strong)NSString *bankName;
@property(nonatomic, strong)UIButton *checkBtn;
- (void)create;
@end
