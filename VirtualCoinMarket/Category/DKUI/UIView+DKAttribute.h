//
//  UIView+DKAttribute.h
//  PandoraCircle
//
//  Created by sujinxu on 2018/5/29.
//  Copyright © 2018年 MF. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DKAttribute)

- (UIView *(^)(CGRect rect))dkFrame;

- (UIView *(^)(UIColor *bgColor))bgColor;

- (UIView *(^)(NSString *rgb))bgRGBColor;

- (UIView *(^)(CGFloat x,CGFloat y,CGFloat width,CGFloat height))dkXYFrame;

- (UIView *(^)(CGFloat x))dk_left;

- (UIView *(^)(CGFloat y))dk_top;

- (UIView *(^)(CGFloat right))dk_right;

- (UIView *(^)(CGFloat width))dk_width;

- (UIView *(^)(CGFloat height))dk_height;

- (UIView *(^)(CGFloat bottom))dk_bottom;

- (UIView *(^)(CGFloat centerX))dk_centerX;

- (UIView *(^)(CGFloat centerY))dk_centerY;

- (UIView *(^)(CGPoint origin))dk_origin;

- (UIView *(^)(CGSize  size))dk_size;

- (UIView *(^)(CGFloat radius))dk_cornerRadius;

- (UIView *(^)(UIViewContentMode mode))dk_contentMode;

- (UIView *(^)(CGFloat boardWidth))dk_boardWidth;

- (UIView *(^)(UIColor *boadColor))dk_boardColor;
- (UIView *(^)(NSString *hexColor))dk_boardHexColor;

- (UIView *(^)(UIColor *shadowColor))dk_shadowColor;
- (UIView *(^)(NSString *shadowHexColor))dk_shadowHexColor;

- (UIView *(^)(CGSize shadowOffsize))dk_shadowSize;

- (UIView *(^)(CGFloat shadowOpacity))dk_shadowOpacity;


@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat top;

@property (nonatomic) CGFloat right;

@property (nonatomic) CGFloat bottom;

@property (nonatomic) CGFloat width;

@property (nonatomic) CGFloat height;

@property (nonatomic) CGFloat centerX;

@property (nonatomic) CGFloat centerY;

@property (nonatomic) CGPoint origin;

@property (nonatomic) CGSize size;

- (UIViewController *)viewController;

- (void)removeAllSubViews;

@end
