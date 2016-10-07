//
//  NextViewController.m
//  UIDesign
//
//  Created by SJ on 16/8/13.
//  Copyright © 2016年 SJ. All rights reserved.
//


#import "NextViewController.h"
#import "Masonry.h"
#import "Define.h"
#import "DetailCell.h"
#import "ImageCell.h"
#import "PriceCell.h"
#import "bankCell.h"
#import "MoreCell.h"
#import "LessCell.h"

static NSString *detailCell = @"detailId";
static NSString *imgCell = @"ImgId";
static NSString *priceCell = @"priceId";
static NSString *banksCell = @"bankId";
static NSString *moreCell = @"moreId";
static NSString *lessCell = @"lessId";

@interface NextViewController()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableview;
//银行
@property(nonatomic, strong)NSMutableArray *bankArray;
//信息
@property(nonatomic, strong)NSDictionary *localData;
//判断是否按了更多
@property(nonatomic, assign)BOOL flag;

@end


@implementation NextViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"在线支付";
    [self initData];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:34*scale],
       NSForegroundColorAttributeName:[UIColor darkGrayColor]}];
    [self createUI];
    NSLog(@"%f,%f",kScreenWidth,kScreenHeight);
    _flag = NO;
}

- (void)initData{
    _bankArray = [NSMutableArray arrayWithObjects:@"中国工商银行",@"中国建设银行", nil];
    _localData = @{@"title":@"【海南】海边BBQTestTest",@"price":@"4500",@"count":@"2",@"number":@"200220160801831"};
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
   
}

- (void)createUI{
    
    [self createTableView];
}

- (void)createTableView{
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-98*scale ) style:UITableViewStyleGrouped];
    _tableview.dataSource = self;
    _tableview.delegate = self;
    _tableview.backgroundColor = [UIColor whiteColor];
    _tableview.tableFooterView = [UIView new];
    [self.view addSubview:_tableview];
    
    
//    UIView *buttomView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 98*scale, kScreenWidth, 98 * scale)];
    UIView *buttomView = [[UIView alloc]init];
    buttomView.backgroundColor = [UIColor colorWithRed:37/255.0f green:161/255.0f blue:174/255.0f alpha:1];
    [self.view addSubview:buttomView];
    [buttomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
        make.width.equalTo(@(kScreenWidth));
        make.height.offset(98 * scale);
    }];
    
    UILabel *confirmLabel = [[UILabel alloc]init];
    confirmLabel.text = @"确认支付";
    confirmLabel.textColor = [UIColor whiteColor];
    confirmLabel.font = [UIFont systemFontOfSize:30*scale];
    [buttomView addSubview:confirmLabel];
    [confirmLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(34*scale);
        make.left.equalTo(buttomView.mas_left).offset(kScreenWidth/2 - 50*scale);
        make.height.offset(30*scale);
        make.width.equalTo(@(200*scale));
    }];
    
}

#pragma mark tableview代理
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section == 0){
        return 2;
    }
    else{
        return _bankArray.count+1;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        if(indexPath.row == 0){
            return 186*scale;
        }else {
            return 88*scale;
        }
    }
    else{

        return 94*scale;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return [self createHeadOneWithString:[NSString stringWithFormat:@"订单编号: %@",[_localData valueForKey:@"number"] ]];
    }else if(section == 1){
        return [self createHeadOneWithString:@"选择支付方式"];
    }else{
        return nil;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(section == 0){
        return 68*scale;
    }else{
        return 76*scale;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0){
        

        if (indexPath.row == 0){
            ImageCell *cell = [tableView dequeueReusableCellWithIdentifier:imgCell];
            if(cell == nil){
                cell = [[ImageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:imgCell];
                
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.detailStr = [_localData valueForKey:@"title"];
            cell.detailPrice = [_localData valueForKey:@"price"];
            cell.detailCount = [_localData valueForKey:@"count"];
            [cell create];
            return cell;
        }else if(indexPath.row == 1){
            PriceCell *cell = [tableView dequeueReusableCellWithIdentifier:priceCell];
            if(cell == nil){
                cell = [[PriceCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:priceCell];
                
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            float price = [[_localData valueForKey:@"price"] floatValue];
            float count = [[_localData valueForKey:@"count"] floatValue];
            float total = price*count;
            cell.priceStr = [NSString stringWithFormat:@"%.1f",total];
            [cell create];
            return cell;

        }
        
    }
    else{
        if(indexPath.row <= _bankArray.count-1){
        
        bankCell *cell = [tableView dequeueReusableCellWithIdentifier:banksCell];
        if(cell == nil){
            cell = [[bankCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:banksCell];
            
        }
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.bankName = _bankArray[indexPath.row];
        [cell create];
        return cell;
        }else{
            if (_flag == NO){
            MoreCell *cell = [tableView dequeueReusableCellWithIdentifier:moreCell];
            if(cell == nil){
                cell = [[MoreCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:moreCell];
                
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell create];
            return cell;
            }
            else{
                LessCell *cell = [tableView dequeueReusableCellWithIdentifier:lessCell];
                if(cell == nil){
                    cell = [[LessCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:lessCell];
                    
                }
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                [cell create];
                return cell;
            }
        }
        
    }
    


    return nil;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 1){
        if(indexPath.row != _bankArray.count){
        bankCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.checkBtn.backgroundColor = [UIColor colorWithRed:37/255.0f green:161/255.0f blue:174/255.0f alpha:1];
                   }
        if(indexPath.row == _bankArray.count){
            if(_flag == NO){

            _bankArray = [NSMutableArray arrayWithObjects:@"中国工商银行",@"中国建设银行",@"中国银行", @"中国农民银行",@"华夏银行",nil];
            _flag = true;
                
            [_tableview reloadData];
            }else{
                _bankArray = [NSMutableArray arrayWithObjects:@"中国工商银行",@"中国建设银行",nil];
                [_tableview reloadData];
                _flag = NO;
            }
        }
    }
    NSLog(@"点击");
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 1){
        if(indexPath.row != _bankArray.count){
            bankCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            cell.checkBtn.backgroundColor = [UIColor whiteColor];
            
        }
    }
    NSLog(@"取消选择");
}

#pragma mark 创建头视图
- (UIView *)createHeadOneWithString:(NSString *)str{
    UIView *headView = [[UIView alloc]init];
    headView.frame = CGRectMake(0, 0, kScreenWidth, 18*scale);
//    headView.backgroundColor = [UIColor lightGrayColor];
    
    UIView *grayView = [[UIView alloc]init];
    grayView.backgroundColor = [UIColor lightGrayColor];
    grayView.frame = CGRectMake(0, 0, kScreenWidth, 18*scale);
    [headView addSubview:grayView];
    
    UILabel *orderNumber = [[UILabel alloc]init];
    orderNumber.text = str;
    orderNumber.textColor = color;
    orderNumber.font = [UIFont fontWithName:@"Arial" size:24*scale];
    [headView addSubview:orderNumber];
    [orderNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(44*scale);
        make.width.equalTo(@(kScreenWidth - 30*scale));
        make.left.equalTo(headView.mas_left).offset(30*scale);
        make.top.equalTo(headView.mas_top).offset(22*scale);
    }];
    return headView;
}

@end
