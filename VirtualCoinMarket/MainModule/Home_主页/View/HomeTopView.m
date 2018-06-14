//
//  HomeTopView.m
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/11.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import "HomeTopView.h"

@interface HomeTopView()

@property(nonatomic,strong) UILabel *upLabel;
@property(nonatomic,strong) UILabel *downLabel;

@end
@implementation HomeTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
        [self setupUI];
    }
    return self;
}

- (void)setupUI{

    CGFloat numberWidth = (self.width/2 -30-18-15)/2;
    _upLabel = [[UILabel alloc] initWithFrame:CGRectMake(18, 30, numberWidth, self.height-30)];
    _upLabel.textColor = [UIColor whiteColor];
    _upLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    [self addSubview:_upLabel];

    _downLabel = [[UILabel alloc] initWithFrame:CGRectMake(_upLabel.right, _upLabel.top, numberWidth, _upLabel.height)];
    _downLabel.textColor = [UIColor whiteColor];
    _downLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    [self addSubview:_downLabel];

    self.sortButton = [DKUIMaker dk_createButton];
    self.sortButton.dk_left(_downLabel.right)
    .dk_size(CGSizeMake(30, 30))
    .dk_top((self.height - 30-_upLabel.top)/2+_upLabel.top);
    [self.sortButton setBackgroundImage:[UIImage imageNamed:@"home_sort"] forState:UIControlStateNormal];
    [self addSubview:self.sortButton];

    self.editButton = [DKUIMaker dk_createButton];
    self.editButton.dk_left(_sortButton.right+18)
    .dk_size(CGSizeMake(30, 30))
    .dk_top((self.height - _upLabel.top -30)/2+_upLabel.top);
    [self.editButton setBackgroundImage:[UIImage imageNamed:@"home_edit"] forState:UIControlStateNormal];
    [self addSubview:self.editButton];

    self.searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.searchButton.left  = self.editButton.right+18;
    self.searchButton.width = self.width-self.editButton.right-18-15;
    self.searchButton.top   = (self.height - _upLabel.top -30)/2+_upLabel.top;
    self.searchButton.height = 30;
    [self.searchButton setBackgroundImage:[UIImage imageNamed:@"home_search"] forState:UIControlStateNormal];
    [self addSubview:self.searchButton];

    [self.searchButton addTarget:self action:@selector(searchClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)searchClick
{
    
}

- (void)setUpNumber:(NSInteger)upNumber
{
    _upNumber = upNumber;
    NSString *upNumberStr = [NSString stringWithFormat:@"%ld ",upNumber];
    NSString *upStr = [NSString stringWithFormat:@"%ld 涨",upNumber];
    NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc] initWithString:upStr];
    [mStr addAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"FF6CAE"],NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Semibold" size:28]} range:NSMakeRange(0, upNumberStr.length)];
    _upLabel.attributedText = mStr;
}

- (void)setDownNumber:(NSInteger)downNumber
{
    _downNumber = downNumber;
    NSString *upNumberStr = [NSString stringWithFormat:@"%ld ",downNumber];
    NSString *upStr = [NSString stringWithFormat:@"%ld 跌",downNumber];
    NSMutableAttributedString *mStr = [[NSMutableAttributedString alloc] initWithString:upStr];
    [mStr addAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithHexString:@"59C076"],NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Semibold" size:28]} range:NSMakeRange(0, upNumberStr.length)];
    _downLabel.attributedText = mStr;
}

@end
