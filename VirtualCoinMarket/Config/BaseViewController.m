//
//  BaseViewController.m
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/11.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import "BaseViewController.h"
#import <WRNavigationBar.h>

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self wr_setNavBarBackgroundAlpha:0];
    self.view.backgroundColor = [UIColor colorWithRed:37.0/255.0 green:39.0/255.0 blue:54.0/255.0 alpha:1];

    [WRNavigationBar wr_widely];
    [WRNavigationBar wr_setDefaultNavBarTitleColor:[UIColor colorWithHexString:@"#9F9FA8"]];
    
}


@end
