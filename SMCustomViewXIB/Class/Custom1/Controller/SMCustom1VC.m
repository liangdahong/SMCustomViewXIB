//
//  SMCustom1VC.m
//  SMCustomViewXIB
//
//  Created by __liangdahong on 2017/4/23.
//  Copyright © 2017年 http://idhong.com. All rights reserved.
//

#import "SMCustom1VC.h"
#import "SMCustom1View.h"
#import "Masonry.h"

@interface SMCustom1VC ()

@end

@implementation SMCustom1VC

- (void)viewDidLoad {
    [super viewDidLoad];

    SMCustom1View *custom1View = [SMCustom1View custom1ViewWithTitle:@"SMCustom1VC" open:arc4random_uniform(2)];
    [self.view addSubview:custom1View];
    [custom1View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(0);
        make.height.mas_equalTo(50);
    }];
}

@end
