//
//  UIColor+DK.m
//  DuoKaHealth
//
//  Created by sujinxu on 2018/5/30.
//  Copyright © 2018年 北京健科云网科技有限公司. All rights reserved.
//

#import "UIColor+DK.h"

@implementation UIColor (DK)

+(UIColor*)colorWithRGB:(NSUInteger)hex
                  alpha:(CGFloat)alpha
{
    float r, g, b, a;
    a = alpha;
    b = hex & 0x0000FF;
    hex = hex >> 8;
    g = hex & 0x0000FF;
    hex = hex >> 8;
    r = hex;

    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString andAlpha:(CGFloat)alpha
{
    return [UIColor colorWithHexString:hexString alpha:alpha];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString {

    return [UIColor colorWithHexString:hexString alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {
    if ([hexString hasPrefix:@"0x"] || [hexString hasPrefix:@"0X"]) {
        hexString = [hexString substringFromIndex:2];
    } else if ([hexString hasPrefix:@"#"]) {
        hexString = [hexString substringFromIndex:1];
    }

    unsigned int value = 0;
    BOOL flag = [[NSScanner scannerWithString:hexString] scanHexInt:&value];
    if(NO == flag)
        return [UIColor clearColor];
    float r, g, b, a;
    a = alpha;
    b = value & 0x0000FF;
    value = value >> 8;
    g = value & 0x0000FF;
    value = value >> 8;
    r = value;
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a];
}


@end
