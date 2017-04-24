//
//  SMCustomViewXIB.h
//  SMCustomViewXIB
//
//  Created by __liangdahong on 2017/4/23.
//  Copyright © 2017年 http://idhong.com. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 在自定义的 view 想主动去加载 xib 需遵守 此协议,只需遵守就OK，不需要实现其他任何方法 
 1、xib 的 file's Owner 设置为自定义的 View
 2、遵守此协议
 */
@protocol SMCustomViewXIB <NSObject>

@end
