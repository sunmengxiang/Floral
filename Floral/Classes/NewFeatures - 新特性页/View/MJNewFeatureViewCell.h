//
//  MJNewFeatureViewCell.h
//  Floral
//
//  Created by 孙梦翔 on 16/10/01.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJNewFeatureViewCell : UICollectionViewCell

@property (nonatomic, strong) UIImage *image;

- (void)setUpIndexPath:(NSIndexPath *)indexPath count:(NSInteger)pagesCount;

@end
