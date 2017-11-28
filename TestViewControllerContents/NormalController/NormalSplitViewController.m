//
//  NormalSplitViewController.m
//  TestViewControllerContents
//
//  Created by 王士良 on 2017/11/15.
//  Copyright © 2017年 wsliang. All rights reserved.
//

#import "NormalSplitViewController.h"


@interface NormalSplitViewController ()
@end

@implementation NormalSplitViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"初始化 viewDidLoad:%@,%@",NSStringFromClass([self class]),self);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"界面关系:presented:%@, presenting:%@ , nav:%@ , parent:%@ ,self.split:%@ , childs:%@ ",self.presentedViewController,self.presentingViewController,self.navigationController,self.parentViewController,self.splitViewController,self.childViewControllers);
}




@end
