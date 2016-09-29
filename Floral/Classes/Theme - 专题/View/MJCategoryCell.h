//
//  MJCategoryCell.h
//  Floral
//
//  Created by 孙梦翔 on 16/9/28.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MJThemeCategory;
@interface MJCategoryCell : UICollectionViewCell
@property (nonatomic,strong) MJThemeCategory * category;

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView;
@end
