//
//  DetailTopView.m
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/12.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import "DetailTopView.h"

@interface DetailTopView()

@property(nonatomic,strong) UILabel *titleLabel;

@property(nonatomic,strong) UIImageView *centerImageView;

@property(nonatomic,strong) UILabel *rmbLabel;

@property(nonatomic,strong) UILabel *dolloarLabel;

@property(nonatomic,strong) UIImageView *priceLimitImageView;

@property(nonatomic,strong) UILabel *priceLimitLabel;

@property(nonatomic,strong) UIImageView *stateImageView;

@property(nonatomic,strong) UIView *line;


@end
@implementation DetailTopView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor colorWithHexString:@"#242534"];
        UIView *underBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 90, self.width, self.height-90)];
        underBgView.backgroundColor = [UIColor colorWithRed:37.0/255.0 green:39.0/255.0 blue:54.0/255.0 alpha:1];
        [self addSubview:underBgView];

        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.width-100)/2, 20, 100, 50)];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        [self addSubview:_titleLabel];

        self.centerImageView = [[UIImageView alloc] initWithFrame:CGRectMake((self.width-70)/2, 90-20, 70, 70)];
        self.centerImageView.image = [UIImage imageNamed:@"Group 7"];
        [self addSubview:self.centerImageView];

        [self setupBaseUI];
    }
    return self;
}

- (void)setupBaseUI
{
    _rmbLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.centerImageView.bottom+10, self.width, 40)];
    _rmbLabel.textColor = [UIColor whiteColor];
    _rmbLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:25];
    _rmbLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_rmbLabel];

    _dolloarLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.rmbLabel.bottom, self.width, 30)];
    _dolloarLabel.textColor = [UIColor whiteColor];
    _dolloarLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:18];
    _dolloarLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:_dolloarLabel];

    _priceLimitImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40+(30-12)/2, 37, 12)];
    [self addSubview:_priceLimitImageView];

    _priceLimitLabel = [[UILabel alloc] initWithFrame:_priceLimitImageView.bounds];
    _priceLimitLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:8];
    _priceLimitLabel.textAlignment = NSTextAlignmentCenter;
    _priceLimitLabel.textColor = [UIColor whiteColor];
    [_priceLimitImageView addSubview:_priceLimitLabel];

    _stateImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_priceLimitImageView.right+8, _priceLimitImageView.top, 10, 12)];
    [self addSubview:_stateImageView];

    _line = [[UIView alloc] initWithFrame:CGRectMake(15, self.height-1, self.width-30, 1)];
    _line.backgroundColor = [UIColor colorWithHexString:@"9e9ec1"];
    [self addSubview:_line];
}

- (void)refresh:(HomeListModel *)model
{
    _titleLabel.text = model.name;
    _rmbLabel.text = [NSString stringWithFormat:@"￥ %@",model.rmb];
    _dolloarLabel.text = [NSString stringWithFormat:@"$%@",model.dolloar];
    _stateImageView.image = model.ifUp ? [UIImage imageNamed:@"number_up"] :[UIImage imageNamed:@"number_down"] ;
    _priceLimitImageView.image = model.ifUp ?[UIImage imageNamed:@"number_up_bg"]:[UIImage imageNamed:@"number_down_bg"];
    _priceLimitLabel.text = model.priceLimit;

    [self configDetailUI];
}

- (void)configDetailUI
{
    CGFloat width = [FeatureTools getContentSizeWithFont:_rmbLabel.font withContentWidth:_rmbLabel.width withContent:_rmbLabel.text withLineSpace:1 withHeightSpace:1].width;
    _rmbLabel.width = width;
    _rmbLabel.left = (self.width - width)/2;
    _priceLimitImageView.left = _rmbLabel.right +10;
    _priceLimitImageView.top = _rmbLabel.top + (_rmbLabel.height - _priceLimitImageView.height )/2;
    _stateImageView.top = _priceLimitImageView.top;
    _stateImageView.left = _priceLimitImageView.right +5;
}

@end
