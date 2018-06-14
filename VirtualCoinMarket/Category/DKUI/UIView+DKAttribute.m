//
//  UIView+DKAttribute.m
//  PandoraCircle
//
//  Created by sujinxu on 2018/5/29.
//  Copyright © 2018年 MF. All rights reserved.
//

#import "UIView+DKAttribute.h"
#import <UIKit/UIKit.h>

@implementation UIView (DKAttribute)

- (UIView *(^)(CGRect))dkFrame
{
    return ^(CGRect rect){

        self.frame = rect;
        return self;
    };
}

- (UIView *(^)(CGFloat, CGFloat, CGFloat, CGFloat))dkXYFrame
{
    return ^(CGFloat x, CGFloat y, CGFloat width, CGFloat height){

        
        self.frame = CGRectMake(x, y, width, height);

        return self;
    };

}

- (UIView *(^)(UIColor *))bgColor
{
    return ^(UIColor *bgColor){

        self.backgroundColor = bgColor;
        return self;
    };
}

- (UIView *(^)(NSString *))bgRGBColor
{
    return ^(NSString *rgb){

        self.backgroundColor = [UIColor colorWithHexString:rgb];
        return self;
    };
}

- (UIView *(^)(CGFloat))dk_cornerRadius
{
    return ^(CGFloat radius){

        self.layer.cornerRadius = radius;
        return self;
    };
}

- (UIView *(^)(CGFloat))dk_boardWidth
{
    return ^(CGFloat width){

        self.layer.borderWidth = width;
        return self;
    };
}

- (UIView *(^)(UIColor *))dk_boardColor
{
    return ^(UIColor *color){

        self.layer.borderColor = color.CGColor;
        return self;
    };
}

- (UIView *(^)(NSString *))dk_boardHexColor
{
    return ^(NSString *hexColor){

        self.layer.borderColor = [UIColor colorWithHexString:hexColor].CGColor;
        return self;
    };
}

- (UIView *(^)(UIColor *))dk_shadowColor
{
    return ^(UIColor *color){

        self.layer.shadowColor = color.CGColor;
        return self;
    };
}

- (UIView *(^)(NSString *))dk_shadowHexColor
{
    return ^(NSString *shadowHexColor){

        self.layer.shadowColor = [UIColor colorWithHexString:shadowHexColor].CGColor;
        return self;
    };
}

- (UIView *(^)(CGSize))dk_shadowSize
{
    return ^(CGSize size){

        self.layer.shadowOffset = size;
        return self;
    };
}
- (UIView *(^)(CGFloat))dk_shadowOpacity
{
    return ^(CGFloat opcity){

        self.layer.shadowOpacity = opcity;
        return self;
    };
}

- (UIView *(^)(CGFloat))dk_left
{
    return ^(CGFloat left){

        self.left = left;
        return self;
    };
}

- (UIView *(^)(CGFloat))dk_top
{
    return ^(CGFloat top){

        self.top = top;
        return self;
    };
}

- (UIView *(^)(CGFloat))dk_right
{
    return ^(CGFloat right){

        self.right = right;
        return self;
    };
}

- (UIView *(^)(CGFloat))dk_width
{
    return ^(CGFloat width){

        self.width = width;
        return self;
    };
}

- (UIView *(^)(CGFloat))dk_height
{
    return ^(CGFloat height){

        self.height = height;
        return self;
    };
}

- (UIView *(^)(CGFloat))dk_bottom
{
    return ^(CGFloat bottom){

        self.left = bottom;
        return self;
    };
}

- (UIView *(^)(CGPoint))dk_origin
{
    return ^(CGPoint origin){

        self.origin = origin;
        return self;
    };
}

- (UIView *(^)(CGFloat))dk_centerY
{
    return ^(CGFloat centerY){

        self.centerY = centerY;
        return self;
    };
}

- (UIView *(^)(CGFloat))dk_centerX
{
    return ^(CGFloat centerX){

        self.centerX = centerX;
        return self;
    };
}

- (UIView *(^)(CGSize))dk_size
{
    return ^(CGSize size){

        self.size = size;
        return self;
    };
}
- (CGFloat)left{

    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)left{

    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

- (CGFloat)top{

    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)top{

    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

- (CGFloat)right{

    return self.frame.origin.x+self.frame.size.width;
}

- (void)setRight:(CGFloat)right{

    CGRect frame = self.frame;
    frame.origin.x = right-frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom{

    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom{

    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (UIViewController *)viewController{

    for (UIView* next = self; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (void)removeAllSubViews {
    for (id view in self.subviews) {
        [view removeFromSuperview];
    }
}

- (UIView *(^)(UIViewContentMode))dk_contentMode
{
    return ^(UIViewContentMode mode){
        self.contentMode = mode;
        return self;
    };
}



@end
