//
//  UIButton+DKAttribbute.h
//  DuoKaHealth
//
//  Created by sujinxu on 2018/5/29.
//  Copyright © 2018年 北京健科云网科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+DKAttribute.h"

@interface UIButton (DKAttribbute)

- (UIButton *(^)(id target, SEL selector,UIControlEvents event))selector;

- (UIButton *(^)(NSString *title,UIControlState state))dkTitle;

- (UIButton *(^)(NSString *hexColor,UIControlState state))titleHexColor;

- (UIButton *(^)(UIColor *color,UIControlState state))dkTitleColor;

- (UIButton *(^)(UIFont *font))titleFont;

- (UIButton *(^)(UIImage *image,UIControlState state))backImage;

- (UIButton *(^)(UIImage *image,UIControlState state))image;

- (UIButton *(^)(UIEdgeInsets edge))imageInsets;

- (UIButton *(^)(UIEdgeInsets edge))titleInset;



@end
