//
//  MJMenuItem.h
//  Floral
//
//  Created by 孙梦翔 on 16/9/25.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MJMenuItem : UIButton

@property (nonatomic,strong) NSString * title;

@property (nonatomic,strong) UIImage * image;

- (instancetype)itemButtonWithImage:(UIImage *)image title:(NSString *)title;
@end
