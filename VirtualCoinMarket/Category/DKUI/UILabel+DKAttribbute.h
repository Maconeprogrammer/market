//
//  UILabel+DKAttribbute.h
//  DuoKaHealth
//
//  Created by sujinxu on 2018/5/29.
//  Copyright © 2018年 北京健科云网科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (DKAttribbute)

- (UILabel *(^)(UIColor *color))dk_textColor;

- (UILabel *(^)(NSString *hexColor))textHexColor;

- (UILabel *(^)(UIFont *font))dk_font;

- (UILabel *(^)(NSString *text))dk_text;

- (UILabel *(^)(NSTextAlignment alignment))dk_alignment;

- (UILabel *(^)(NSString *text))dk_attStr;

- (UILabel *(^)(NSRange range,UIColor *rangeColor,UIFont *rangeFont))dk_mStr;

- (UILabel *(^)(NSRange range,NSString *rangeHexColor,UIFont *rangeFont))dk_rgbMstr;

- (UILabel *(^)(NSInteger number))dk_numberLine;



@end
