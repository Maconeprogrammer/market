//
//  UILabel+DKAttribbute.m
//  DuoKaHealth
//
//  Created by sujinxu on 2018/5/29.
//  Copyright © 2018年 北京健科云网科技有限公司. All rights reserved.
//

#import "UILabel+DKAttribbute.h"

@implementation UILabel (DKAttribbute)

- (UILabel *(^)(UIColor *))dk_textColor
{
    return ^(UIColor *color){

        self.textColor = color;
        return self;
    };
}

- (UILabel *(^)(NSString *))textHexColor
{
    return ^(NSString *hexColor){

        self.textColor = [UIColor colorWithHexString:hexColor];
        return self;
    };
}

- (UILabel *(^)(UIFont *))dk_font
{
    return ^(UIFont *font){

        self.font = font;
        return self;
    };
}

- (UILabel *(^)(NSString *))dk_text
{
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment))dk_alignment
{
    return ^(NSTextAlignment alignment){
        self.textAlignment = alignment;
        return self;
    };
}

- (UILabel *(^)(NSString *))dk_attStr
{
    return ^(NSString *text){

        self.attributedText = [[NSMutableAttributedString alloc] initWithString:text];
        return self;
    };
}

- (UILabel *(^)(NSRange, UIColor *, UIFont *))dk_mStr
{
    return ^(NSRange range,UIColor *color,UIFont *font){

        NSDictionary *dict = @{NSForegroundColorAttributeName:color,
                               NSFontAttributeName:font
                               };
        NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc] initWithString:self.text];
        [mStr addAttributes:dict range:range];
        return self;
    };
}

- (UILabel *(^)(NSRange, NSString *, UIFont *))dk_rgbMstr
{
    return ^(NSRange range,NSString *color,UIFont *font){

        NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor colorWithHexString:color],
                               NSFontAttributeName:font
                               };
        NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc] initWithString:self.text];
        [mStr addAttributes:dict range:range];
        return self;
    };
}

- (UILabel *(^)(NSInteger))dk_numberLine
{
    return ^(NSInteger num){

        self.numberOfLines = num;
        return self;
    };
}



@end
