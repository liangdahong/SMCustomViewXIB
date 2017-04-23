//
//  SMCustomViewXIB.m
//  SMCustomViewXIB
//
//  Created by __liangdahong on 2017/4/23.
//  Copyright © 2017年 http://idhong.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import "SMCustomViewXIB.h"

void swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector) {
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    if (class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

static NSMutableDictionary *classDictionary = nil;

@implementation UIView (SMCustomViewXIB)

+ (void)load {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        classDictionary = [@{} mutableCopy];
        
        // 交换 initWithCoder:
        swizzleMethod(self.class, @selector(initWithCoder:), @selector(bm_initWithCoder:));
        // 交换 initWithFrame:
        swizzleMethod(self.class, @selector(initWithFrame:), @selector(bm_initWithFrame:));
        // 交换 init
        swizzleMethod(self.class, @selector(init), @selector(bm_init));
    });
}

- (instancetype)bm_initWithCoder:(NSCoder *)coder {
    [self bm_initWithCoder:coder];
    [self addCustomView];
    return self;
}

- (instancetype)bm_initWithFrame:(CGRect)frame {
    [self bm_initWithFrame:frame];
    [self addCustomView];
    return self;
}

- (instancetype)bm_init {
    [self bm_init];
    [self addCustomView];
    return self;
}

- (void)addCustomView {
    
    id value = classDictionary[NSStringFromClass(self.class)];
    if (value) {
        if ([value boolValue]) {
            [self addView];
        }
    } else {

        NSString *path = [[NSBundle mainBundle] pathForResource:NSStringFromClass([self class]) ofType:@"nib"];
        
        if (!path.length) {
            classDictionary[NSStringFromClass(self.class)] = @NO;
            return;
        }
        if ([self isKindOfClass:UITableViewCell.class]
            || [self isKindOfClass:UITableViewHeaderFooterView.class]
            || [self isKindOfClass:UICollectionViewCell.class]
            || [self isKindOfClass:UICollectionReusableView.class]) {
            classDictionary[NSStringFromClass(self.class)] = @NO;
            return;
        }
        [self addView];
        classDictionary[NSStringFromClass(self.class)] = @YES;
    }
}

- (void)addView {

    NSArray <UIView *> *views = [[UINib nibWithNibName:NSStringFromClass(self.class) bundle:nil] instantiateWithOwner:self options:nil];
    UIView *view = views[0];
    [self addSubview:view];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0.0];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *bottonConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    [self addConstraints:@[topConstraint, leftConstraint, bottonConstraint, rightConstraint]];
}

@end
