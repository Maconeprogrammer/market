//
//  DKUIMaker.m
//  DuoKaHealth
//
//  Created by sujinxu on 2018/5/29.
//  Copyright © 2018年 北京健科云网科技有限公司. All rights reserved.
//

#import "DKUIMaker.h"

@implementation DKUIMaker

+ (UIView *)dk_createView
{
    return [[UIView alloc] init];
}

+ (UIView *)dk_createViewWithFrame:(CGRect)frame
{
    return [[UIView alloc] initWithFrame:frame];
}

+ (UILabel *)dk_createLabel
{
    return [[UILabel alloc] init];
}

+ (UILabel *)dk_createLabelWithFrame:(CGRect)frame
{
    return [[UILabel alloc] initWithFrame:frame];
}

+ (UIImageView *)dk_createImageView
{
    return [[UIImageView alloc] init];
}

+ (UIImageView *)dk_createImageViewWithFrame:(CGRect)frame
{
    return [[UIImageView alloc] initWithFrame:frame];
}

+ (UIImageView *)dk_createImageViewWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage
{
    return [[UIImageView alloc] initWithImage:image highlightedImage:highlightedImage];
}

+ (UIButton *)dk_createButton
{
    return [[UIButton alloc] init];
}
+ (UIButton *)dk_createButtonWihtButtonType:(UIButtonType)type
{
    return  [UIButton buttonWithType:type];
}

+ (UIButton *(^)(UIView *))button
{
    return ^(UIView *btn){

        return (UIButton *)btn;
    };
}

+ (UILabel *(^)(UIView *))label
{
    return ^(UIView *label){

        return (UILabel *)label;
    };
}

+ (UIImageView *(^)(UIView *))imgView
{
    return ^(UIView *imgView){

        return (UIImageView *)imgView;
    };
}



@end
