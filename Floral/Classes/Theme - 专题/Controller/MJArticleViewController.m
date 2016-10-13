//
//  MJArticleViewController.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/30.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJArticleViewController.h"
#import "MJTheme.h"
#import "MJThemeCategory.h"
#import "MJAuthorHeadView.h"
#import <UIImageView+WebCache.h>
@interface MJArticleViewController ()
@property (nonatomic,weak) UIWebView * webView;
@property (nonatomic,assign) CGRect webHeadViewFrame;
@property (nonatomic,strong) NSArray * webHeadViewItemH;
@end

@implementation MJArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setUpNaviBar];
    
    [self setUpWebView];
    
    [self setUpWebViewHead];
    
    [self setUpAuthorDetail];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.webView.scrollView setContentOffset:CGPointMake(0, -self.webHeadViewFrame.size.height - MJTabBarHeight)];

}

- (void)setUpNaviBar
{
    
    UIBarButtonItem * rightBtnItem = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"ad_share"] highlightImage:[UIImage imageNamed:@"ad_share"] target:self selector:@selector(shareClick)];
    
    self.navigationItem.rightBarButtonItem = rightBtnItem;
    
}

- (void)setUpAuthorDetail
{
    // 设置头部作者的信息，不随着 webView 的滚动而滚动
    MJAuthorHeadView * headView = [MJAuthorHeadView authorHeaderView];
    headView.theme = self.theme;
    
    headView.frame = CGRectMake(0, 64, MJScreenW, MJTabBarHeight);
    
    [self.view addSubview:headView];
}
- (void)setUpWebView
{
    UIWebView * webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.scrollView.contentInset = UIEdgeInsetsMake(self.webHeadViewFrame.size.height + MJTabBarHeight, 0, 0, 0);
    self.webView = webView;
    self
    .webView.backgroundColor = [UIColor whiteColor];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.theme.pageUrl]]];
    [self.view addSubview:webView];
}
// 在 webView 的头部另外设置一个文章的介绍
- (void)setUpWebViewHead
{
    UIView * webHeadView = [[UIView alloc] init];
    // 设置 head 的 frame
    webHeadView.frame = CGRectMake(0, - self.webHeadViewFrame.size.height, self.webHeadViewFrame.size.width, self.webHeadViewFrame.size.height);
    
    // 在 head 中添加控件
    // 图片
    UIImageView * imageV = [[UIImageView alloc] init];
    imageV.frame = CGRectMake(0, 0, MJScreenW, [self.webHeadViewItemH[0] floatValue]);
    [webHeadView addSubview:imageV];
    [imageV sd_setImageWithURL:[NSURL URLWithString:self.theme.smallIcon]];
    // title
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.frame = CGRectMake(0, [self.webHeadViewItemH[0] floatValue] + 2 * MJDefaultMargin, MJScreenW - 2 * MJDefaultMargin, [self.webHeadViewItemH[1] floatValue]);
    titleLabel.text = self.theme.title;
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    // 自动换行
    titleLabel.numberOfLines = 0;
    [webHeadView addSubview:titleLabel];
    // 带下划线tag
    UILabel * tagLabel = [[UILabel alloc] init];
    tagLabel.font = [UIFont systemFontOfSize:14];
    NSMutableAttributedString * tagUnderLineStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"#%@#",self.theme.category.name] attributes:@{NSUnderlineStyleAttributeName:[NSNumber numberWithInteger:NSUnderlineStyleSingle]}];
    tagLabel.attributedText = tagUnderLineStr;
    tagLabel.frame = CGRectMake(0, CGRectGetMaxY(titleLabel.frame)+MJDefaultMargin, MJScreenW, [self.webHeadViewItemH[2] floatValue]);
    tagLabel.textColor = [UIColor blackColor];
    tagLabel.textAlignment = NSTextAlignmentCenter;
    [webHeadView addSubview:tagLabel];
    
    [self.webView.scrollView addSubview:webHeadView];
}
- (void)shareClick
{
    NSLog(@"share");
}
- (void)setTheme:(MJTheme *)theme
{
    _theme = theme;
    self.navigationItem.title = theme.title;
    // 计算内容的高度
    // 1. 图片的高度
    CGFloat imgH = MJScreenW / MJThemeArticleImgRatio;
    // 文字的高度
    CGFloat titleH = [self.theme.title boundingRectWithSize:CGSizeMake(MJScreenW - 3 * MJDefaultMargin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:18]} context:nil].size.height;
    CGFloat tagH = [self.theme.category.name boundingRectWithSize:CGSizeMake(MJScreenW - 3 * MJDefaultMargin, MAXFLOAT) options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14]} context:nil].size.height;
    CGFloat h = imgH + titleH + tagH + MJDefaultMargin * 4;
    self.webHeadViewItemH = @[@(imgH),@(titleH),@(tagH)];
    self.webHeadViewFrame = CGRectMake(0, MJNaviBarHeight + MJTabBarHeight, MJScreenW, h);
}

@end
