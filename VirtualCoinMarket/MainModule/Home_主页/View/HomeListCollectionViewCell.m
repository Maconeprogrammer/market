//
//  HomeListCollectionViewCell.m
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/11.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import "HomeListCollectionViewCell.h"
#import "HomeListCellContentView.h"
#import "GraphView.h"

@interface HomeListCollectionViewCell()

@property(nonatomic,strong) UIView *bgView;

/**  名称 */
@property(nonatomic,strong) UILabel *priceLimitLabel;
@property(nonatomic,strong) UIImageView *priceLimitImageView;
@property(nonatomic,strong) UIImageView *stateImageView;
@property(nonatomic,strong) UILabel *rmbLabel;
@property(nonatomic,strong) UILabel *dolloarLabel;
@property(nonatomic,strong) UIView *lineView;
/**  换手率 */
@property(nonatomic,strong) HomeListCellContentView *rateContentView;
/**  交易额 */
@property(nonatomic,strong) HomeListCellContentView *turnoverContentView;
/**  记录点数 */
@property(nonatomic,strong) HomeListCellContentView *historyContentView;
/**  发行时间 */
@property(nonatomic,strong) HomeListCellContentView *issueDateContentView;
/**  图表 */
@property(nonatomic,strong) GraphView *graphView;

@end

@implementation HomeListCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        self.backgroundColor = [UIColor colorWithHexString:@"#363647"];
        self.clipsToBounds = YES;
        self.backgroundView = [[UIView alloc] initWithFrame:self.bounds];
        self.backgroundView.layer.cornerRadius = 5;
        self.backgroundView.backgroundColor = [UIColor colorWithHexString:@"#363647"];

        [self setupTopView];
    }
    return self;
}

- (void)setupTopView
{
    _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, self.backgroundView.width/2-10, 30)];
    _nameLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18];
    _nameLabel.textColor = [UIColor whiteColor];
    _nameLabel.backgroundColor = [UIColor colorWithHexString:@"#363647"];
    [self.backgroundView addSubview:_nameLabel];

    _rmbLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.backgroundView.width/2, 10, self.backgroundView.width/2-17, 30)];
    _rmbLabel.backgroundColor = [UIColor colorWithHexString:@"#363647"];
    _rmbLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    _rmbLabel.textAlignment = NSTextAlignmentRight;
    _rmbLabel.textColor = [UIColor whiteColor];
    [self.backgroundView addSubview:_rmbLabel];

    _priceLimitImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 40+(30-12)/2, 37, 12)];
    [self addSubview:_priceLimitImageView];

    _priceLimitLabel = [[UILabel alloc] initWithFrame:_priceLimitImageView.bounds];
    _priceLimitLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:8];
    _priceLimitLabel.textAlignment = NSTextAlignmentCenter;
    _priceLimitLabel.textColor = [UIColor whiteColor];
    [_priceLimitImageView addSubview:_priceLimitLabel];

    _stateImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_priceLimitImageView.right+8, _priceLimitImageView.top, 10, 12)];
    [self.backgroundView addSubview:_stateImageView];

    _dolloarLabel = [[UILabel alloc] initWithFrame:CGRectMake(_rmbLabel.left, _rmbLabel.bottom, _rmbLabel.width, _rmbLabel.height)];
    _dolloarLabel.backgroundColor = [UIColor colorWithHexString:@"#363647"];
    _dolloarLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    _dolloarLabel.textAlignment = NSTextAlignmentRight;
    _dolloarLabel.textColor = [UIColor whiteColor];
    [self.backgroundView addSubview:_dolloarLabel];

    _lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 80,self.backgroundView.width, 1)];
    _lineView.backgroundColor = [UIColor colorWithHexString:@"49495C"];
    [self.backgroundView addSubview:_lineView];

    [self makeContentUI];
}

- (void)makeContentUI
{
    _rateContentView = [[HomeListCellContentView alloc] initWithFrame:CGRectMake(10, 0, self.backgroundView.width-20, 30)];
    _turnoverContentView = [[HomeListCellContentView alloc] initWithFrame:CGRectMake(10, 0, self.backgroundView.width-20, 30)];
    _historyContentView = [[HomeListCellContentView alloc] initWithFrame:CGRectMake(10, 0, self.backgroundView.width-20, 30)];
    _issueDateContentView = [[HomeListCellContentView alloc] initWithFrame:CGRectMake(10, 0, self.backgroundView.width-20, 30)];
    [self.backgroundView addSubview:_rateContentView];
    [self.backgroundView addSubview:_turnoverContentView];
    [self.backgroundView addSubview:_historyContentView];
    [self.backgroundView addSubview:_issueDateContentView];
}

- (void)setModel:(HomeListModel *)model
{
    _nameLabel.text = model.name;
    _priceLimitLabel.text = model.priceLimit;
    _rmbLabel.text = [NSString stringWithFormat:@"￥%@",model.rmb];
    _dolloarLabel.text = [NSString stringWithFormat:@"$%@",model.dolloar];
    _stateImageView.image = model.ifUp ? [UIImage imageNamed:@"number_up"] :[UIImage imageNamed:@"number_down"] ;
    _priceLimitImageView.image = model.ifUp ?[UIImage imageNamed:@"number_up_bg"]:[UIImage imageNamed:@"number_down_bg"];
    _rmbLabel.hidden = ([model.rmb isEqual:@0]) ? YES :NO;
    _dolloarLabel.hidden = ([model.dolloar isEqual:@0]) ? YES :NO;

    _rateContentView.hidden     = model.showDayRate ? NO:YES;
    _turnoverContentView.hidden = model.showTurnover ? NO:YES;
    _historyContentView.hidden  = model.showHistory ? NO:YES;
    _issueDateContentView.hidden= model.showIssueDate ? NO:YES;
    _graphView.hidden           = model.showGraph ?NO:YES;


    _rateContentView.top = 80;
    _rateContentView.height = (model.showDayRate) ? 30 :0;
    _rateContentView.title = @"换手率";
    _rateContentView.content = model.dayRate;

    _turnoverContentView.top = _rateContentView.bottom;
    _turnoverContentView.height = (model.showTurnover) ? 30 :0;
    _turnoverContentView.title = @"交易额";
    _turnoverContentView.content = model.turnover;

    _historyContentView.top = _turnoverContentView.bottom;
    _historyContentView.height = (model.showHistory) ? 60 :0;
    _historyContentView.ifPoint = YES;
    _historyContentView.content = model.pointLocationHistory;

    _issueDateContentView.top = _historyContentView.bottom;
    _issueDateContentView.height = (model.showIssueDate) ? 30 :0;
    _issueDateContentView.title = @"发行时间";
    _issueDateContentView.content = model.issueDate;

    if(model.showGraph)
    {
        [_graphView removeFromSuperview];
        _graphView = [[GraphView alloc] initWithFrame:CGRectMake(0, 0, self.backgroundView.width, 150)];
        if(model.ifUp)
        {
            self.graphView.startLineColor = [UIColor colorWithHexString:@"#FFB18E" andAlpha:1.0];
            self.graphView.endLineColor   = [UIColor colorWithHexString:@"#D46EA1" andAlpha:1.0];
            self.graphView.endBgColor   = [UIColor colorWithHexString:@"#57496F" andAlpha:0.5];
            self.graphView.startBgColor   = [UIColor colorWithHexString:@"#5C576E" andAlpha:0];
        }else{
            self.graphView.endLineColor = [UIColor colorWithHexString:@"#2BE96C" andAlpha:1.0];
            self.graphView.startLineColor   = [UIColor colorWithHexString:@"#ABED25" andAlpha:1.0];
            self.graphView.startBgColor   = [UIColor colorWithHexString:@"#516459" andAlpha:0.5];
            self.graphView.endBgColor   = [UIColor colorWithHexString:@"#376062" andAlpha:0];
        }
        _graphView.top = _issueDateContentView.bottom;
        _graphView.height = (model.showGraph) ? 150 :0;
        [self.backgroundView addSubview:_graphView];
        _graphView.yArrays = @[@"4800",@"4500",@"4200",@"3900",@"3600"];
        _graphView.startTime = @"05-25";
        _graphView.endTime = @"05-31";
        _graphView.ifXY = NO;
        NSArray *graphViewArray = model.curveGraph;
        if(graphViewArray.count)
        {
            NSDictionary *dict = graphViewArray[0];
            NSString * fiveMinString = dict[@"5min"];
            self.graphView.points = [[fiveMinString componentsSeparatedByString:@" "] subarrayWithRange:NSMakeRange(0, [fiveMinString componentsSeparatedByString:@" "].count/24)];
        }
    }
}


@end
