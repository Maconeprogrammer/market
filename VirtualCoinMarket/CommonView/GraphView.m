//
//  GraphView.m
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/13.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import "GraphView.h"

@interface GraphView()

{
    UILabel *startTimeLabel;
    UILabel *endTimeLabel;

    CGFloat juedeHeight;

    CGFloat bottomY;

    CAShapeLayer *shapeLayer;

    CAShapeLayer *coverLayer;
}
/**  y坐标轴单位 */
@property(nonatomic,strong) NSMutableArray *mYLabelArray;

/** 渐变背景视图 */
@property (nonatomic, strong) UIView *gradientBackgroundView;
/** 渐变图层 */
@property (nonatomic, strong) CAGradientLayer *gradientLayer;
/** 颜色数组 */
@property (nonatomic, strong) NSMutableArray *gradientLayerColors;
/**  区域渐变 */
@property(nonatomic,strong) CAGradientLayer *coverGradientLayer;

@property(nonatomic,strong) UIView *xyBgView;

@end


@implementation GraphView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self setupXY];
    }
    return self;
}

- (void)setupXY
{
    self.xyBgView = [[UIView alloc] initWithFrame:self.bounds];
    [self addSubview:self.xyBgView];
    self.mYLabelArray = [NSMutableArray array];
    juedeHeight = (self.height-10)/6;
    for(int i=0 ;i<5;i++)
    {
        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, juedeHeight+i*(juedeHeight+0.5), self.width, 0.5)];
        line.backgroundColor = [UIColor colorWithHexString:@"49495C"];
        [self.xyBgView addSubview:line];
        bottomY = line.bottom;

        UILabel *yLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,i*(juedeHeight+0.5) , 100, juedeHeight)];
        yLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:14];
        yLabel.textColor = [UIColor colorWithHexString:@"6c6b79"];
        [self.xyBgView addSubview:yLabel];
        [self.mYLabelArray addObject:yLabel];
    }

    startTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5*(juedeHeight+0.5), self.width/2, juedeHeight)];
    startTimeLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:14];
    startTimeLabel.textColor = [UIColor colorWithHexString:@"6c6b79"];
    [self.xyBgView addSubview:startTimeLabel];

    endTimeLabel = [[UILabel alloc] initWithFrame:CGRectMake(startTimeLabel.right, 5*(juedeHeight+0.5), self.width/2, juedeHeight)];
    endTimeLabel.textAlignment = NSTextAlignmentRight;
    endTimeLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:14];
    endTimeLabel.textColor = [UIColor colorWithHexString:@"6c6b79"];
    [self.xyBgView addSubview:endTimeLabel];


}

- (void)setIfXY:(BOOL)ifXY
{
    _ifXY = ifXY;
    self.xyBgView.hidden = !ifXY;
}

- (void)setStartTime:(NSString *)startTime
{
    _startTime = startTime;
    startTimeLabel.text = startTime;
}

- (void)setEndTime:(NSString *)endTime
{
    _endTime = endTime;
    endTimeLabel.text = endTime;
}

- (void)setYArrays:(NSArray *)yArrays
{
    _yArrays = yArrays;
    for(int i=0;i<self.mYLabelArray.count;i++)
    {
        UILabel *label = self.mYLabelArray[i];
        label.text = yArrays[i];
    }
}


- (void)setPoints:(NSArray *)points
{
    _points = points;
    if(self.yArrays.count)
    {
        [self drawCur];
    }
}

- (void)drawCur
{
    [shapeLayer removeFromSuperlayer];
    [self.gradientBackgroundView removeFromSuperview];
    [self.gradientLayer removeFromSuperlayer];
    [self drawGradientBackgroundView];
    [coverLayer removeFromSuperlayer];
    [_coverGradientLayer removeFromSuperlayer];


    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    NSString *firstPointValue = self.points[0];
    CGPoint firstPoint = [self transformPoint:firstPointValue andIndex:0];
    [bezierPath moveToPoint:firstPoint];
    for(int i=1;i<self.points.count/3+1;i++)
    {
        CGPoint point = [self transformPoint:self.points[i] andIndex:i];
        [bezierPath addLineToPoint:point];
    }

    shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = bezierPath.CGPath;
    shapeLayer.strokeColor = _endLineColor.CGColor;
    shapeLayer.lineWidth = 4;
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    shapeLayer.lineCap   = kCALineCapRound;
    shapeLayer.lineJoin  = kCALineJoinRound;
    self.gradientBackgroundView.layer.mask = shapeLayer;


    //绘制渐变色层
    UIBezierPath *coverPath = [UIBezierPath bezierPath];
    [coverPath moveToPoint:CGPointMake(0, juedeHeight*5)];
    for(int i=0;i<self.points.count/3 +1;i++)
    {
        CGPoint point = [self transformPoint:self.points[i] andIndex:i];
        [coverPath addLineToPoint:point];
    }
    [coverPath addLineToPoint:CGPointMake(self.width, 5*juedeHeight)];

    _coverGradientLayer = [CAGradientLayer layer];
    _coverGradientLayer.frame = self.bounds;
    _coverGradientLayer.colors = @[(__bridge id)_endBgColor.CGColor ,
                             (__bridge id)_startBgColor.CGColor,
                                   (__bridge id)[UIColor colorWithHexString:@"#ffffff" andAlpha:0.0].CGColor];
    _coverGradientLayer.startPoint = CGPointMake(0.5,0.5);
    _coverGradientLayer.endPoint = CGPointMake(0.5,1);

    coverLayer = [CAShapeLayer layer];
    coverLayer.path = coverPath.CGPath;
    _coverGradientLayer.mask = coverLayer;

    [self.layer addSublayer:_coverGradientLayer];


    CABasicAnimation *drawAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    drawAnimation.duration            = 5.0;
    drawAnimation.repeatCount         = 1.0;
    drawAnimation.removedOnCompletion = NO;
    drawAnimation.fromValue = [NSNumber numberWithFloat:0.0f];
    drawAnimation.toValue   = [NSNumber numberWithFloat:10.0f];
    drawAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [shapeLayer addAnimation:drawAnimation forKey:@"drawCircleAnimation"];
    [_coverGradientLayer addAnimation:drawAnimation forKey:@"drawCircleAnimation"];
}

- (void)drawGradientBackgroundView {

    self.gradientBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.width, self.height)];
    [self addSubview:self.gradientBackgroundView];

    self.gradientLayer = [CAGradientLayer layer];
    self.gradientLayer.frame = self.gradientBackgroundView.bounds;
    self.gradientLayer.startPoint = CGPointMake(0, 0.0);
    self.gradientLayer.endPoint = CGPointMake(1.0, 0.0);

    self.gradientLayerColors = [NSMutableArray arrayWithArray:@[(__bridge id)self.startLineColor.CGColor, (__bridge id)self.endLineColor.CGColor]];
    self.gradientLayer.colors = self.gradientLayerColors;
    [self.gradientBackgroundView.layer addSublayer:self.gradientLayer];
}

- (CGPoint)transformPoint:(NSString *)value andIndex:(NSInteger)i
{
    CGFloat y1 = [self.yArrays[self.yArrays.count-1] floatValue];
    CGFloat y2 = [self.yArrays[self.yArrays.count-2] floatValue];
    CGFloat juedeValue = y2-y1;
    CGFloat avageHeight = juedeHeight / juedeValue;

    // x y值确定
    CGFloat currentY = bottomY - ([value floatValue] -3600) *avageHeight;
    CGFloat currentX = i*(self.width)/self.points.count*3;

    return CGPointMake(currentX, currentY);
}




@end
