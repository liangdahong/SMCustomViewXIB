//
//  AppDelegate.m
//  SMCustomViewXIB
//
//  Created by __liangdahong on 2017/4/23.
//  Copyright © 2017年 http://idhong.com. All rights reserved.
//

#import "AppDelegate.h"
#import "SMRootVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:[SMRootVC new]];
    nav.navigationBar.hidden = NO;
    nav.navigationBar.translucent = NO;
    self.window.rootViewController = nav;
    return YES;
}

@end
