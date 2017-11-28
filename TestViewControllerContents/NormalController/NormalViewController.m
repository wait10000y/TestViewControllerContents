//
//  NormalViewController.m
//  TestViewControllerContents
//
//  Created by 王士良 on 2017/11/15.
//  Copyright © 2017年 wsliang. All rights reserved.
//

#import "NormalViewController.h"
#import "UIViewController+addViewControllers.h"

@interface NormalViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentType;
@property (weak, nonatomic) IBOutlet UILabel *textTitle;
@property (nonatomic) NSString *titleStr;

@end

@implementation NormalViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSLog(@"初始化 viewDidLoad:%@,%@",NSStringFromClass([self class]),self);
    self.textTitle.text = self.titleStr;

    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

-(void)setTitle:(NSString *)theTitle
{
    [super setTitle:theTitle];
    self.titleStr = theTitle;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"界面关系:presented:%@, presenting:%@ , nav:%@ , parent:%@ ,self.split:%@ , childs:%@ ",self.presentedViewController,self.presentingViewController,self.navigationController,self.parentViewController,self.splitViewController,self.childViewControllers);
}

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






@end
