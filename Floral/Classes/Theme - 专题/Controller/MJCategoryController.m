//
//  MJCategoryController.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/28.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJCategoryController.h"
#import "MJNetTools.h"
#import "MJThemeCategory.h"

#import "MJCategoryCell.h"
@interface MJCategoryController ()
@property (nonatomic,strong) NSArray * categoryArray;
@end

@implementation MJCategoryController

static NSString * const cellReuseID = @"categoryCell";
static NSString * const headReuseID = @"categoryHead";
- (void)viewDidLoad {
    [super viewDidLoad];

    
    // Register cell classes
    self.collectionView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([MJCategoryCell class]) bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:cellReuseID ];
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self loadData];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismiss
{
    [UIView animateWithDuration:0.5f animations:^{
        self.collectionView.transform = CGAffineTransformMakeTranslation(0, -self.collectionView.height);
    } completion:^(BOOL finished) {
        
//        [self.collectionView removeFromSuperview];
        [self removeFromParentViewController];
        
    }];
    
}

- (void)loadData
{
    [MJNetTools requestThemeCategory:^(id  _Nullable responseObject) {
        if (responseObject) {
            
            NSArray * array = responseObject[@"result"];
            
            NSMutableArray * arrayM = [NSMutableArray array];
            for (NSDictionary * dict in array) {
                MJThemeCategory * c = [[MJThemeCategory alloc] initWithDict:dict];
                [arrayM addObject:c];
            }
            self.categoryArray = arrayM;
            // 回到主线程更新 UI
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self loadDataSuccess];
            });
            
        }
        
    } failure:^(NSError * _Nonnull error) {
        if (error) {
            NSLog(@"CategoryError:%@",error);
            [self loadDataError];
        }
    }];
}
- (void)loadDataError
{
    self.collectionView.backgroundColor = [UIColor clearColor];
    
}
- (void)loadDataSuccess
{
    // 往下移动的动画
    self.collectionView.transform = CGAffineTransformMakeTranslation(0, -self.collectionView.height);
    [self.collectionView reloadData];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:1 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        
        self.collectionView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
    }];

}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return self.categoryArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MJCategoryCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellReuseID forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [MJCategoryCell cellWithCollectionView:collectionView];
    }
    cell.category = self.categoryArray[indexPath.item];
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item == 0) {
        return CGSizeMake(MJScreenW, 130);
    }
    return CGSizeMake((MJScreenW - 1)/2, 130);
}
#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}
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
