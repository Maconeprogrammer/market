//
//  HomeListCellContentView.m
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/12.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import "HomeListCellContentView.h"

@interface HomeListCellContentView()

@property(nonatomic,strong) UILabel *titleLabel;

@property(nonatomic,strong) UILabel *contentLabel;

@end

@implementation HomeListCellContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.width/2, self.height)];
        _titleLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _titleLabel.textColor = [UIColor colorWithHexString:@"888993"];
        [self addSubview:_titleLabel];

        _contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.width/2, 0, self.width/2, self.height)];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
        _contentLabel.textColor = [UIColor colorWithHexString:@"888993"];
        _contentLabel.textAlignment = NSTextAlignmentRight;
        [self addSubview:_contentLabel];

        self.clipsToBounds = YES;
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    _titleLabel.text = title;
}

- (void)setIfPoint:(BOOL)ifPoint
{
    _ifPoint = ifPoint;
    if(ifPoint)
    {
        _contentLabel.left = 0;
        _contentLabel.top = 0;
        _contentLabel.width = self.width;
        _contentLabel.height = self.height;
    }

}

- (void)setContent:(NSString *)content
{
    _content = content;
    if(self.ifPoint)
    {
        NSArray *arr = [content componentsSeparatedByString:@","];

        NSString *str = [arr componentsJoinedByString:@" "];
        _contentLabel.text = str;
    }else{
        _contentLabel.text = content;
    }
}
@end
