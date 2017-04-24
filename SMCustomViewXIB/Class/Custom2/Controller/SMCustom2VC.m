//
//  SMCustom2VC.m
//  SMCustomViewXIB
//
//  Created by __liangdahong on 2017/4/23.
//  Copyright © 2017年 https://github.com/asiosldh/SMCustomViewXIB All rights reserved.
//

#import "SMCustom2VC.h"
#import "Masonry.h"
#import "SMCustom2View.h"

@interface SMCustom2VC ()

@end

@implementation SMCustom2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"xib 自定义的view 使用 new alloc 创建添加 ";

    SMCustom2View *view = [[SMCustom2View alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    [self.view addSubview:view];
    
    
    SMCustom2View *view1 = [SMCustom2View new];
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(110);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];

    SMCustom2View *view2 = [[SMCustom2View alloc] init];
    [self.view addSubview:view2];
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(220);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(100);
    }];
}


@end
