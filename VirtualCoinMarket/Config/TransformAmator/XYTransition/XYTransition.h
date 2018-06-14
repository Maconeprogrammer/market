//
//  XYTransition.h
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/9.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <YYKit.h>

@interface XYTransition : NSObject<UIViewControllerAnimatedTransitioning>

@property(nonatomic,assign) BOOL isPush;//是否是push，反之则是pop

@property (nonatomic, assign) NSTimeInterval animationDuration;//动画时长

@end
