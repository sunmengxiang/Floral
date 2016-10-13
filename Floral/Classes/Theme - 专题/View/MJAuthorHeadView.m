//
//  MJAuthorHeadView.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/30.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJAuthorHeadView.h"
#import "MJTheme.h"
#import "MJPerson.h"
#import <UIImageView+WebCache.h>
@interface MJAuthorHeadView()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *identifier;
@property (weak, nonatomic) IBOutlet UILabel *followCountLabel;
@property (weak, nonatomic) IBOutlet UIButton *followBtn;
@property (weak, nonatomic) IBOutlet UIImageView *iconImgV;


@end
@implementation MJAuthorHeadView

- (void)setTheme:(MJTheme *)theme
{
    _theme = theme;
    
    self.nameLabel.text = theme.author.userName;
    self.identifier.text = theme.author.identity;
    self.followCountLabel.text = [NSString stringWithFormat:@"有%zd人订阅",theme.author.subscibeNum];
    [self.iconImgV setHeader:theme.author.headImg];
}
+ (instancetype)authorHeaderView
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}
@end
