//
//  AppDelegate.m
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/9.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import <WRNavigationBar.h>
#import "RootNavigationController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window.rootViewController = [[RootNavigationController alloc] initWithRootViewController:[[HomeViewController alloc] init]];

    [WRNavigationBar wr_setDefaultStatusBarStyle:UIStatusBarStyleLightContent];
    [WRNavigationBar wr_setDefaultNavBarShadowImageHidden:YES];

    return YES;
}


@end
