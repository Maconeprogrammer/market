//
//  HomeViewController.m
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/10.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import "HomeViewController.h"
#import <WRNavigationBar.h>
#import "UICollectionView+IndexPath.h"
#import "WaterFlowLayout.h"
#import "HomeListCollectionViewCell.h"
#import "HomeListModel.h"
#import "HomeTopView.h"
#import "XYTransition.h"
#import "XYTransitionProtocol.h"
#import "DetailViewController.h"

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,WaterFlowLayoutDelegate,XYTransitionProtocol>

@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI
{
    WaterFlowLayout *layout = [WaterFlowLayout new];
    layout.columnCount = 2;
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);;
    layout.rowMargin = 10;
    layout.columnMargin = 10;
    layout.headerReferenceSize = CGSizeMake(kScreenWidth, 100);
    layout.delegate = self;
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    self.collectionView.top -= 64;
    self.collectionView.height += 64;
    [self.collectionView setCollectionViewLayout:layout];
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.collectionView registerClass:[HomeListCollectionViewCell class] forCellWithReuseIdentifier:@"HomeListCollectionViewCell"];
    [self.collectionView registerClass:[HomeTopView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HomeTopView"];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    [self.view addSubview:self.collectionView];

    [self loadData];
}

- (void)loadData
{
    self.dataArray = [NSMutableArray array];
    NSArray * array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"demoData" ofType:@"plist"]];
    for(int i=0;i<array.count;i++)
    {
        NSDictionary *dict = array[i];
        HomeListModel *model = [[HomeListModel alloc] init];
        [model setValuesForKeysWithDictionary:dict];
        model.height = [self countHeight:model];
        [self.dataArray addObject:model];
    }
}

- (CGFloat )countHeight:(HomeListModel *)model
{
    CGFloat height = 80.0f;
    height += (model.showDayRate)   ? 35 :0;
    height += (model.showTurnover)  ? 35 :0;
    height += (model.showHistory)   ? 65 :0;
    height += (model.showIssueDate) ? 35 :0;
    height += (model.showGraph)     ? 100 :0;
    return height;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HomeListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HomeListCollectionViewCell" forIndexPath:indexPath];
    HomeListModel *model = self.dataArray[indexPath.row];
    cell.model = model;

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.collectionView setCurrentIndexPath:indexPath];
    DetailViewController *dvc = [[DetailViewController alloc] init];
    HomeListModel *model = self.dataArray[indexPath.row];
    dvc.model = model;
    dvc.isTransition = YES;
    [self.navigationController pushViewController:dvc animated:YES];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(kScreenWidth, 100);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{

    HomeTopView *headerView;
    NSString *CellIdentifier = @"HomeTopView";
    if(kind == UICollectionElementKindSectionHeader)
    {
        headerView = (HomeTopView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:CellIdentifier forIndexPath:indexPath];
        if(!headerView)
        {
            headerView = [[HomeTopView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
        }
            headerView.upNumber = 4;
            headerView.downNumber = 3;
    }

    return headerView;
}


#pragma mark - WaterFlowLayoutDelegate

-(CGFloat)waterFlowLayout:(WaterFlowLayout *)WaterFlowLayout heightForWidth:(CGFloat)width andIndexPath:(NSIndexPath *)indexPath{
    HomeListModel *personModel = _dataArray[indexPath.row];
    CGFloat imgH = personModel.height;
    return imgH;

}

#pragma mark - XYTransitionProtocol

-(UIView *)targetTransitionView{
    NSIndexPath * indexPath = [self.collectionView currentIndexPath];
    HomeListCollectionViewCell *cell =(HomeListCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    return cell.backgroundView;
}

-(BOOL)isNeedTransition{
    return YES;
}




@end
