//
//  BaseViewController.h
//  MySpace
//
//  Created by wsliang on 15/9/18.
//  Copyright (c) 2015年 wsliang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseViewControllerDelegate;
@interface BaseViewController : UIViewController

@property (nonatomic) id baseCacheData;
@property (weak, nonatomic) id baseCacheDataWeak;
@property (weak, nonatomic) id<BaseViewControllerDelegate> baseDelegate;

-(IBAction)actionBackLastView:(UIButton*)sender;
-(IBAction)actionOperations:(UIButton*)sender;

  // 获取屏幕正在显示的ViewController
+ (UIViewController *)getCurrentShowViewController;

  // 通过类的名称创建类对象
+ (UIViewController *)createViewControllerName:(NSString*)theName nibName:(NSString*)nibName;

@end


@protocol BaseViewControllerDelegate <NSObject>

@optional
-(void)baseViewControllerDelegateCall:(id)sender data:(id)theData;

@end
