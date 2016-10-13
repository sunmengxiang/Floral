//
//  MJTOP10Cell.m
//  Floral
//
//  Created by 孙梦翔 on 16/10/13.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJTOP10Cell.h"
#import "MJTOP10Detail.h"
@interface MJTOP10Cell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *orderLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end
@implementation MJTOP10Cell
static NSString * cellID = @"TOP10DetailCell";


- (void)setOrder:(NSInteger)order
{
    _order = order;
    self.orderLabel.text = [NSString stringWithFormat:@"%zd",order];
}
- (void)setDetail:(MJTOP10Detail *)detail
{
    _detail = detail;
    [self.imageV setHeader:detail.headImg];
    self.nameLabel.text = detail.userName;
}

@end
