//
//  MJThemeCell.h
//  Floral
//
//  Created by 孙梦翔 on 16/9/26.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <UIKit/UIKit.h>
@class  MJTheme;
@interface MJThemeCell : UICollectionViewCell
/** mjtheme */
@property (strong ,nonatomic) MJTheme * theme;
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionview cellIdentifier:(NSString *)identifier indexPath:(NSIndexPath *)indexPath;

@end
