//
//  XYTransition.m
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/9.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import "XYTransition.h"
#import "XYTransitionProtocol.h"

@interface XYTransition()

@property (nonatomic, assign) CGFloat animationScale;

@end

@implementation XYTransition

-(instancetype)init{
    self = [super init];
    if (self) {
        self.animationDuration = 0.3;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return self.animationDuration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    if (_isPush) {
        [self pushAnimateTransition:transitionContext];
    }else{
        [self popAnimateTransition:transitionContext];
    }
}

#pragma mark ————— push —————
- (void)pushAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController<XYTransitionProtocol> * fromVC = (UIViewController <XYTransitionProtocol> * )[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController<XYTransitionProtocol> * toVC = (UIViewController <XYTransitionProtocol> * )[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    __block UIView * fromView = fromVC.view;
    __block UIView * toView = toVC.view;

    UIView * containerView = [transitionContext containerView];
    [containerView addSubview:fromView];
    [containerView addSubview:toView];
    

    UIView *fromCellView = [fromVC targetTransitionView];
    UIView *toCellView = [toVC targetTransitionView];

    CGPoint nowViewPoint = [fromCellView convertPoint:CGPointZero toView:nil];
    CGPoint toViewPoint = [toCellView convertPoint:CGPointZero toView:nil];
    
    toView.hidden = YES;
    __block UIImageView * snapShot =[[UIImageView alloc] initWithImage:[fromCellView snapshotImage]];
    snapShot.backgroundColor = [UIColor clearColor];
    [containerView addSubview:snapShot];
    
    [snapShot setOrigin:nowViewPoint];
    _animationScale = MAX([toVC targetTransitionView].width, snapShot.width) / MIN([toVC targetTransitionView].width, snapShot.width);
    CGRect originFrame = fromView.frame;
    [UIView animateWithDuration:self.animationDuration animations:^{

        snapShot.transform =  CGAffineTransformMakeScale(_animationScale,_animationScale);
        [snapShot setOrigin:toViewPoint];
        
        fromView.alpha = 0;
        fromView.transform = snapShot.transform;
        fromView.frame = CGRectMake(-(nowViewPoint.x)*_animationScale,
                                    -(nowViewPoint.y)*_animationScale + toViewPoint.y,
                                    fromVC.view.frame.size.width,
                                    fromVC.view.frame.size.height);
    } completion:^(BOOL finished) {
        if (finished) {

            [snapShot removeFromSuperview];
            toView.hidden = NO;
            fromView.alpha = 1;
            fromVC.view.transform = CGAffineTransformIdentity;
            fromVC.view.frame = originFrame;
            [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
        }
    }];
    
}

#pragma mark ————— pop —————
- (void)popAnimateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController <XYTransitionProtocol> * fromVC = (UIViewController<XYTransitionProtocol>*)[transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController <XYTransitionProtocol> * toVC = (UIViewController<XYTransitionProtocol>*)[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];

    UIView * containerView = [transitionContext containerView];
    __block UIView * toView = toVC.view;
    [containerView addSubview:toView];
    toView.hidden = YES;

    UIView *fromCellView = [fromVC targetTransitionView];
    UIView *toCellView = [toVC targetTransitionView];

    CGPoint leftUperPoint = [toCellView convertPoint:CGPointZero toView:nil];

    CGPoint nowViewPoint = [fromCellView convertPoint:CGPointZero toView:nil];
    __block UIImageView * snapShot =[[UIImageView alloc] initWithImage:[toCellView snapshotImage]];
    _animationScale = MAX(fromCellView.width, snapShot.width) / MIN(fromCellView.width, snapShot.width);
    
    [containerView addSubview:snapShot];
    snapShot.backgroundColor = [UIColor clearColor];
    snapShot.transform = CGAffineTransformMakeScale(_animationScale, _animationScale);
    [snapShot setOrigin:CGPointMake(0, nowViewPoint.y)];
    CGRect originFrame = toView.frame;
    toView.hidden = NO;
    toView.alpha = 0;
    toView.transform = snapShot.transform;
    
    toView.frame = CGRectMake(-(leftUperPoint.x * _animationScale), -((leftUperPoint.y - nowViewPoint.y) * _animationScale + nowViewPoint.y),
                              toView.frame.size.width, toView.frame.size.height);
    
    
    toCellView.hidden = YES;
    __block UIView *whiteViewContainer = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    whiteViewContainer.backgroundColor = [UIColor colorWithRed:37.0/255.0 green:39.0/255.0 blue:54.0/255.0 alpha:1];
    
    [containerView addSubview:whiteViewContainer];
    [containerView insertSubview:whiteViewContainer belowSubview:toView];
    [UIView animateWithDuration:self.animationDuration animations:^{
        snapShot.transform = CGAffineTransformIdentity;
        [snapShot setOrigin:leftUperPoint];
        toView.transform = CGAffineTransformIdentity;
        toView.alpha = 1.0;
        [toView setFrame:originFrame];
    } completion:^(BOOL finished) {

        
        [snapShot removeFromSuperview];
        [whiteViewContainer removeFromSuperview];
        toCellView.hidden = NO;
        toView.transform = CGAffineTransformIdentity;
        toView.frame = originFrame;
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}
@end
