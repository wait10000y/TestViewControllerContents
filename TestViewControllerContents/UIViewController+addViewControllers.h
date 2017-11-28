//
//  UIViewController+addViewControllers.h
//  TestViewControllerContents
//
//  Created by 王士良 on 2017/11/15.
//  Copyright © 2017年 wsliang. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    CusotmViewControllerTypeNormalVC = 0,
    CusotmViewControllerTypeNormalNavigationVC = 1,
    CusotmViewControllerTypeNormalTabBarVC = 2,
    CusotmViewControllerTypeNormalSplitVC = 3,
    CusotmViewControllerTypeNormalPageVC = 4,
    CusotmViewControllerTypeRootVC = 5, // 框架VC使用的
    CusotmViewControllerTypeOthersVC = 6,
} CusotmViewControllerType;



@interface UIViewController (addViewControllers)


-(IBAction)actionBackLastView:(UIButton*)sender;
- (IBAction)actionOthersAction:(UIButton*)sender;

-(void)addViewControllerPresent:(UIViewController*)theVC animate:(BOOL)animate;
-(void)addViewControllerPush:(UIViewController*)theVC animate:(BOOL)animate;
-(UIViewController *)createViewControllerWithType:(CusotmViewControllerType)type;


@end
