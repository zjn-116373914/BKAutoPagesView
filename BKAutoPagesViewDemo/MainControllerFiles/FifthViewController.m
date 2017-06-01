//
//  FifthViewController.m
//  BKAutoPageScrollViewDemo
//
//  Created by 张加宁 on 2017/5/26.
//  Copyright © 2017年 BlackKnife. All rights reserved.
//

#import "FifthViewController.h"

/**宏定义屏幕长宽以及其他参数**/
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
#define HeadHeight    20
#define NavigationItemHeight 44
#define TabBarItemHeight     49

@interface FifthViewController ()

@end

@implementation FifthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"第五控制器";
    
    UIImageView *backgroundImageView = [[UIImageView alloc] init];
    backgroundImageView.frame = CGRectMake(0, HeadHeight + NavigationItemHeight, ScreenWidth, ScreenHeight - HeadHeight - NavigationItemHeight);
    [backgroundImageView setImage:[UIImage imageNamed:@"IMG_05.png"]];
    [self.view addSubview:backgroundImageView];
}



@end
