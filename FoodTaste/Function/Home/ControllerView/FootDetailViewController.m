//
//  FootDetailViewController.m
//  FoodTaste
//
//  Created by shown on 16/3/29.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//  菜谱详情

#import "FootDetailViewController.h"
#import "FootDetailHeadView.h"
#import "FootDetailTableView.h"
#import "DMInterstitialAdController.h"

//#define DMPUBLISHERID        @"56OJyM1ouMGoULfJaL"
//#define DMPLCAEMENTID_INTER @"16TLwebvAchkAY6iOWkE6kpk"
#define DMPUBLISHERID @"56OJ2Xw4uNx8hFmtBA"
#define DMPLCAEMENTID_INTER @"16TLP2WlAp94PNUUWTOjmnLk"
@interface FootDetailViewController ()<DMInterstitialAdControllerDelegate>

@property (nonatomic, strong) FootDetailHeadView *headView;

@property (nonatomic, strong) FootDetailTableView *tableView;

@property (nonatomic, strong) UIButton *btn_close;

@property (nonatomic, strong) DMInterstitialAdController *dmInterstitial;

@end

@implementation FootDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initView];
}

- (void)initView
{
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.btn_close];
    
    // 初始化插屏广告， 此处使用的是测试id
    _dmInterstitial = [[DMInterstitialAdController alloc] initWithPublisherId:@"56OJ2Xw4uNx8hFmtBA" placementId:@"16TLP2WlAp94PNUUWTOjmnLk" rootViewController:self];
    
    //设置插屏广告的 delegate
    _dmInterstitial.delegate = self;
    
    //加载一条广告
    [_dmInterstitial loadAd];
    
    if (_dmInterstitial.isReady) {
        [_dmInterstitial present];
    } else {
        [_dmInterstitial loadAd];
    }
}

#pragma mark ---广告代理

- (void)dmInterstitialDidDismissScreen:(DMInterstitialAdController *)dmInterstitial {
    //插屏广告关闭后，加载一条新的广告用于下次呈现
    [_dmInterstitial loadAd];
}

- (void)dmInterstitialSuccessToLoadAd:(DMInterstitialAdController *)dmInterstitial {
    NSLog(@"成功");
}

- (void)dmInterstitialFailToLoadAd:(DMInterstitialAdController *)dmInterstitial withError:(NSError *)err {
    NSLog(@"失败");
}

#pragma mark --- btn action
- (void)closeCurrentVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark --- getter

- (FootDetailTableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView = [[FootDetailTableView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT - 20) style:UITableViewStylePlain];
        _tableView.tableHeaderView = self.headView;
    }
    return _tableView;
}

- (FootDetailHeadView *)headView
{
    if (_headView == nil)
    {
        _headView = [[FootDetailHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0) Model:_model];
    }
    return _headView;
}

- (UIButton *)btn_close
{
    if (!_btn_close)
    {
        _btn_close = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn_close setImage:[UIImage imageNamed:@"btn_close"] forState:UIControlStateNormal];
        _btn_close.frame = CGRectMake(SCREEN_WIDTH - CTMake(36), 20 + CTMake(10), CTMake(24), CTMake(24));
        [_btn_close addTarget:self action:@selector(closeCurrentVC) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn_close;
}

@end
