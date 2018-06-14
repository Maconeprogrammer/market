//
//  WaterFlowLayout.m
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/11.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import "WaterFlowLayout.h"
#import "HomeTopView.h"

@interface WaterFlowLayout()

@property (strong,nonatomic)NSMutableDictionary *maxYDic;

@property (strong,nonatomic)NSMutableArray *attrsArray;

@end

@implementation WaterFlowLayout

-(NSMutableDictionary *)maxYDic
{
    if (!_maxYDic)
    {
        _maxYDic = [NSMutableDictionary dictionary];
    }
    return _maxYDic;
}
-(NSMutableArray *)attrsArray
{
    if (!_attrsArray)
    {
        _attrsArray = [NSMutableArray array];
    }
    return _attrsArray;
}

-(instancetype)init
{
    if (self = [super init]){
        self.columnMargin = 10;
        self.rowMargin = 10;
        self.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        self.columnCount = 3;
    }
    return self;
}

-(void)prepareLayout
{
    [super prepareLayout];

    for (int i =0; i < self.columnCount; i++)
    {
        NSString *column = [NSString stringWithFormat:@"%d",i];
        self.maxYDic[column] = @(self.sectionInset.top);
    }


    [self.attrsArray removeAllObjects];

    UICollectionViewLayoutAttributes * layoutHeader = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:[NSIndexPath indexPathWithIndex:0]];
    layoutHeader.frame =CGRectMake(0,0, self.headerReferenceSize.width, self.headerReferenceSize.height);
    [self.attrsArray addObject:layoutHeader];

    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i=0; i<count; i++)
    {
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForItem:i inSection:0]];

        [self.attrsArray addObject:attrs];
    }
}

-(CGSize)collectionViewContentSize
{
    __block NSString *maxColumn = @"0";

    [self.maxYDic enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {

        if ([maxY floatValue] > [self.maxYDic[maxColumn] floatValue])
        {
            maxColumn = column;
        }
    }];
    return CGSizeMake(0, [self.maxYDic[maxColumn] floatValue] + self.sectionInset.bottom + self.headerReferenceSize.height );
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    __block NSString *minColumn = @"0";
    [self.maxYDic enumerateKeysAndObjectsUsingBlock:^(NSString *column, NSNumber *maxY, BOOL *stop) {

        if ([maxY floatValue] < [self.maxYDic[minColumn] floatValue])
        {
            minColumn = column;
        }
    }];

    CGFloat width = (self.collectionView.frame.size.width - self.columnMargin*(self.columnCount - 1) - self.sectionInset.left - self.sectionInset.right) / self.columnCount;

    CGFloat height = [self.delegate waterFlowLayout:self heightForWidth:width andIndexPath:indexPath] ;
    CGFloat x = self.sectionInset.left + (width + self.columnMargin) * [minColumn floatValue];
    CGFloat y = [self.maxYDic[minColumn] floatValue] + self.rowMargin;
    self.maxYDic[minColumn] = @(y + height);
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.frame = CGRectMake(x, self.headerReferenceSize.height + y, width, height );

    return attrs;
}
-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return [self.attrsArray copy];
}

@end
