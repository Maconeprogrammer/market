//
//  RootNavigationController.h
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/9.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 导航控制器基类
 */
@interface RootNavigationController : UINavigationController

/*!
 *  返回到指定的类视图
 *
 *  @param ClassName 类名
 *  @param animated  是否动画
 */
-(BOOL)popToAppointViewController:(NSString *)ClassName animated:(BOOL)animated;


@end
