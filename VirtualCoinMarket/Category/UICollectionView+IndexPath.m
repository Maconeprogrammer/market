//
//  UICollectionView+IndexPath.m
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/11.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import "UICollectionView+IndexPath.h"
#import <objc/runtime.h>

static NSString * const KIndexPathKey = @"kIndexPathKey";
@implementation UICollectionView (IndexPath)

-(void)setCurrentIndexPath:(NSIndexPath *)indexPath
{
    objc_setAssociatedObject(self, &KIndexPathKey, indexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSIndexPath *)currentIndexPath
{
    NSIndexPath * indexPath = objc_getAssociatedObject(self, &KIndexPathKey);
    return indexPath;
}

@end
