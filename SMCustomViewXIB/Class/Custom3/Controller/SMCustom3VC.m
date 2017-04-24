//
//  SMCustom3VC.m
//  SMCustomViewXIB
//
//  Created by ___liangdahong on 2017/4/24.
//  Copyright © 2017年 http://idhong.com. All rights reserved.
//

#import "SMCustom3VC.h"
#import "SMCustom3VCView1.h"
#import "Masonry.h"

@interface SMCustom3VC ()

@end

@implementation SMCustom3VC

- (void)viewDidLoad {
    [super viewDidLoad];

    SMCustom3VCView1 *view = [SMCustom3VCView1 new];
    [self.view addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
}

@end
