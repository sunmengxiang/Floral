//
//  MJCollectionController.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/26.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJCollectionController.h"
#import "MJThemeCell.h"
#import "MJNetTools.h"
#import <MJRefresh.h>
#import "MJThemeCategory.h"
@interface MJCollectionController ()
@property (nonatomic,strong) NSArray * categoryArray;
@end

@implementation MJCollectionController

static NSString * const reuseIdentifier = @"ThemeCollectionCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // Register cell classes

    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MJThemeCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:reuseIdentifier];
    [self setUpRefresh];
    
}

- (void)setUpRefresh
{
    self.collectionView.mj_header  = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadData)];
    
    [self.collectionView.mj_header beginRefreshing];
}
- (void)loadData
{
    NSMutableDictionary * parameters = [NSMutableDictionary dictionary];
    parameters[@"action"] = @"mainList_NewVersion";
    parameters[@"currentPageIndex"] = @"0";
    parameters[@"isVideo"] = @"false";
    /** 获取首页的文章列表//需添加&currentPageIndex=0 下一页改为1 &isVideo=false */
//    NSString * const kMJThemeArticleListBody = @"mainList_NewVersion";
    
   [MJNetTools requestThemeParameters:parameters success:^(id responseObject) {
       
   
       NSDictionary * array = responseObject[@"result"][0][@"category"];
       
       MJThemeCategory * c = [[MJThemeCategory alloc] initWithDict:array];
       
       [self.collectionView.mj_header endRefreshing];
   
   } failure:^(NSError *error) {
       NSLog(@"%@",error);
   }];
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MJThemeCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    return cell;
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
