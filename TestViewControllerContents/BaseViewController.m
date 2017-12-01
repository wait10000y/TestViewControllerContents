//
//  BaseViewController.m
//  MySpace
//
//  Created by wsliang on 15/9/18.
//  Copyright (c) 2015年 wsliang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
//    self.navigationItem.backBarButtonItem = backItem;
  
//  self.view.backgroundColor = [UIColor whiteColor];
//  [self.navigationItem.backBarButtonItem setTitleTextAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:5]} forState:UIControlStateNormal];

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


// default implement

-(IBAction)actionBackLastView:(UIButton*)sender
{
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
      if(self.presentingViewController){
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
      }else{
        [self dismissViewControllerAnimated:YES completion:nil];
      }
    }
    NSLog(@"--- actionBackLastView method empty ---");
}

-(IBAction)actionOperations:(UIButton*)sender
{
  NSLog(@"--- actionOperations method empty ---");
}

#pragma mark - 获取当前控制器
+ (UIViewController *)getCurrentShowViewController
{
  UIViewController *result = nil;

  UIWindow * window = [[UIApplication sharedApplication] keyWindow];
  if (window.windowLevel != UIWindowLevelNormal)
  {
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for(UIWindow * tmpWin in windows)
    {
      if (tmpWin.windowLevel == UIWindowLevelNormal)
      {
        window = tmpWin;
        break;
      }
    }
  }

  UIView *frontView = [[window subviews] objectAtIndex:0];
  id nextResponder = [frontView nextResponder];

  if ([nextResponder isKindOfClass:[UIViewController class]])
    result = nextResponder;
  else
    result = window.rootViewController;

    //如果是Nav
  if ([result isKindOfClass:[UINavigationController class]]) {
    UINavigationController * nav = (UINavigationController *)result;
    return nav.topViewController;
  }

  return result;
}

+ (UIViewController *)createViewControllerName:(NSString*)theName nibName:(NSString*)nibName
{
  Class currClass = NSClassFromString(theName);
  UIViewController *tempVC;
  if (currClass !=NULL) {
    if (nibName) {
      tempVC = [[currClass alloc] initWithNibName:nibName bundle:nil];
    }else{
      tempVC = [[currClass alloc] init];
    }
  }
  return tempVC;
}


@end
