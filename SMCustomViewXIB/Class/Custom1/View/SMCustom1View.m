//
//  SMCustom1View.m
//  SMCustomViewXIB
//
//  Created by __liangdahong on 2017/4/23.
//  Copyright © 2017年 http://idhong.com. All rights reserved.
//

#import "SMCustom1View.h"

@interface SMCustom1View ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UISwitch *openSwitch;

@end

@implementation SMCustom1View

+ (instancetype)custom1ViewWithTitle:(NSString *)title open:(BOOL)open {

    UINib *nib = [UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil];
    SMCustom1View *custom1View = [[nib instantiateWithOwner:nil options:nil] firstObject];
    custom1View.titleLabel.text = title;
    custom1View.openSwitch.on = open;
    return custom1View;
}

@end
