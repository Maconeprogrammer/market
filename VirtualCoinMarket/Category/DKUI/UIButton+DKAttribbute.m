//
//  UIButton+DKAttribbute.m
//  DuoKaHealth
//
//  Created by sujinxu on 2018/5/29.
//  Copyright © 2018年 北京健科云网科技有限公司. All rights reserved.
//

#import "UIButton+DKAttribbute.h"

@implementation UIButton (DKAttribbute)

- (UIButton *(^)(id, SEL, UIControlEvents))selector
{
    return ^(id control,SEL selector,UIControlEvents event){

        [self addTarget:control action:selector forControlEvents:event];
        return self;
    };
}

- (UIButton *(^)(NSString *,UIControlState))dkTitle
{
    return ^(NSString *title,UIControlState state){

        [self setTitle:title forState:state];
        return self;
    };
}

- (UIButton *(^)(NSString *, UIControlState))titleHexColor
{
    return ^(NSString *hexColor,UIControlState state){

        [self setTitleColor:[UIColor colorWithHexString:hexColor] forState:state];
        return self;
    };
}

- (UIButton *(^)(UIColor *, UIControlState))dkTitleColor
{
    return ^(UIColor *Color,UIControlState state){

        [self setTitleColor:Color forState:state];
        return self;
    };
}

- (UIButton *(^)(UIFont *))titleFont
{
    return ^(UIFont *font){

        self.titleLabel.font = font;
        return self;
    };
}

- (UIButton *(^)(UIImage *,UIControlState))backImage
{
    return ^(UIImage *image,UIControlState state){

        [self setBackgroundImage:image forState:state];
        return self;
    };
}

- (UIButton *(^)(UIImage *, UIControlState))image
{
    return ^(UIImage *image,UIControlState state){

        [self setImage:image forState:state];
        return self;
    };
}

- (UIButton *(^)(UIEdgeInsets))imageInsets
{
    return ^(UIEdgeInsets edge){

        self.imageEdgeInsets = edge;
        return self;
    };
}

- (UIButton *(^)(UIEdgeInsets))titleInset
{
    return ^(UIEdgeInsets edge){

        self.titleEdgeInsets = edge;
        return self;
    };
}



@end
