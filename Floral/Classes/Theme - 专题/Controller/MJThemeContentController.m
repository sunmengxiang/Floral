//
//  MJThemeContentController.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/30.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJThemeContentController.h"
#import "MJThemeCell.h"
#import "MJThemeSmallCell.h"
#import "MJNetTools.h"
#import <MJRefresh.h>
#import "MJThemeCategory.h"
#import "MJTheme.h"
#import "MJPerson.h"
#import "MJArticleViewController.h"
#import <Masonry.h>


typedef NS_ENUM(NSInteger,MJPushFromControllStyle) {
    MJPushFromControllStyleMain = 0,
    MJPushFromControllStyleCategory
};
@interface MJThemeContentController ()<UICollectionViewDataSource,UICollectionViewDelegate>
// 存放模型的数组
@property (nonatomic,strong) NSMutableArray * artitleListArray;
// 记录大小布局
@property (nonatomic,assign) BOOL isSmallLayout;
// 记录当前加载的页数
@property (assign,nonatomic) NSInteger currentPage;
// 显示的 collectioView
@property (weak,nonatomic) UICollectionView * collectionView;
// collectionView 的布局
@property (weak,nonatomic) UICollectionViewFlowLayout * layout;
// 记录是从那个地方 push 过来的
@property (assign,nonatomic) MJPushFromControllStyle pushFromStyle;
@property (weak,nonatomic) UIButton * categoryVcRightBtn;
@end

@implementation MJThemeContentController
static NSString * const bigThemeCellID = @"bigThemeCell";
static NSString * const smallThemeCellID = @"smallThemeCell";
#pragma mark - 懒加载
- (NSMutableArray *)artitleListArray
{
    if (_artitleListArray == nil) {
        _artitleListArray = [NSMutableArray array];
    }
    return _artitleListArray;
}
- (void)setCategoryFromCategoryVc:(MJThemeCategory *)categoryFromCategoryVc
{
    _categoryFromCategoryVc = categoryFromCategoryVc;
    self.pushFromStyle = MJPushFromControllStyleCategory;
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"宫格"] highlightImage:[UIImage imageNamed:@"列表"] target:self selector:@selector(changeLayout)];
    [self setTitle:categoryFromCategoryVc.name];
    
    self.categoryVcRightBtn = (UIButton *)self.navigationItem.rightBarButtonItem.customView;
}
// 在 categoryVc 点击 item 后跳转的控制器，点击了左侧更换布局按钮，在这里更换布局
- (void)changeLayout
{
    self.categoryVcRightBtn.selected = !self.categoryVcRightBtn.selected;
    self.isSmallLayout = self.categoryVcRightBtn.selected;
    if (self.artitleListArray) {  // 已经加载到网络数据，设置尺寸
        MJTheme * theme = self.artitleListArray[0];
        self.layout.itemSize = self.isSmallLayout?theme.smallItemSize:theme.bigItemSize;
    }else{
        return;
    }
    // 更新 collectionView
    [self.collectionView reloadData];
}
#pragma mark - 初始设置
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpCollectionView];
    self.view.backgroundColor = [UIColor colorWithRed:244/255.0 green:244/255.0 blue:244/255.0 alpha:1];
    self.collectionView.backgroundColor = [UIColor clearColor];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"MJThemeCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:bigThemeCellID];
    [self.collectionView registerNib:[UINib nibWithNibName:@"MJThemeSmallCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:smallThemeCellID];
    // 注册观察者,观察布局的改变按钮是否点击
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeCell:) name:@"NotificationLayoutChange" object:nil];
    [self setUpRefresh];
    
}
// 在这里设置子控件会更准确
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    if (self.pushFromStyle == MJPushFromControllStyleCategory) {
        UIEdgeInsets insets = UIEdgeInsetsMake(10, 10, 0, 10);
        [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view).with.insets(insets);
        }];
    }
    self.collectionView.frame = self.view.bounds;
}
- (void)setUpRefresh
{
    self.collectionView.mj_header  = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    // 刷新完成之后，自动隐藏 header 刷新控件
    self.collectionView.mj_header.automaticallyChangeAlpha = YES;
    [self.collectionView.mj_header beginRefreshing];
    
    self.collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}
// 接收到通知后调用的方法
- (void)changeCell:(NSNotification *)notification
{
    self.isSmallLayout = ((UIButton *)notification.object).selected;
    if (self.artitleListArray) {  // 已经加载到网络数据，设置尺寸
        MJTheme * theme = self.artitleListArray[0];
        self.layout.itemSize = self.isSmallLayout?theme.smallItemSize:theme.bigItemSize;
    }else{
        return;
    }
    // 更新 collectionView
    [self.collectionView reloadData];
}
// 返回 layout的 itemSize,这里只在 viewDidLoad 中调用一次
- (CGSize)LayoutItemSize
{
    CGSize defaultSize = CGSizeMake(MJScreenW, 150); // 因为 layout 不能被设置为0，所以随便设了一个 size
    if (self.artitleListArray.count == 0) {
        return defaultSize;
    }
    MJTheme * theme = self.artitleListArray[0];
    if (!self.isSmallLayout) {
        return theme.bigItemSize;
    }else{
        return theme.smallItemSize;
    }
}
#pragma mark - 设置 collectionView
- (void)setUpCollectionView
{
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc] init];
    self.layout = layout;
    layout.itemSize = [self LayoutItemSize];
    layout.minimumLineSpacing = self.isSmallLayout? 5:10;
    layout.minimumInteritemSpacing = 5;
    UICollectionView * collectionV = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    collectionV.delegate = self;
    collectionV.dataSource = self;
    [self.view addSubview:collectionV];
    self.collectionView = collectionV;
}
# pragma mark - 发送请求,加载数据
- (void)loadNewData
{
    self.currentPage = 0;
    [self.collectionView.mj_footer endRefreshing];
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    parameters[@"action"] = @"mainList_NewVersion";
    parameters[@"currentPageIndex"] = @"0";
    if (self.pushFromStyle == MJPushFromControllStyleCategory) {
        parameters[@"cateId"] = self.categoryFromCategoryVc.ID;
    }else{
    parameters[@"isVideo"] = @"false";
    }
    [MJNetTools requestThemeParameters:parameters success:^(id responseObject) {
        
        NSArray * array = responseObject[@"result"];
        NSMutableArray * arrM = [NSMutableArray array];
       for (NSDictionary *dict in array) {
           MJTheme * theme = [[MJTheme alloc] initWithDict:dict];
           [arrM addObject:theme];
        }
        self.artitleListArray = arrM;
        
        MJTheme * theme = self.artitleListArray[0];
        self.layout.itemSize = self.isSmallLayout?theme.smallItemSize:theme.bigItemSize;
        
        [self.collectionView reloadData];
        
        [self.collectionView.mj_header endRefreshing];
        
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
        [self.collectionView.mj_header endRefreshing];
    }];
}
- (void)loadMoreData
{
    [self.collectionView.mj_header endRefreshing];
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    parameters[@"action"] = @"mainList_NewVersion";
    parameters[@"currentPageIndex"] = @(self.currentPage + 1);
    if (self.pushFromStyle == MJPushFromControllStyleCategory) {
        parameters[@"cateId"] = self.categoryFromCategoryVc.ID;
    }else{
        parameters[@"isVideo"] = @"false";
    }
    
    [MJNetTools requestThemeParameters:parameters success:^(id responseObject) {
        
        NSArray * array = responseObject[@"result"];
        NSMutableArray * arrM = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            MJTheme * theme = [[MJTheme alloc] initWithDict:dict];
            [arrM addObject:theme];
        }
        [self.artitleListArray addObjectsFromArray:arrM];
        
        [self.collectionView reloadData];
        
        self.currentPage++;
        [self.collectionView.mj_footer endRefreshing];
    } failure:^(NSError *error) {
  
        NSLog(@"%@",error);
        [self.collectionView.mj_header endRefreshing];
    }];
    
}
#pragma mark -<UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.artitleListArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.isSmallLayout) {
        MJThemeCell * cell = [MJThemeCell cellWithCollectionView:collectionView cellIdentifier:bigThemeCellID indexPath:indexPath];
        cell.theme = self.artitleListArray[indexPath.item];
        return cell;
    }else{
        MJThemeSmallCell * cell = [MJThemeSmallCell cellWithCollectionView:collectionView cellIdentifier:smallThemeCellID indexPath:indexPath];
        
        cell.theme = self.artitleListArray[indexPath.item];
        return cell;
    }
    
}
#pragma mark - <UICollectionDelegate>
// 跳转到文章控制器页面
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    MJArticleViewController * articleVc = [[MJArticleViewController alloc] init];
    articleVc.theme = self.artitleListArray[indexPath.item];
    [self.navigationController pushViewController:articleVc animated:YES];
}
@end
