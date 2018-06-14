//
//  DetailFooterView.m
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/12.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import "DetailFooterView.h"

@interface DetailFooterView()

@property(nonatomic,strong) UIButton *deleteButton;

@property(nonatomic,strong) UILabel *numberLabel;

@end
@implementation DetailFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor colorWithHexString:@"#4B4360"];
        self.layer.cornerRadius = 5;

        _numberLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _numberLabel.textColor = [UIColor whiteColor];
        _numberLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
        _numberLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_numberLabel];

        _deleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteButton.frame = CGRectMake(self.width-12, 0, 12, 12);
        [_deleteButton setBackgroundImage:[UIImage imageNamed:@"detail_close"] forState:UIControlStateNormal];
        [self addSubview:_deleteButton];
    }
    return self;
}

- (void)setNumber:(NSString *)number
{
    _number = number;
    _numberLabel.text = number;
}

@end
