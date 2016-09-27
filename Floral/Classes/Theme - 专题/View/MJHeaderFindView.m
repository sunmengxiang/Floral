//
//  MJHeaderFindView.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/25.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJHeaderFindView.h"
#import <Masonry.h>
@interface MJHeaderFindView ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UIButton *canclBtn;

@end

@implementation MJHeaderFindView
+ (instancetype)findView
{
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass(self) owner:nil options:nil]lastObject];
}
- (instancetype)init
{
    if (self = [super init]) {
        
        [self setUp];
    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
     [self setUp];
}
- (void)setUp
{
    UIView * view = [[UIView  alloc]initWithFrame:CGRectMake(0,0,25,0)];
    view.backgroundColor = [UIColor whiteColor];
    self.inputField.leftView = view;
    self.inputField.leftViewMode = UITextFieldViewModeAlways;
    self.inputField.enablesReturnKeyAutomatically = YES;
    
    self.frame = CGRectMake(0, -MJTabBarHeight, MJScreenW, MJTabBarHeight);
}


- (IBAction)canclClick:(id)sender {
    
    [self dismiss];
}
- (void)show
{
    [UIView animateWithDuration:0.3 animations:^{
        self.center = CGPointMake(MJScreenW/2, 42);
    } completion:^(BOOL finished) {
        [self.inputField becomeFirstResponder];
    }];
}
- (void)dismiss
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.center = CGPointMake(MJScreenW/2, -44);
    } completion:^(BOOL finished) {
        [self.inputField resignFirstResponder];
        [self removeFromSuperview];
    }];
}


@end
