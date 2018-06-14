//
//  GraphView.h
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/13.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GraphView : UIView

/**  是否显示坐标 */
@property(nonatomic,assign) BOOL ifXY;

@property(nonatomic,strong) NSArray *yArrays;

@property(nonatomic,strong) NSArray *points;

@property(nonatomic,strong) NSString *startTime;

@property(nonatomic,strong) NSString *endTime;

@property(nonatomic,copy) UIColor *startLineColor;

@property(nonatomic,copy) UIColor *endLineColor;

@property(nonatomic,copy) UIColor *startBgColor;

@property(nonatomic,copy) UIColor *endBgColor;

@end
