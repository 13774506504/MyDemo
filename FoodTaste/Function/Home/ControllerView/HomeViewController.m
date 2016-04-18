//
//  HomeViewController.m
//  FoodTaste
//
//  Created by shown on 16/3/28.
//  Copyright © 2016年 刘朝涛. All rights reserved.
//  首页

#import "HomeViewController.h"
#import "HomeTableView.h"
#import "LabelCollectionView.h"
#import "FootDetailViewController.h"
#import "AppDelegate.h"
#import "DMAdView.h"


@interface HomeViewController ()<UITextFieldDelegate, DMAdViewDelegate>
{
    NSInteger page;
    NSString *cid;
    NSString *menu; //菜名
    
    DMAdView *_dmAdView;
}

@property (nonatomic, strong) UIBarButtonItem *leftBtn;

@property (nonatomic, strong) UIBarButtonItem *rightBtn;

@property (nonatomic, strong) HomeTableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) LabelCollectionView *labelCollectionView;

@property (nonatomic, strong) NSMutableArray *labArr;

@property (nonatomic, assign) BOOL isLabOpen;

@property (nonatomic, strong) UIView *bgView;

@end

@implementation HomeViewController

- (void)dealloc
{
    _dmAdView.delegate = nil;
    _dmAdView.rootViewController = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     
    [self initView];
}

- (void)initView
{
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    imageView.image = [UIImage imageNamed:@"home_bg.jpg"];
    imageView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:imageView];
        
    self.navigationItem.leftBarButtonItem = self.leftBtn;
    self.navigationItem.rightBarButtonItem = self.rightBtn;
//    [self.navigationController.navigationBar addSubview:self.textField];
    self.navigationItem.titleView = self.textField;
    
    [self.view addSubview:self.tableView];
    
    [self.view addSubview:self.labelCollectionView];
    [self initData];
    
    [self.view addSubview:self.bgView];
    
    [self initAMAdView];
}

/**
 *  初始化多盟广告
 */
- (void)initAMAdView
{
//    56OJ2Xw4uNx8hFmtBA
    // 创建广告视图
    _dmAdView = [[DMAdView alloc] initWithPublisherId:@"56OJ2Xw4uNx8hFmtBA" placementId:@"16TLP2WlAp94PNUUWzWo2Bgz"];
    
    // 设置广告视图的位置
    _dmAdView.frame = CGRectMake(0, SCREEN_HEIGHT - 50, FLEXIBLE_SIZE.width, FLEXIBLE_SIZE.height);
    _dmAdView.delegate = self;  //设置代理
    _dmAdView.rootViewController = self;    // 设置 RootViewController
    [self.view addSubview:_dmAdView];
    [_dmAdView loadAd]; //加载广告
}

/**
 *  初始化网络数据
 */
- (void)initData
{
    page = 0;
    cid = @"1";
    
    NSMutableArray *dataArr = [CTCache getCache:@"dataArr"];
    if (dataArr.count > 0)
    {
        self.dataArr = dataArr;
        [self refreshTableView:dataArr];
    }
    else
    {
        [self requestFoodMenu];
    }
    
    
    NSMutableArray *arr = [CTCache getCache:@"labArr"];
    if (arr.count > 0)
    {
        self.labArr = [NSMutableArray arrayWithArray:arr];
        [self refreshLabel:arr];
    }
    else
    {
        [self requestLabel];
    }
}

/**
 *  刷新列表标签
 */
- (void)refreshLabel:(NSMutableArray *)arr
{
    _labelCollectionView.dataArr = arr;
    [_labelCollectionView reloadData];
}

/**
 *  刷新tableview
 *
 *  @param arr
 */
- (void)refreshTableView:(NSMutableArray *)arr
{
    _tableView.dataArr = _dataArr;
    [_tableView reloadData];
}

/**
 *  分类标签列表
 */
- (void)requestLabel
{
    NSDictionary *tempDict = @{@"key":AppKey};
    [HomeModel requestLabel:Food_category IP:FoodIP Param:tempDict Success:^(id json) {
        
        self.labArr = json;
        [self refreshLabel:_labArr];
        [CTCache setCache:_labArr FileName:@"labArr"];  //缓存
        
    } Fail:^(id error) {
        
    }];
}

/**
 *  按标签检索菜谱
 */
- (void)requestFoodMenu
{
    NSDictionary *tempDict = @{@"key":AppKey, @"cid":[NSString stringWithFormat:@"%@",cid], @"pn":[NSString stringWithFormat:@"%zi",page]};
    [HomeModel requestFoodMenu:Food_index IP:FoodIP Param:tempDict Success:^(id json) {
        if (page == 0)
        {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:json];
        
        [self refreshTableView:self.dataArr];
        
        [CTCache setCache:self.dataArr FileName:@"dataArr"];    //缓存
        
        [self endRefresh];
    } Fail:^(id error) {
        [self endRefresh];
    }];
}

/**
 *  按菜名获取菜谱
 */
- (void)requestFootName
{
    NSDictionary *tempDict = @{@"key":AppKey, @"menu":[NSString stringWithFormat:@"%@",menu], @"pn":[NSString stringWithFormat:@"%zi",page]};
    [HomeModel requestFoodMenu:Food_query IP:FoodIP Param:tempDict Success:^(id json) {
        if (page == 0)
        {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:json];
        _tableView.dataArr = _dataArr;
        [_tableView reloadData];
        [self endRefresh];
    } Fail:^(id error) {
        [self endRefresh];
    }];
}

#pragma mark --- action
- (void)leftBtnAction
{
    AppDelegate *tempAppDelegate = [[UIApplication sharedApplication] delegate];
    if (tempAppDelegate.mainVC.closed) {
        [tempAppDelegate.mainVC openLeftView];
    }
    else
    {
        [tempAppDelegate.mainVC closeLeftView];
    }
}

- (void)rightBtnAction
{
    _isLabOpen = !_isLabOpen;
    if (_isLabOpen) {
        [UIView animateWithDuration:0.2 animations:^{
            _labelCollectionView.height = SCREEN_HEIGHT - STAR_Y;
        }];
    } else {
        [UIView animateWithDuration:0.2 animations:^{
            _labelCollectionView.height = 0;
        }];
    }
}

- (void)gotoOtherVC:(MenuModel *)model
{
    FootDetailViewController *vc = [[FootDetailViewController alloc] init];
    vc.model = model;
//    [self.navigationController pushViewController:vc animated:YES];
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)tapAction
{
    _bgView.hidden = YES;
    [_textField resignFirstResponder];
}

#pragma mark ---  刷新
/**
 *  下拉刷新
 */
- (void)downRefresh
{
    page = 0;
    if (menu.length > 0)
    {
        [self requestFootName];
    }
    else
    {
        [self requestFoodMenu];
    }
}
/**
 *  上拉刷新
 */
- (void)upRefresh
{
    page += 1;
    if (menu.length > 0)
    {
        [self requestFootName];
    }
    else
    {
        [self requestFoodMenu];
    }
}
/**
 *  结束下拉刷新
 */
- (void)endRefresh
{
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];

}

#pragma mark --- <DMAdViewDelegate>
// 针对Banner的横屏自适应方法
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [_dmAdView orientationChanged];
}

// 成功加载广告回调
- (void)dmAdViewSuccessToLoadAd:(DMAdView *)adView
{
    NSLog(@"成功");
}

// 加载广告失败回调
- (void)dmAdViewFailToLoadAd:(DMAdView *)adView withError:(NSError *)error
{
    NSLog(@"失败:%@",error);
}

#pragma mark --- <UITextFieldDelegate>

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    _bgView.hidden = NO;
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    if (textField.text.length <= 0)
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"请输入内容" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    }
    else
    {
        page = 0;
        menu = textField.text;
        [self requestFootName];
        textField.text = @"";
        _bgView.hidden = YES;
    }
    
    return YES;
}


#pragma mark --- getter

- (UIBarButtonItem *)leftBtn
{
    if (!_leftBtn)
    {
        _leftBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"nav_set"] style:UIBarButtonItemStylePlain target:self action:@selector(leftBtnAction)];
    }
    return _leftBtn;
}

- (UIBarButtonItem *)rightBtn
{
    if (!_rightBtn)
    {
        _rightBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu"] style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnAction)];
    }
    return _rightBtn;
}

- (HomeTableView *)tableView
{
    if (_tableView == nil)
    {
        _tableView = [[HomeTableView alloc] initWithFrame:CGRectMake(0, STAR_Y, SCREEN_WIDTH, SCREEN_HEIGHT - STAR_Y) style:UITableViewStylePlain];
        __weak typeof(self) weakSelf = self;
        _tableView.tableViewBlock = ^(MenuModel *model) {
            [weakSelf gotoOtherVC:model];
        };
        
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(downRefresh)];
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(upRefresh)];
    }
    return _tableView;
}

- (LabelCollectionView *)labelCollectionView
{
    if (!_labelCollectionView)
    {
        UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
        flow.itemSize = CGSizeMake(CTMake(78.75), CTMake(40));
        [flow setSectionInset:UIEdgeInsetsMake(0, CTMake(12), 0, CTMake(12))];
        
        _labelCollectionView = [[LabelCollectionView alloc] initWithFrame:CGRectMake(0, STAR_Y, SCREEN_WIDTH, 0) collectionViewLayout:flow];
        
        __weak typeof(self) weakSelf = self;
        _labelCollectionView.collectionBlock = ^(SubFootModel *model){
            cid = model.idStr;
            page = 0;
            menu = @"";
            [weakSelf requestFoodMenu];
            [weakSelf rightBtnAction];
        };
    }
    return _labelCollectionView;
}

- (UITextField *)textField
{
    if (!_textField)
    {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, CTMake(250), CTMake(35))];
        _textField.layer.cornerRadius = CTMake(5);
        _textField.layer.masksToBounds = YES;
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.placeholder = @"请输入关键字";
        _textField.font = [UIFont systemFontOfSize:CTMake(15)];
        _textField.returnKeyType = UIReturnKeySearch;
        _textField.delegate = self;
    }
    return _textField;
}

- (NSMutableArray *)dataArr
{
    if (!_dataArr)
    {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (UIView *)bgView
{
    if (!_bgView)
    {
        _bgView = [[UIView alloc] initWithFrame:self.view.bounds];
        _bgView.backgroundColor = [UIColor clearColor];
        _bgView.hidden = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
        [_bgView addGestureRecognizer:tap];
    }
    return _bgView;
}

@end
