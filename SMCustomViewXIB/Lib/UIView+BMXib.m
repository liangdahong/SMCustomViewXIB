
//
//  UIView+BMXib.m
//  BMXib-01
//
//  Created by ___liangdahong on 2017/4/21.
//  Copyright © 2017年 ___liangdahong. All rights reserved.
//

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "Masonry.h"

@implementation UIView (BMXib)

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
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

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {}

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
//    if ([self isKindOfClass:[UITableViewCell class]]) {
//        return;
//    }
//    
    
    NSLog(@"%@", [NSString stringWithUTF8String:class_getName([self class])]);
    
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
