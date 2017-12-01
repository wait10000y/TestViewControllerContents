//
//  TestNavigationNavigationViewController.m
//  TestViewControllerContents
//
//  Created by 王士良 on 2017/12/1.
//  Copyright © 2017年 wsliang. All rights reserved.
//

#import "TestNavigationNavigationViewController.h"

@interface TestNavigationNavigationViewController ()

@end

@implementation TestNavigationNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"初始化[%@] 标题为:%@",self,self.title);

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"[%p]父类界面关系: nav:%@ , presenting:%@ , parent:%@ ",self,self.navigationController,self.presentingViewController,self.parentViewController);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
