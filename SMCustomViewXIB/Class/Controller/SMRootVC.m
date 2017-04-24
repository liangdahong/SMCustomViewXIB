
//
//  SMRootVC.m
//  SMCustomViewXIB
//
//  Created by __liangdahong on 2017/4/23.
//  Copyright © 2017年 https://github.com/asiosldh/SMCustomViewXIB All rights reserved.
//

#import "SMRootVC.h"
#import "SMCustom1VC.h"
#import "SMCustom2VC.h"
#import "SMCustom3VC.h"

@interface SMRootVC ()

@end

@implementation SMRootVC


#pragma mark -
#pragma mark - init
#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"SMRootVC";
}


#pragma mark - getters setters
#pragma mark - 系统delegate
#pragma mark - 自定义delegate
#pragma mark - 公有方法
#pragma mark - 私有方法
#pragma mark - 事件响应

- (IBAction)custom1ButtonClick {
    [self.navigationController pushViewController:[SMCustom1VC new] animated:YES];
}
- (IBAction)custom2ButtonClick {
    [self.navigationController pushViewController:[SMCustom2VC new] animated:YES];
}

- (IBAction)custom3ButtonClick {
    [self.navigationController pushViewController:[SMCustom3VC new] animated:YES];
}
@end
