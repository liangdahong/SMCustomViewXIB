//
//  SMCustom2VC.m
//  SMCustomViewXIB
//
//  Created by __liangdahong on 2017/4/23.
//  Copyright © 2017年 http://idhong.com. All rights reserved.
//

#import "SMCustom2VC.h"

@interface SMCustom2VC ()
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@end

@implementation SMCustom2VC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.scroll.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
}

@end
