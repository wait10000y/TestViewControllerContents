//
//  UIViewController+addViewControllers.m
//  TestViewControllerContents
//
//  Created by 王士良 on 2017/11/15.
//  Copyright © 2017年 wsliang. All rights reserved.
//

#import "UIViewController+addViewControllers.h"
#import "NormalViewsRelactions.h"

@implementation UIViewController (addViewControllers)

-(IBAction)actionBackLastView:(UIButton*)sender
{
    NSLog(@"%@ : actionBackLastView use default",NSStringFromClass(self.class));
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        if (self.presentingViewController) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

- (IBAction)actionOthersAction:(UIButton*)sender
{
    NSLog(@"%@ : actionOthersAction use default",NSStringFromClass(self.class));
    UIViewController *pVC = [self createViewControllerWithType:sender.tag];
    if (pVC) {
        [self addViewControllerPresent:pVC animate:YES];
    }
}

-(void)addViewControllerPresent:(UIViewController*)theVC animate:(BOOL)animate
{
    if (theVC) {
        UIViewController *nowVC = self;
        // 框架VC 找出来
        if ([self isKindOfClass:[NSClassFromString(@"RootViewController") class]]) {
            nowVC = self;
            if (self.parentViewController){ // 有父框架
                nowVC = self.parentViewController;
            }

            /**
             else if (self.navigationController) { // 有父框架,上面包含下面
                nowVC = self.navigationController;
             }
             */

        }

        @try {
            [nowVC presentViewController:theVC animated:animate completion:^{
            NSLog(@"present添加VC成功.");
            }];
        } @catch (NSException *exception) {
            NSLog(@"present添加VC失败:%@.",exception);
        }
    }
}

-(void)addViewControllerPush:(UIViewController*)theVC animate:(BOOL)animate
{
    if (theVC) {
            // 框架VC 找出来
        if ([self isKindOfClass:[NSClassFromString(@"RootViewController") class]]) {
            if(self.parentViewController){
                @try {
                    if ([self.parentViewController isKindOfClass:[UITabBarController class]]) {
                        UITabBarController *tabBarVC = self.parentViewController;
                        [tabBarVC setViewControllers:[tabBarVC.viewControllers arrayByAddingObject:theVC]];
                        NSLog(@"setViewControllers添加VC成功.");
                    }else if ([self.parentViewController isKindOfClass:[UISplitViewController class]]) {
                        UISplitViewController *splitVC = self.parentViewController;
                            //                    [splitVC addChildViewController:theVC];
                        [splitVC setViewControllers:[splitVC.viewControllers arrayByAddingObject:theVC]];
                        NSLog(@"setViewControllers添加VC成功.");
                    }else if ([self.parentViewController isKindOfClass:[UIPageViewController class]]) {
                        UIPageViewController *pageVC = self.parentViewController;
                        [pageVC setViewControllers:[pageVC.viewControllers arrayByAddingObject:theVC] direction:UIPageViewControllerNavigationDirectionForward animated:animate completion:nil];
                        NSLog(@"setViewControllers添加VC成功.");
                    }else if (self.navigationController) {
                        UINavigationController *tempNav = self.navigationController;
                        [tempNav pushViewController:theVC animated:animate];
                        NSLog(@"push添加VC成功.");
                    }else{
                        NSLog(@"add添加VC,不符合条件的框架VC:%@",self.parentViewController);
                    }

                } @catch (NSException *exception) {
                    NSLog(@"add添加VC失败:%@.",exception);
                }

            }else if (self.navigationController) {
                UINavigationController *tempNav = self.navigationController;
                @try {
                    [tempNav pushViewController:theVC animated:animate];
                    NSLog(@"push添加VC成功.");
                } @catch (NSException *exception) {
                    NSLog(@"push添加VC失败:%@.",exception);
                }

            }else{
                //
                NSLog(@"add添加VC,不符合条件,没有框架VC");
            }


        }else{
            NSLog(@"add添加VC,不符合条件, 当前是基本VC");
        }

    }
}

-(UIViewController *)createViewControllerWithType:(CusotmViewControllerType)type
{
    UIViewController *tempVC;
    NSString *className;
    NSString *typeName;
    switch (type) {
        case CusotmViewControllerTypeNormalVC:
        {
            className = @"RootViewController";
            typeName = @"VC";
        } break;
        case CusotmViewControllerTypeNormalNavigationVC:
        {
            className = @"NormalNavigationViewController";
            typeName = @"NaVC";
        } break;
        case CusotmViewControllerTypeNormalTabBarVC:
        {
            className = @"NormalTabBarViewController";
            typeName = @"TBVC";
        } break;
        case CusotmViewControllerTypeNormalSplitVC:
        {
            className = @"NormalSplitViewController";
            typeName = @"SpVC";
        } break;
        case CusotmViewControllerTypeNormalPageVC:
        {
            className = @"NormalPageViewController";
            typeName = @"PgVC";
        } break;
        case CusotmViewControllerTypeRootVC:
        {
            className = @"RootViewController";
            typeName = @"RVC";
        } break;
        case CusotmViewControllerTypeOthersVC:
        {
            className = @"RootViewController";
            typeName = @"OVC";
        } break;
        default:
            typeName = @"UNKnow";
            break;
    }

    if (className) {
        @try {
            tempVC =  [NSClassFromString(className) new];
            tempVC.title = typeName;

            if ([tempVC isKindOfClass:[UINavigationController class]]) {
                UINavigationController *tempNav = tempVC;
                UIViewController *ttempVC = [self createViewControllerWithType:CusotmViewControllerTypeRootVC];
                ttempVC.title = [NSString stringWithFormat:@"%@-%@",typeName,ttempVC.title];
                [tempNav pushViewController:ttempVC animated:NO];
            }else if ([tempVC isKindOfClass:[UITabBarController class]]){
                UITabBarController *tempTabBarVC = tempVC;
                UIViewController *ttempVC = [self createViewControllerWithType:CusotmViewControllerTypeRootVC];
                ttempVC.title = [NSString stringWithFormat:@"%@-%@",typeName,ttempVC.title];
                tempTabBarVC.viewControllers = @[ttempVC];
            }else if ([tempVC isKindOfClass:[UISplitViewController class]]){
                UISplitViewController *tempTabBarVC = tempVC;
                UIViewController *ttempVC = [self createViewControllerWithType:CusotmViewControllerTypeRootVC];
                ttempVC.title = [NSString stringWithFormat:@"%@-%@",typeName,ttempVC.title];
                tempTabBarVC.viewControllers = @[ttempVC];
            }else if ([tempVC isKindOfClass:[UIPageViewController class]]){
                UIPageViewController *tempPageVC = tempVC;
                UIViewController *ttempVC = [self createViewControllerWithType:CusotmViewControllerTypeRootVC];
                ttempVC.title = [NSString stringWithFormat:@"%@-%@",typeName,ttempVC.title];
                [tempPageVC setViewControllers:@[ttempVC] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
            }


        } @catch (NSException *exception) {
            NSLog(@"创建界面对象失败:%@",exception);
        }
    }
    return tempVC;
}


@end
