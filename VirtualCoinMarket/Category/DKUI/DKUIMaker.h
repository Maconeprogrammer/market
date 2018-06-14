//
//  DKUIMaker.h
//  DuoKaHealth
//
//  Created by sujinxu on 2018/5/29.
//  Copyright © 2018年 北京健科云网科技有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DKUIMaker : NSObject

+ (UIView *)dk_createView;

+ (UIView *)dk_createViewWithFrame:(CGRect)frame;

+ (UILabel *)dk_createLabel;

+ (UILabel *)dk_createLabelWithFrame:(CGRect)frame;

+ (UIButton *)dk_createButton;

+ (UIButton *)dk_createButtonWihtButtonType:(UIButtonType)type;

+ (UIImageView *)dk_createImageView;

+ (UIImageView *)dk_createImageViewWithFrame:(CGRect)frame;

+ (UIImageView *)dk_createImageViewWithImage:(UIImage *)image
                            highlightedImage:(UIImage *)highlightedImage;

#pragma mark - 强转

+ (UIButton *(^)(UIView *btn))button;

+ (UILabel *(^)(UIView *label))label;

+ (UIImageView *(^)(UIView *imgView))imgView;


@end
