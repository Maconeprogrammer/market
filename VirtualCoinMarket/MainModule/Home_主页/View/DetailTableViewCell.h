//
//  DetailTableViewCell.h
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/12.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface DetailTableViewCell : UITableViewCell

- (void)refresh:(NSString *)title
       andTitle:(NSString *)content;


@end
