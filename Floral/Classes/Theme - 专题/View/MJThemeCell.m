//
//  MJThemeCell.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/26.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJThemeCell.h"
#import "MJTheme.h"
#import "MJPerson.h"
#import "MJThemeCategory.h"
#import <UIImageView+WebCache.h>
@interface MJThemeCell ()
@property (weak, nonatomic) IBOutlet UIImageView *bigImage;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UIImageView *vipImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *personDetailabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *lookCountBtn;
@property (weak, nonatomic) IBOutlet UIButton *likeCountBtn;
@property (weak, nonatomic) IBOutlet UIButton *commentCountBtn;

@end
@implementation MJThemeCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionview cellIdentifier:(NSString *)identifier indexPath:(NSIndexPath *)indexPath
{
   
    MJThemeCell * cell = [collectionview dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    return cell;
}
- (void)setTheme:(MJTheme *)theme
{
    _theme = theme;
    [self.bigImage sd_setImageWithURL:[NSURL URLWithString:theme.smallIcon]];
    [self.iconImage setHeader:theme.author.headImg];
    self.nameLabel.text = theme.author.userName;
    self.personDetailabel.text = theme.author.identity;
    self.tagLabel.text = [NSString stringWithFormat:@"[%@]",theme.category.name];
    self.titleLabel.text = theme.title;
    self.contentLabel.text = theme.desc;
    [self.lookCountBtn setTitle:[NSString stringWithFormat:@"%zd",theme.read] forState:UIControlStateNormal];
    [self.likeCountBtn setTitle:[NSString stringWithFormat:@"%zd",theme.appoint] forState:UIControlStateNormal];
    [self.commentCountBtn setTitle:[NSString stringWithFormat:@"%zd",theme.fnCommentNum] forState:UIControlStateNormal];
}
@end
