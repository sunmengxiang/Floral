//
//  MJEssenceTagsCell.m
//  Floral
//
//  Created by 孙梦翔 on 16/10/13.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJEssenceTagsCell.h"
#import "MJEssenceTags.h"
#import <UIImageView+WebCache.h>
@interface MJEssenceTagsCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
@implementation MJEssenceTagsCell
- (void)setEssenceTag:(MJEssenceTags *)essenceTag
{
    _essenceTag = essenceTag;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:_essenceTag.tagUrl]];
}


@end
