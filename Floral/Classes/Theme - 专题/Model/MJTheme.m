//
//  MJTheme.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/26.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJTheme.h"
#import "MJPerson.h"
#import "MJThemeCategory.h"
@implementation MJTheme
- (instancetype)initWithDict:(NSDictionary *)dict
{
    MJTheme * theme = [[MJTheme alloc] init];
    [theme setValue:dict[@"title"] forKey:@"title"];
    [theme setValue:dict[@"keywords"] forKey:@"keywords"];
    [theme setValue:dict[@"pageUrl"] forKey:@"pageUrl"];
    [theme setValue:dict[@"fnCommentNum"] forKey:@"fnCommentNum"];
    [theme setValue:dict[@"appoint"] forKey:@"appoint"];
    [theme setValue:dict[@"read"] forKey:@"read"];
    [theme setValue:dict[@"smallIcon"] forKey:@"smallIcon"];
    [theme setValue:dict[@"name"] forKey:@"name"];
    [theme setValue:dict[@"desc"] forKey:@"desc"];
    // 设置 person 的字典转模型
    MJPerson * p = [[MJPerson alloc] initWithDict:dict[@"author"]];
    [theme setValue:p forKey:@"author"];
    // 设置 category 的字典转模型
    MJThemeCategory * category = [[MJThemeCategory alloc] initWithDict:dict[@"category"]];
    [theme setValue:category forKey:@"category"];
    
    /**** 计算高度 ******/
    // 1 图片高度计算
    CGFloat smallItemW = (MJScreenW - 2.5*MJDefaultMargin)/2.0f;
    CGFloat bigItemW = MJScreenW - 2* MJDefaultMargin;
    
    CGFloat smallTextW = smallItemW - 2 * MJDefaultMargin;
    CGFloat bigTextW = bigItemW - 2 * MJDefaultMargin;
    
    
    CGFloat smallImgH = smallItemW / MJThemeArticleImgRatio;
    CGFloat bigImgH = bigItemW / MJThemeArticleImgRatio;
    
    // 2 文字高度计算
   
    CGFloat bigNamelH = [theme.author.userName boundingRectWithSize:CGSizeMake(bigTextW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil].size.height;

    CGFloat bigDesclH = [theme.author.identity boundingRectWithSize:CGSizeMake(bigTextW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size.height;
   
    CGFloat bigTaglH = [theme.category.name boundingRectWithSize:CGSizeMake(bigTextW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size.height;
    
    CGFloat smallTitlelH = [theme.title boundingRectWithSize:CGSizeMake(smallTextW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]} context:nil].size.height;
    CGFloat bigTitleH = [theme.title boundingRectWithSize:CGSizeMake(bigTextW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size.height;
    CGFloat smallContentH = [theme.desc boundingRectWithSize:CGSizeMake(smallTextW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10]} context:nil].size.height;
    CGFloat bigContentH = [theme.desc boundingRectWithSize:CGSizeMake(bigTextW, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:13]} context:nil].size.height;
    
    CGFloat bigItemH = bigImgH + bigNamelH + bigDesclH + bigTaglH + bigTitleH + bigContentH + MJTabBarHeight + MJDefaultMargin * 4.5;
    
    CGFloat smallItemH = smallImgH + smallTitlelH + smallContentH + 30.0f*MJTabBarHeight/44.0f + MJDefaultMargin * 3.5;
    
    theme.smallItemSize = CGSizeMake(smallItemW, smallItemH);
    theme.bigItemSize = CGSizeMake(bigItemW, bigItemH);
    
    return theme;
}
@end
