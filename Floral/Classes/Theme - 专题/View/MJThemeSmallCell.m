//
//  MJThemeSmallCell.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/29.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJThemeSmallCell.h"
#import "MJTheme.h"
#import <UIImageView+WebCache.h>
@interface MJThemeSmallCell()
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *readBtn;
@property (weak, nonatomic) IBOutlet UIButton *zanBtn;

@end
@implementation MJThemeSmallCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setTheme:(MJTheme *)themeList
{
    _theme = themeList;
    
    [self.img sd_setImageWithURL:[NSURL URLWithString:themeList.smallIcon]];
    self.titleLabel.text = themeList.title;
    self.contentLabel.text = themeList.desc;
    [self.readBtn setTitle:[NSString stringWithFormat:@"%zd",themeList.read] forState:UIControlStateNormal];
    [self.zanBtn setTitle:[NSString stringWithFormat:@"%zd",themeList.appoint] forState:UIControlStateNormal];
    
}
+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionview cellIdentifier:(NSString *)identifier indexPath:(NSIndexPath *)indexPath 
{
    
    MJThemeSmallCell * cell = [collectionview dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    return cell;
}

@end
