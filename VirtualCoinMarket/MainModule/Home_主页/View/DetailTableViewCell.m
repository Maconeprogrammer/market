//
//  DetailTableViewCell.m
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/12.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import "DetailTableViewCell.h"

@interface DetailTableViewCell()

@property(nonatomic,strong) UILabel *nameLabel;

@property(nonatomic,strong) UILabel *contentLabel;

@end
@implementation DetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
        [self confgiUI];
    }
    return self;
}

- (void)confgiUI
{
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, kScreenWidth/2-15, 70)];
    _nameLabel.textColor = [UIColor colorWithHexString:@"#888993"];
    _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
    [self addSubview:_nameLabel];

    _contentLabel  = [[UILabel alloc] initWithFrame:CGRectMake(_nameLabel.right, 0, kScreenWidth/2-15, 70)];
    _contentLabel.textColor = [UIColor colorWithHexString:@"#888993"];
    _contentLabel.font = [UIFont fontWithName:@"PingFangSC-Light" size:15];
    _contentLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:_contentLabel];

    UIView *_line = [[UIView alloc] initWithFrame:CGRectMake(15, 69.5, kScreenWidth-30, 0.5)];
    _line.backgroundColor = [UIColor colorWithHexString:@"888993"];
    [self addSubview:_line];
}

- (void)refresh:(NSString *)title
       andTitle:(NSString *)content
{
    _nameLabel.text = title;
    _contentLabel.text = content;
}

@end
