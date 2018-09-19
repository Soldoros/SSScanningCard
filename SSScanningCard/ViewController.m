//
//  ViewController.m
//  SSScanningCard
//
//  Created by soldoros on 2018/9/9.
//  Copyright © 2018年 soldoros. All rights reserved.
//

#import "ViewController.h"
#import "YYKit.h"


@interface ViewController ()

//姓名 性别 出生 住址  身份证号 民族
@property(nonatomic,strong)UILabel *mNameLab;
@property(nonatomic,strong)UILabel *mSexLab;
@property(nonatomic,strong)UILabel *mBirthdayLab;
@property(nonatomic,strong)UILabel *mAddressLab;
@property(nonatomic,strong)UILabel *mNumberLab;
@property(nonatomic,strong)UILabel *mMinzuLab;

//签发机关 有效期限
@property(nonatomic,strong)UILabel *mJiguanLab;
@property(nonatomic,strong)UILabel *mYouxiaoqiLab;

//扫描
@property(nonatomic,strong)UIButton *mButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"身份证信息";
    
    
    UILabel *labs[10];
    NSArray *titles = @[@"姓名",@"性别",@"生日",@"住址",
                        @"身份证号",@"民族",@"签发机关",@"有效期"];
    for(int i=0;i<titles.count;++i){
        labs[i] = [UILabel new];
        labs[i].bounds = CGRectMake(0, 0, 100, 25);
        labs[i].font = [UIFont systemFontOfSize:18];
        labs[i].textAlignment = NSTextAlignmentLeft;
        labs[i].textColor = [UIColor blackColor];
        [self.view addSubview:labs[i]];
        labs[i].text = titles[i];
        [labs[i] sizeToFit];
        labs[i].frame = CGRectMake(40, 120+i*45, labs[i].frame.size.width, labs[i].frame.size.height);
        labs[i].numberOfLines = 2;
    }

    _mNameLab = labs[0];
    _mSexLab = labs[1];
    _mBirthdayLab = labs[2];
    _mAddressLab = labs[3];
    _mNumberLab = labs[4];
    _mMinzuLab = labs[5];
    
    _mJiguanLab = labs[6];
    _mYouxiaoqiLab = labs[7];
    _mJiguanLab.hidden = YES;
    _mYouxiaoqiLab.hidden = YES;
    
    
    _mButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _mButton.bounds = CGRectMake(0, 0, 200, 45);
    _mButton.center = CGPointMake(self.view.frame.size.width*0.5, 490);
    [_mButton setTitle:@"扫描身份证" forState:UIControlStateNormal];
    [_mButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _mButton.clipsToBounds = YES;
    _mButton.layer.cornerRadius = 4;
    [self.view addSubview:_mButton];
    _mButton.backgroundColor = [UIColor brownColor];
    _mButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [_mButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];


    [self getModelWithScanningController];
}
    

//扫描
-(void)buttonPressed:(UIButton *)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}


#pragma arguments SSScanningControllerDelegate
-(void)getModelWithScanningController{
    
    NSString *number = _model.num;
    NSString *year = [number substringWithRange:NSMakeRange(6, 4)];
    NSString *month = [number substringWithRange:NSMakeRange(10, 2)];
    NSString *day = [number substringWithRange:NSMakeRange(12, 2)];
    
    _mNameLab.text = [NSString stringWithFormat:@"%@%@",@"姓名：",_model.name];
    _mSexLab.text = [NSString stringWithFormat:@"%@%@",@"性别：",_model.gender];
    _mBirthdayLab.text = [NSString stringWithFormat:@"%@%@ %@ %@ %@ %@ %@",@"生日：",year,@"年",month,@"月",day,@"日"];
    _mAddressLab.text = [NSString stringWithFormat:@"%@%@",@"地址：",_model.address];
    _mNumberLab.text = [NSString stringWithFormat:@"%@%@",@"身份证号：",number];
    _mMinzuLab.text = [NSString stringWithFormat:@"%@%@",@"民族：",_model.nation];
    _mJiguanLab.text = [NSString stringWithFormat:@"%@%@",@"签发机关：",_model.issue];
    _mYouxiaoqiLab.text = [NSString stringWithFormat:@"%@%@",@"有效期：",_model.valid];
    
    _mNameLab.width = self.view.width-60;
    _mSexLab.width = self.view.width-60;
    _mBirthdayLab.width = self.view.width-60;
    _mAddressLab.width = self.view.width-60;
    _mNumberLab.width = self.view.width-60;
    _mMinzuLab.width = self.view.width-60;
    _mJiguanLab.width = self.view.width-60;
    _mYouxiaoqiLab.width = self.view.width-60;
    
    [_mNameLab sizeToFit];
    [_mSexLab sizeToFit];
    [_mBirthdayLab sizeToFit];
    [_mAddressLab sizeToFit];
    [_mNumberLab sizeToFit];
    [_mMinzuLab sizeToFit];
    [_mJiguanLab sizeToFit];
    [_mYouxiaoqiLab sizeToFit];
    
    _mNameLab.left = 40;
    _mSexLab.left = 40;
    _mBirthdayLab.left = 40;
    _mAddressLab.left = 40;
    _mNumberLab.left = 40;
    _mMinzuLab.left = 40;
    _mJiguanLab.left = 40;
    _mYouxiaoqiLab.left = 40;
    
    _mNameLab.top = 120;
    _mSexLab.top = _mNameLab.bottom + 20;
    _mBirthdayLab.top = _mSexLab.bottom + 20;
    _mAddressLab.top = _mBirthdayLab.bottom + 20;
    _mNumberLab.top = _mAddressLab.bottom + 20;
    _mMinzuLab.top = _mNumberLab.bottom + 20;
    _mJiguanLab.top = _mMinzuLab.bottom + 20;
    _mYouxiaoqiLab.top = _mJiguanLab.bottom + 20;
    
  
}











@end
