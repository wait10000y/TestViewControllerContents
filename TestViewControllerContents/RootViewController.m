//
//  RootViewController.m
//  TestViewControllerContents
//
//  Created by 王士良 on 2017/11/15.
//  Copyright © 2017年 wsliang. All rights reserved.
//

#import "RootViewController.h"
#import "UIViewController+addViewControllers.h"

@interface RootViewController ()

@property (weak, nonatomic) IBOutlet UISwitch *switchAnimate;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentType;
@property (weak, nonatomic) IBOutlet UILabel *textTitle;

@property (nonatomic) NSString *titleStr;
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"系统界面布局 0:viewDidLoad mainScreen.bounds:%@ ,view:%@ -----",NSStringFromCGRect([UIScreen mainScreen].bounds),NSStringFromCGRect(self.view.frame));

    NSLog(@"初始化 viewDidLoad:%@,%@",NSStringFromClass([self class]),self);
    self.textTitle.text = self.titleStr;
    if (self.navigationController) {
        self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    }

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"系统界面布局 0:viewWillAppear mainScreen.bounds:%@ ,view:%@ -----",NSStringFromCGRect([UIScreen mainScreen].bounds),NSStringFromCGRect(self.view.frame));

}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"系统界面布局 0:viewDidAppear mainScreen.bounds:%@ ,view:%@ -----",NSStringFromCGRect([UIScreen mainScreen].bounds),NSStringFromCGRect(self.view.frame));

    NSLog(@"界面关系:presented:%@, presenting:%@ , nav:%@ , parent:%@ ,self.split:%@ , childs:%@ ",self.presentedViewController,self.presentingViewController,self.navigationController,self.parentViewController,self.splitViewController,self.childViewControllers);
}

-(void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    NSLog(@"viewWillLayoutSubviews 操作界面:%@",NSStringFromCGRect(self.textTitle.superview.frame));
    NSLog(@"系统界面布局 0:viewWillLayoutSubviews mainScreen.bounds:%@ ,view:%@ -----",NSStringFromCGRect([UIScreen mainScreen].bounds),NSStringFromCGRect(self.view.frame));
    CGFloat tempWidth = MIN(self.view.frame.size.width, self.view.frame.size.height);
    self.textTitle.superview.frame = CGRectMake(0,0, tempWidth, tempWidth);
    self.textTitle.superview.center = self.view.center;

}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    NSLog(@"系统界面布局 0:viewDidLayoutSubviews mainScreen.bounds:%@ ,view:%@ -----",NSStringFromCGRect([UIScreen mainScreen].bounds),NSStringFromCGRect(self.view.frame));
NSLog(@"viewWillLayoutSubviews 操作界面:%@",NSStringFromCGRect(self.textTitle.superview.frame));
}


-(void)setTitle:(NSString *)theTitle
{
    [super setTitle:theTitle];
    self.titleStr = theTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


-(IBAction)actionBackLastView:(UIButton*)sender
{
    NSLog(@"%@ : actionBackLastView 根容器弹出",NSStringFromClass(self.class));
    if (self.navigationController) {
        if (self.navigationController.navigationController) {

            [self.navigationController.navigationController popViewControllerAnimated:self.switchAnimate.on];
        }else{
            [self.navigationController dismissViewControllerAnimated:self.switchAnimate.on completion:nil];
        }
    }else{
        if (self.presentingViewController) {
            [self.presentingViewController dismissViewControllerAnimated:self.switchAnimate.on completion:nil];
        }else{
            [self.parentViewController dismissViewControllerAnimated:self.switchAnimate.on completion:nil];
        }
    }
}

- (IBAction)actionOthersAction:(UIButton*)sender
{
    NSLog(@"%@ : actionOthersAction",NSStringFromClass(self.class));

    UIViewController *pVC = [self createViewControllerWithType:sender.tag];
    if (pVC) {
        BOOL isPresent = (self.segmentType.selectedSegmentIndex == 0);
        if (isPresent) {
            [self addViewControllerPresent:pVC animate:self.switchAnimate.on];
        }else{
            [self addViewControllerPush:pVC animate:self.switchAnimate.on];
        }
    }

}


@end
