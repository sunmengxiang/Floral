//
//  MJLoginViewController.m
//  Floral
//
//  Created by 孙梦翔 on 16/9/26.
//  Copyright © 2016年 孙梦翔. All rights reserved.
//

#import "MJLoginViewController.h"

@interface MJLoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *localBtn;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@property (weak, nonatomic) IBOutlet UITextField *pswField;

/** isLogin */
@property (assign ,nonatomic) BOOL  isLogin;
@end

@implementation MJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (instancetype)init
{
    if (self == [super init]) {
        
    }
    return self;
}
+ (instancetype)loginViewController
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil ]lastObject];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginClick {
}
- (IBAction)backClick {
    [self dismissViewControllerAnimated:NO completion:nil];
    NSLog(@"0");
}
- (IBAction)closeClick {
    [self dismissViewControllerAnimated:NO completion:nil];
}

@end
