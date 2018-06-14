//
//  UIColor+DK.h
//  DuoKaHealth
//
//  Created by sujinxu on 2018/5/30.
//  Copyright © 2018年 北京健科云网科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (DK)

+ (UIColor *)colorWithHexString:(NSString *)hexString;

+ (UIColor *)colorWithHexString:(NSString *)hexString andAlpha:(CGFloat)alpha;

@end
