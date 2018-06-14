//
//  HomeListModel.h
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/11.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HomeListModel : NSObject

@property(nonatomic,assign) float height;
/**  名字 */
@property(nonatomic,copy) NSString *name;
/**  涨跌幅 */
@property(nonatomic,copy) NSString *priceLimit;
/**  美元价格 */
@property(nonatomic,copy) NSNumber *dolloar;
/**  人民币价格 */
@property(nonatomic,copy) NSNumber *rmb;
/**  24小时换手率 */
@property(nonatomic,copy) NSString *dayRate;
/**  流通量 */
@property(nonatomic,copy) NSString *turnover;
/**  发行时间 */
@property(nonatomic,copy) NSString *issueDate;
/**  官网 */
@property(nonatomic,copy) NSString *officialWebsite;
/**  曲线图点数组 */
@property(nonatomic,copy) NSArray *curveGraph;
/**  点位记录 */
@property(nonatomic,copy) NSString *pointLocationHistory;
/**  增长或下跌 */
@property(nonatomic,assign) BOOL ifUp;
/**  是否显示美元 */
@property(nonatomic,assign) BOOL showDolloar;
/**  是否显示人民币 */
@property(nonatomic,assign) BOOL showRMB;
/**  是否显示换手率 */
@property(nonatomic,assign) BOOL showDayRate;
/**  是否显示流通量 */
@property(nonatomic,assign) BOOL showTurnover;
/**  是否显示发行时间 */
@property(nonatomic,assign) BOOL showIssueDate;
/**  是否显示官网 */
@property(nonatomic,assign) BOOL showWebsize;
/**  是否显示图表 */
@property(nonatomic,assign) BOOL showGraph;
/**  是否显示点位纪录 */
@property(nonatomic,assign) BOOL showHistory;


@end
