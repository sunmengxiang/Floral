//
//  MJNewFeatureViewController.m
//  Floral
//
//  Created by 孙梦翔 on 16/10/01.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJNewFeatureViewController.h"
#import "MJNewFeatureViewCell.h"
#import "MJMainTabBarController.h"
@interface MJNewFeatureViewController ()
@property (nonatomic, assign) CGFloat lastOffsetX;

@property (nonatomic, weak) UIImageView *guideView;

/** guideImage */
@property (strong ,nonatomic) NSArray * imageArray;

@property (nonatomic,assign) NSUInteger pageCount;
@end

@implementation MJNewFeatureViewController

static NSString * const reuseIdentifier = @"Cell";

- (NSArray *)imageArray
{
    if (_imageArray == nil) {
         _imageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"gp_bg_0"],[UIImage imageNamed:@"gp_bg_1"],[UIImage imageNamed:@"gp_bg_2"],nil];
        self.pageCount = _imageArray.count;
    }
    return _imageArray;
}
- (instancetype)init
{
    // 流水布局对象,设置cell的尺寸和位置
    UICollectionViewFlowLayout *layout  = [[UICollectionViewFlowLayout alloc] init];
    
    // 设置滚动的方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    // 设置cell的尺寸
    layout.itemSize = MJScreenBounds.size;
    //    // 设置cell之间间距
    layout.minimumInteritemSpacing = 0;
    //    // 设置行距
    layout.minimumLineSpacing = 0;
    //
    //    // 设置每一组的内间距
    //    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
    return  [super initWithCollectionViewLayout:layout];
}
+ (UIViewController *)show
{
    NSString *key = @"CFBundleShortVersionString";
    
    // 获得当前软件的版本号
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    // 获得沙盒中存储的版本号
    NSString *sanboxVersion = [[NSUserDefaults standardUserDefaults] stringForKey:key];
    UIViewController *rootVc = nil;
    if ([currentVersion isEqualToString:sanboxVersion]) {
        // 没有最新的版本号,进入核心界面
        // 创建窗口跟控制器
        // UITabBarController控制器的view不是懒加载，在创建控制器的时候就会加载。
        rootVc = [[MJMainTabBarController alloc] init];
        
    }else{ // 有最新的版本号，进入新特性界面,保存当前的最新版本号
        // CollectionViewVC必须在初始化的时候设置布局参数
        rootVc = [[MJNewFeatureViewController alloc] init];
        // 存储版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    return rootVc;
}
#pragma mark - UICollectionView有多少组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark - 返回第section组有多少个cell
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count;
}

#pragma mark - 返回每个cell长什么样
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    MJNewFeatureViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.image = self.imageArray[indexPath.item];
    // 告诉cell什么时候是最后一行
    [cell setUpIndexPath:indexPath count:self.pageCount];
    
    return cell;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.collectionView.bounces = NO;
    
    self.collectionView.showsHorizontalScrollIndicator = NO;
    
    self.collectionView.pagingEnabled = YES;
    
    // 注册cell
    [self.collectionView registerClass:[MJNewFeatureViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
//    [self setUpAllChildView];
    
}




@end
