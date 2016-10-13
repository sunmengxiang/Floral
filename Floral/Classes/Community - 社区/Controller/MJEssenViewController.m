//
//  MJEssenViewController.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/28.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJEssenViewController.h"
#import "MJHeadReusableView.h"
#import "MJNetTools.h"
#import "MJEssencesAds.h"
#import "MJEssenceTags.h"
#import "MJEssenceTagsCell.h"

@interface MJEssenViewController ()
// 轮播图模型 数组
@property (nonatomic,strong) NSArray * essenceAdsArray;
// tag 标签模型 数组
@property (nonatomic,strong) NSArray * essenceTagsArray;
@end

@implementation MJEssenViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString * const reuseHeadIndentifier = @"HeaderView";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Register cell classes

    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MJEssenceTagsCell class]) bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    // 注册 headerView
    [self.collectionView registerClass:[MJHeadReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseHeadIndentifier];
    
    // 加载广告轮播图数据
    [self loadAdsData];
    
    [self loadTagsData];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

#pragma mark - loadData
- (void)loadAdsData
{
    [MJNetTools requestCommunityAds:^(id responseObject) {
        
        NSArray * array = responseObject[@"result"];
        NSMutableArray * arrM = [NSMutableArray array];
        for (NSDictionary * dict in array) {
            MJEssencesAds * ads = [[MJEssencesAds alloc] initWithDict:dict];
            [arrM addObject:ads];
        }
        self.essenceAdsArray = arrM;
        [self.collectionView reloadData];
    } failure:^(NSError *error) {
        NSLog(@"communityAdsRequest---%@",error);
    }];
}

- (void)loadTagsData
{
    NSMutableDictionary * parameter = [NSMutableDictionary dictionary];
    parameter[@"action"] = @"getJianOrJingList";
    parameter[@"currentPageIndex"] = @"0";
    parameter[@"pageSize"] = @"0";
    parameter[@"type"] = @"荐";
    parameter[@"userId"] = @"";
    [MJNetTools requestCommunityEssenceParameter:parameter success:^(id responseObject) {
        NSArray * array = responseObject[@"result"];
        NSLog(@"Arrary---%@",array);
        NSMutableArray * arrM = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            MJEssenceTags * tags = [[MJEssenceTags alloc] initWithDict:dict];
            [arrM addObject:tags];
        }
        self.essenceTagsArray = arrM;
        
        [self.collectionView reloadData];

    } failure:^(NSError *error) {
        
        NSLog(@"loadTagsDataError----%@",error);
    }];
}
#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.essenceTagsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MJEssenceTagsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.essenceTag = self.essenceTagsArray[indexPath.item];
    
    return cell;
}
#pragma mark - 创建类似 tableVieHeaderView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        MJHeadReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseHeadIndentifier forIndexPath:indexPath];
        
        headerView.adsArray = self.essenceAdsArray;
        headerView.headerTitle = @"每日精选";
        reusableview = headerView;
    }
    
    return reusableview;
}
// 设置 headerView  size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(MJScreenW, 220);
}


@end
