//
//  FeatureTools.m
//  ZYDoctor
//
//  Created by sujinxu on 2017/11/29.
//  Copyright © 2017年 JKY. All rights reserved.
//

#import "FeatureTools.h"
#import <CommonCrypto/CommonDigest.h>
#import <CoreText/CoreText.h>

@implementation FeatureTools

+ (UIColor *) colorWithHexString: (NSString *)color andAlpha:(CGFloat)alpha
{
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];

    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

+(UIImage *)getRestImage:(UIImage *)source_image maxSize:(NSInteger)maxSize{
    NSData *imageData=[self resetSizeOfImageData:source_image maxSize:maxSize];
    return [UIImage imageWithData:imageData];
}
+ (NSData *)resetSizeOfImageData:(UIImage *)source_image maxSize:(NSInteger)maxSize
{
    //先调整分辨率
    CGSize newSize = CGSizeMake(source_image.size.width, source_image.size.height);

    CGFloat tempHeight = newSize.height / 1024;
    CGFloat tempWidth = newSize.width / 1024;

    if (tempWidth > 1.0 && tempWidth > tempHeight) {
        newSize = CGSizeMake(source_image.size.width / tempWidth, source_image.size.height / tempWidth);
    }
    else if (tempHeight > 1.0 && tempWidth < tempHeight){
        newSize = CGSizeMake(source_image.size.width / tempHeight, source_image.size.height / tempHeight);
    }

    UIGraphicsBeginImageContext(newSize);
    [source_image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    //调整大小
    NSData *imageData = UIImageJPEGRepresentation(newImage,1.0);
    NSUInteger sizeOrigin = [imageData length];
    NSUInteger sizeOriginKB = sizeOrigin / 1024;
    if (sizeOriginKB > maxSize) {

        NSData *finallImageData = UIImageJPEGRepresentation(newImage,0.50);

        return finallImageData;
    }

    return imageData;
}

+ (void)startCountdownProcessBlock:(void(^)(NSString *currentTime))processBlock
                       andEndBlock:(void(^)())endBlock{

    __block int timeout = 60;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示
                endBlock();

            });
        }else{
            int seconds = timeout % 60;
            if(seconds == 0) seconds = 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2ds", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                processBlock(strTime);

            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

+ (NSString *)getTimeStringWithInteval:(NSString *)time{

    NSString *timeString = [self valueNull:time];
    NSDateFormatter  *dateFormater = [[NSDateFormatter alloc] init];
    dateFormater.dateStyle = NSDateFormatterNoStyle;
    [dateFormater setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [dateFormater setTimeZone:timeZone];
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:[timeString longLongValue]/1000];

    return [NSString stringWithFormat:@"%@",[dateFormater stringFromDate:confromTimesp]];
}

+ (CGRect)setContentLable:(UILabel *)custonLabel
                 andWidth:(CGFloat)width
             andContenStr:(NSString *)content
             andlineSpace:(CGFloat)lineSpace
           andHeightSpace:(long)fontSpace
        andKtextAlignment:(NSTextAlignment)alignment
{

    if(content==nil){
        content = @"";
    }
    NSMutableAttributedString *str
    = [[NSMutableAttributedString alloc] initWithString:content];

    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:lineSpace];//行间距
    [style setAlignment:alignment];
    CFNumberRef num
    = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&fontSpace);
    [str addAttribute:(id)kCTKernAttributeName
                value:(__bridge id)num
                range:NSMakeRange(0, content.length)];
    CFRelease(num);//字间距
    [str addAttribute:NSUnderlineStyleAttributeName
                value:[NSNumber numberWithInteger:NSUnderlineStyleNone]
                range:NSMakeRange(0, str.length)];
    [str addAttribute:NSParagraphStyleAttributeName
                value:style
                range:NSMakeRange(0, [str length])];
    [str addAttribute:NSFontAttributeName
                value:custonLabel.font
                range:NSMakeRange(0, str.length)];
    [str addAttribute:NSForegroundColorAttributeName
                value:custonLabel.textColor
                range:NSMakeRange(0, str.length)];
    [custonLabel setAttributedText:str];

    CGRect rect = [str
                   boundingRectWithSize:CGSizeMake(width, 0)
                   options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading
                   context:nil];
    if(rect.size.height<30){
        rect = CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, 30);
    }
    return rect;
}
+ (NSString *)valueNull:(id)value{

    NSString *tempString = @"";
    if([value isKindOfClass:[NSString class]]){

        if(value == nil || [value isKindOfClass:[NSNull class]]){

            return tempString;
        }else{

            tempString = value;
        }
    }else if ([value isKindOfClass:[NSNumber class]]){


        if([value stringValue] == nil || [[value stringValue] isKindOfClass:[NSNull class]]){

            return tempString;
        }else{

            tempString = [value stringValue];
        }
    }

    return tempString;
}
+ (CGSize)getContentSizeWithFont:(UIFont *)font
                withContentWidth:(CGFloat)width
                     withContent:(NSString *)content
                   withLineSpace:(CGFloat)lineSpace
                 withHeightSpace:(long)fontSpace
{
    if([content isKindOfClass:[NSNull class]] || content == nil ){
        content = @"";
    }
    NSMutableAttributedString *str
    = [[NSMutableAttributedString alloc] initWithString:content];

    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineSpacing:lineSpace];//行间距
    CFNumberRef num
    = CFNumberCreate(kCFAllocatorDefault,kCFNumberSInt8Type,&fontSpace);
    [str addAttribute:(id)kCTKernAttributeName
                value:(__bridge id)num
                range:NSMakeRange(0, content.length)];
    CFRelease(num);//字间距
    [str addAttribute:NSParagraphStyleAttributeName
                value:style
                range:NSMakeRange(0, [str length])];
    [str addAttribute:NSFontAttributeName
                value:font
                range:NSMakeRange(0, str.length)];

    CGRect rect = [str
                   boundingRectWithSize:CGSizeMake(width, 0)
                   options:NSStringDrawingUsesLineFragmentOrigin |NSStringDrawingUsesFontLeading
                   context:nil];
    return rect.size;
}

+ (BOOL) validateMobile:(NSString *)mobile
{
    //手机号以1开头
    NSString *phoneRegex = @"^1\\d{10}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    BOOL matched = [phoneTest evaluateWithObject:mobile];

    return matched;
}

@end
