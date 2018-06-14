//
//  HomeListCollectionViewCell.h
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/11.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeListModel.h"

@interface HomeListCollectionViewCell : UICollectionViewCell

@property(nonatomic,strong) HomeListModel *model;
@property(nonatomic,strong) UILabel *nameLabel;

@end
