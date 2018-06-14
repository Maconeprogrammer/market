//
//  HomeTopView.h
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/11.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeTopView : UICollectionReusableView

@property(nonatomic,assign) NSInteger upNumber;

@property(nonatomic,assign) NSInteger downNumber;

@property(nonatomic,strong) UIButton *sortButton;

@property(nonatomic,strong) UIButton *editButton;

@property(nonatomic,strong) UIButton *searchButton;

@end
