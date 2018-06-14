//
//  WaterFlowLayout.h
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/11.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WaterFlowLayout;

@protocol WaterFlowLayoutDelegate

-(CGFloat)waterFlowLayout:(WaterFlowLayout *) WaterFlowLayout
           heightForWidth:(CGFloat)width
             andIndexPath:(NSIndexPath *)indexPath;

@end

@interface WaterFlowLayout : UICollectionViewLayout

@property (assign,nonatomic)CGFloat columnMargin;
@property (assign,nonatomic)CGFloat rowMargin;
@property (assign,nonatomic)UIEdgeInsets sectionInset;
@property (assign,nonatomic)NSInteger columnCount;
@property (nonatomic, assign) CGSize headerReferenceSize;

@property (weak,nonatomic)id<WaterFlowLayoutDelegate> delegate;


@end
