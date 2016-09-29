//
//  MJCategoryCell.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/28.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJCategoryCell.h"
#import "MJThemeCategory.h"
#import <UIImageView+WebCache.h>
@interface MJCategoryCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLbale;
@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@end
@implementation MJCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setCategory:(MJThemeCategory *)category
{
    _category = category;
    if (category == nil) {
        self.titleLbale.text = [NSString stringWithFormat:@"没有网络"];
        self.backgroundColor = [UIColor grayColor];
        return;
    }
    self.titleLbale.text = [NSString stringWithFormat:@"%@ | %@",category.enName,category.name];
    NSURL * url = [NSURL URLWithString:category.img];
    [self.bgImageView sd_setImageWithURL:url];
}
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}
@end
