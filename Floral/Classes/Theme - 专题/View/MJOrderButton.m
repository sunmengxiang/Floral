//
//  MJOrderButton.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/25.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJOrderButton.h"

@implementation MJOrderButton

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat labelWidth = [self.titleLabel.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesDeviceMetrics attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:MJNaviTitleFontSize]} context:nil].size.width;
    CGFloat titleX = (self.width - MJDefaultMargin) / 2.0 - labelWidth;
    self.titleLabel.x = titleX;
    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + MJDefaultMargin;
}

@end
