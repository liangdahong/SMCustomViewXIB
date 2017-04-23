//
//  UIView+SMCustomViewXIB.m
//  SMCustomViewXIB
//
//  Created by __liangdahong on 2017/4/23.
//  Copyright © 2017年 http://idhong.com. All rights reserved.
//

#import "UIView+SMCustomViewXIB.h"
#import <objc/runtime.h>
#import "Masonry.h"

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@implementation UIView (SMCustomViewXIB)

- (void)sm_setCustomViewXIB:(BOOL)sm_customViewXIB {
    
    objc_setAssociatedObject(self, @selector(sm_customViewXIB), @(sm_customViewXIB), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)sm_customViewXIB {
    
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 交换 initWithCoder:
        swizzleMethod([self class], @selector(initWithCoder:), @selector(bm_initWithCoder:));
        // 交换 initWithFrame:
        swizzleMethod([self class], @selector(initWithFrame:), @selector(bm_initWithFrame:));
        // 交换 init
        swizzleMethod([self class], @selector(init), @selector(bm_init));
    });
}

- (instancetype)bm_initWithCoder:(NSCoder *)coder {
    [self bm_initWithCoder:coder];
    [self addUI];
    return self;
}

- (instancetype)bm_initWithFrame:(CGRect)frame {
    [self bm_initWithFrame:frame];
    [self addUI];
    return self;
}

- (instancetype)bm_init {
    [self bm_init];
    [self addUI];
    return self;
}

- (void)addUI {
    
    if (!self.sm_customViewXIB) {
        return;
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:NSStringFromClass([self class]) ofType:@"nib"];

    if (path.length) {
        NSArray <UIView *> *views = [[UINib nibWithNibName:NSStringFromClass([self class]) bundle:nil] instantiateWithOwner:self options:nil];
        if (views.count) {
            UIView *view = views[0];
            [self addSubview:view];
            [view mas_makeConstraints:^(MASConstraintMaker *make) {
                make.edges.mas_equalTo(0);
            }];
        }
    }
}

@end
