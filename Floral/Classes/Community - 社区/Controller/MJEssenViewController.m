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
@interface MJEssenViewController ()
// 模型 数组
@property (nonatomic,strong) NSArray * essenceAdsArray;
@end

@implementation MJEssenViewController

static NSString * const reuseIdentifier = @"Cell";
static NSString * const reuseHeadIndentifier = @"HeaderView";
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    // 注册 headerView
    [self.collectionView registerClass:[MJHeadReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseHeadIndentifier];
    
    // 加载广告轮播图数据
    [self loadAdsData];
}


- (void)loadAdsData
{
    [MJNetTools requestCommunityAds:^(id responseObject) {
        
        NSArray * array = responseObject[@"result"];
        NSMutableArray * arrM = [NSMutableArray array];
        for (NSDictionary * dict in array) {
            MJEssencesAds * ads = [[MJEssencesAds alloc] initWithDict:dict];
            [arrM addObject:ads];
            [self.collectionView reloadData];
        }
        self.essenceAdsArray = arrM;
    } failure:^(NSError *error) {
        NSLog(@"communityAdsRequest---%@",error);
    }];
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if (indexPath.item % 3 == 0) {
        cell.backgroundColor = [UIColor redColor];
    }else if (indexPath.item % 3 == 1)
    {
        cell.backgroundColor = [UIColor greenColor];
    }else{
        cell.backgroundColor = [UIColor blueColor];
    }
    
    return cell;
}
// 创建类似 tableVieHeaderView
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        MJHeadReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseHeadIndentifier forIndexPath:indexPath];
        
        headerView.headerTitle = @"每日精选";
        headerView.adsArray = self.essenceAdsArray;
        reusableview = headerView;
    }
    
    return reusableview;
}
// 设置 headerView  size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(MJScreenW, 150);
}
#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
