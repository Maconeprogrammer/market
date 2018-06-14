//
//  DetailViewController.m
//  VirtualCoinMarket
//
//  Created by sujinxu on 2018/6/10.
//  Copyright © 2018年 SleepWalker. All rights reserved.
//

#import "DetailViewController.h"
#import <WRNavigationBar.h>
#import "DetailTableViewCell.h"
#import "XYTransitionProtocol.h"
#import "XYTransition.h"

@interface DetailViewController ()<UITableViewDelegate,UITableViewDataSource,XYTransitionProtocol>

@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) NSMutableArray *titleArray;

@property(nonatomic,strong) NSMutableArray *contentArray;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self wr_setNavBarBackgroundAlpha:1];
    [WRNavigationBar wr_setDefaultNavBarBarTintColor:[UIColor clearColor]];

    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 30, 30);
    [backButton setImage:[UIImage imageNamed:@"detail_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = leftItem;

    UIButton *editButton = [UIButton buttonWithType:UIButtonTypeCustom];
    editButton.frame = CGRectMake(0, 0, 30, 30);
    [editButton setImage:[UIImage imageNamed:@"home_edit"] forState:UIControlStateNormal];
    [editButton addTarget:self action:@selector(editAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *editItem = [[UIBarButtonItem alloc] initWithCustomView:editButton];

    UIButton *storeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    storeButton.frame = CGRectMake(0, 0, 30, 30);
    [storeButton setBackgroundImage:[UIImage imageNamed:@"detail_collect"] forState:UIControlStateNormal];
    [storeButton addTarget:self action:@selector(storeAction) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *storeItem = [[UIBarButtonItem alloc] initWithCustomView:storeButton];

    self.navigationItem.rightBarButtonItems = @[editItem,storeItem];

    [self setupUI];
}

- (void)loadData
{
    self.titleArray = [NSMutableArray arrayWithArray:@[@"24H换手率",@"流通量",@"发行时间",@"官网"]];
    self.contentArray = [NSMutableArray arrayWithArray:@[self.model.dayRate,self.model.turnover,self.model.issueDate,self.model.officialWebsite]];
    [self.tableView reloadData];
}

- (void)setupUI
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.tableView.top = -64;
    self.tableView.height += 64;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor clearColor];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.bounces = YES;
    [self.view addSubview:self.tableView];

    self.dtopView = [[DetailTopView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 270)];
    self.tableView.tableHeaderView = self.dtopView;
    [self.dtopView refresh:_model];

    self.sectionView = [[DetailSectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 580)];
    self.sectionView.model = self.model;
    self.tableView.tableFooterView = self.sectionView;

    [self loadData];
}
- (void)backClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)editAction
{

}
- (void)storeAction
{
    
}

#pragma mark - UITableViewDelegate/UITableViewDatasource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if(!cell)
    {
        cell = [[DetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ID"];
    }
    [cell refresh:self.titleArray[indexPath.row] andTitle:self.contentArray[indexPath.row]];
    return cell;
}

#pragma mark - XYTransitionProtocol

-(UIView *)targetTransitionView{
    return self.dtopView;
}
-(BOOL)isNeedTransition{
    return _isTransition;
}

@end
