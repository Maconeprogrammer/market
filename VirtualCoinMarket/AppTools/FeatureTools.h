//
//  FeatureTools.h
//  ZYDoctor
//
//  Created by sujinxu on 2017/11/29.
//  Copyright © 2017年 JKY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FeatureTools : NSObject

/*!
 *
 *  @brief 颜色转换 IOS中十六进制的颜色转换为UIColor
 *  @param color 字符串
 *
 *  @returnUIColor
 */
+ (UIColor *) colorWithHexString: (NSString *)color andAlpha:(CGFloat)alpha;
/*!
 *
 *  @brief 压缩图片
 *
 *  @param source_image 图片
 *  @param maxSize      压缩到大小
 *
 *  @return 图片
 */
+ (UIImage *)getRestImage:(UIImage *)source_image maxSize:(NSInteger)maxSize;
/*!
 *  @author 金旭苏, 16-03-11 13:03:45
 *
 *  @brief 倒计时
 *
 *  @param processBlock 进行中
 *  @param endBlock     结束
 */
+ (void)startCountdownProcessBlock:(void(^)(NSString *currentTime))processBlock
                       andEndBlock:(void(^)())endBlock;
/**
 *  转化时间戳为时间
 *
 *  @param time 时间戳
 *
 *  @return 格式化时间字符串
 */
+ (NSString *)getTimeStringWithInteval:(NSString *)time;

/*!
 *  @brief 根据特定的label文字内容获取特定的rect
 *
 *  @param custonLabel 原label
 *  @param content     内容
 *  @param lineSpace   行间距
 *  @param fontSpace   字间距
 *  @param alignment   布局样式
 *
 *  @return rect
 */
+ (CGRect)setContentLable:(UILabel *)custonLabel
                 andWidth:(CGFloat)width
             andContenStr:(NSString *)content
             andlineSpace:(CGFloat)lineSpace
           andHeightSpace:(long)fontSpace
        andKtextAlignment:(NSTextAlignment)alignment;

+ (NSData *)resetSizeOfImageData:(UIImage *)source_image maxSize:(NSInteger)maxSize;
/*!
 *  @brief 根据特定的label文字内容获取特定的rect
 *
 *  @param  font       字体
 *  @param content     内容
 *  @param lineSpace   行间距
 *  @param fontSpace   字间距
 *
 *  @return size
 */
+ (CGSize)getContentSizeWithFont:(UIFont *)font
                withContentWidth:(CGFloat)width
                     withContent:(NSString *)content
                   withLineSpace:(CGFloat)lineSpace
                 withHeightSpace:(long)fontSpace;

/**
 检查电话号码是否可用

 @param mobile 手机号
 @return YES or NO
 */
+ (BOOL) validateMobile:(NSString *)mobile;

@end
