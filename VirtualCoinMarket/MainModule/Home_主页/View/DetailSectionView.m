//
//  DetailSectionView.m
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/12.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import "DetailSectionView.h"
#import "DetailFooterView.h"
#import "GraphView.h"

@interface DetailSectionView()

@property(nonatomic,copy) NSString *fiveMinString;
@property(nonatomic,copy) NSString *fifteenMinString;
@property(nonatomic,copy) NSString *oneHourString;
@property(nonatomic,copy) NSString *twoHourString;

@property(nonatomic,strong) GraphView *graph;

@end
@implementation DetailSectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor clearColor];
        UISegmentedControl *segment = [[UISegmentedControl alloc] initWithFrame:CGRectMake(15, 20, self.width-30, 40)];
        [segment insertSegmentWithTitle:@"5min" atIndex:0 animated:YES];
        [segment insertSegmentWithTitle:@"15min" atIndex:1 animated:YES];
        [segment insertSegmentWithTitle:@"1h" atIndex:2 animated:YES];
        [segment insertSegmentWithTitle:@"2h" atIndex:3 animated:YES];
        segment.backgroundColor = [UIColor clearColor];
        segment.tintColor = [UIColor colorWithHexString:@"#D772A0"];
        [segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
        segment.selectedSegmentIndex = 0;
        [self addSubview:segment];

        UIView *_line = [[UIView alloc] initWithFrame:CGRectMake(15, 329.5, kScreenWidth-30, 0.5)];
        _line.backgroundColor = [UIColor colorWithHexString:@"888993"];
        [self addSubview:_line];

        [self makeUI];
    }
    return self;
}

- (void)makeUI
{
    UILabel *historyLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 330+20, self.width-70, 30)];
    historyLabel.text = @"点位记录";
    historyLabel.textColor = [UIColor colorWithHexString:@"888993"];
    [self addSubview:historyLabel];

    UIButton *addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    addButton.frame = CGRectMake(historyLabel.right, historyLabel.top, 30, 30);
    [addButton setBackgroundImage:[UIImage imageNamed:@"detail_add"] forState:UIControlStateNormal];
    [self addSubview:addButton];


    self.graph = [[GraphView alloc] initWithFrame:CGRectMake(15, 60, self.width-30, 270)];
    self.graph.yArrays = @[@"4800",@"4500",@"4200",@"3900",@"3600"];
    self.graph.startTime = @"05-25";
    self.graph.endTime = @"05-31";
    [self addSubview:self.graph];
}

- (void)setModel:(HomeListModel *)model
{
    _model = model;
    NSArray *array = [model.pointLocationHistory componentsSeparatedByString:@","];
    CGFloat width = (self.width-30 - 20 - 30)/3;
    CGFloat height = width/3;

    for(int i=0;i<array.count;i++)
    {
        DetailFooterView *dfview = [[DetailFooterView alloc] initWithFrame:CGRectMake(15+(i%3)*(width+10), 400+(i/3)*(height+10), width, height)];
        dfview.number = array[i];
        [self addSubview:dfview];
    }

    NSArray *graphArray = model.curveGraph;
    if(graphArray.count)
    {
        NSDictionary *dict = graphArray[0];
        _fiveMinString = dict[@"5min"];
        _fifteenMinString = dict[@"15min"];
        _oneHourString = dict[@"1h"];
        _twoHourString = dict[@"2h"];
    }
}

- (void)segmentAction:(UISegmentedControl *)control
{
    if(self.model.ifUp)
    {
        self.graph.startLineColor = [UIColor colorWithHexString:@"#FFB18E" andAlpha:1.0];
        self.graph.endLineColor   = [UIColor colorWithHexString:@"#D46EA1" andAlpha:1.0];
        self.graph.endBgColor   = [UIColor colorWithHexString:@"#57496F" andAlpha:0.5];
        self.graph.startBgColor   = [UIColor colorWithHexString:@"#5C576E" andAlpha:0];
    }else{
        self.graph.endLineColor = [UIColor colorWithHexString:@"#2BE96C" andAlpha:1.0];
        self.graph.startLineColor   = [UIColor colorWithHexString:@"#ABED25" andAlpha:1.0];
        self.graph.startBgColor   = [UIColor colorWithHexString:@"#516459" andAlpha:0.5];
        self.graph.endBgColor   = [UIColor colorWithHexString:@"#376062" andAlpha:0];
    }
    switch (control.selectedSegmentIndex) {
        case 0:
            {
                if(_fiveMinString)
                {
                    self.graph.points = [_fiveMinString componentsSeparatedByString:@" "];
                }
            }
            break;
        case 1:
        {
            if(_fifteenMinString)
            {
                self.graph.points = [[_fiveMinString componentsSeparatedByString:@" "] subarrayWithRange:NSMakeRange(0, [_fiveMinString componentsSeparatedByString:@" "].count/3)];
            }
        }
            break;
        case 2:
        {
            if(_oneHourString)
            {
                self.graph.points = [[_fiveMinString componentsSeparatedByString:@" "] subarrayWithRange:NSMakeRange(0, [_fiveMinString componentsSeparatedByString:@" "].count/12)];
            }
        }
            break;
        case 3:
        {
            if(_twoHourString)
            {
                self.graph.points = [[_fiveMinString componentsSeparatedByString:@" "] subarrayWithRange:NSMakeRange(0, [_fiveMinString componentsSeparatedByString:@" "].count/24)];
            }
        }
            break;

        default:
            break;
    }
}

@end
