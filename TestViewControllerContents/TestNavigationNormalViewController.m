//
//  TestNavigationNormalViewController.m
//  TestViewControllerContents
//
//  Created by 王士良 on 2017/12/1.
//  Copyright © 2017年 wsliang. All rights reserved.
//

#import "TestNavigationNormalViewController.h"

@interface TestNavigationNormalViewController ()

@end

@implementation TestNavigationNormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"初始化[%@] 标题为:%@",self,self.title);
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"[%p]父类界面关系: nav:%@ , presenting:%@ , parent:%@ ",self,self.navigationController,self.presentingViewController,self.parentViewController);
    if (self.baseCacheDataWeak ==nil && self.presentingViewController) {
        self.baseCacheDataWeak = self.presentingViewController;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)actionOperations:(UIButton *)sender
{
    TestNavigationNormalViewController *newVC = [self.storyboard instantiateViewControllerWithIdentifier:@"TestNavigationNormalViewController"];
    newVC.baseCacheDataWeak = self.baseCacheDataWeak;
    if (sender.tag==1) { // push
        if (!newVC) {
            newVC = [TestNavigationNormalViewController new];
        }
        if (self.navigationController) {
            [self.navigationController pushViewController:newVC animated:YES];
        }else{
            [self presentViewController:newVC animated:YES completion:^{

            }];
        }

    }else if (sender.tag == 2){ // present

        [self presentViewController:newVC animated:YES completion:nil];
    }else if (sender.tag ==3){ // 跳转到根部

        if(self.navigationController){
            [self.navigationController popToRootViewControllerAnimated:YES];
        }else if([self.baseCacheDataWeak isKindOfClass:[UIViewController class]]){
            [self.baseCacheDataWeak dismissViewControllerAnimated:YES completion:nil];
        }else{
            [self dismissViewControllerAnimated:YES completion:nil];
        }

    }


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
