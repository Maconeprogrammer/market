//
//  XYTransitionProtocol.h
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/9.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol XYTransitionProtocol <NSObject>
@optional

/**
 转场动画的目标View 需要转场动画的对象必须实现该方法并返回要做动画的View

 @return view
 */
-(UIView *)targetTransitionView;


/**
 *  是否是需要实现转场效果，不需要转场动画可不实现，需要必须实现并返回YES
 *
 *  @return 是否
 */
-(BOOL)isNeedTransition;

@end
