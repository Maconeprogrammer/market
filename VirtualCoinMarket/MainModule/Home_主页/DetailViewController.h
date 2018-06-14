//
//  DetailViewController.h
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/10.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "HomeListModel.h"
#import "DetailTopView.h"
#import "DetailSectionView.h"

@interface DetailViewController : BaseViewController

@property(nonatomic,strong) HomeListModel *model;

@property(nonatomic,assign) BOOL isTransition;//是否开启转场动画

@property(nonatomic,strong) DetailTopView *dtopView;

@property(nonatomic,strong) DetailSectionView *sectionView;

@end
