//
//  MainViewController.m
//  BKAutoPagesViewDemo
//
//  Created by 张加宁 on 2017/5/16.
//  Copyright © 2017年 BlackKnife. All rights reserved.
//

#import "MainViewController.h"
#import "BKAutoPagesView.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"
#import "FifthViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"首页";
    
    //框架外[核心代码]
    NSMutableArray *mainImgNameMarr = [[NSMutableArray alloc] init];
    [mainImgNameMarr addObject:@"IMG_01.png"];
    [mainImgNameMarr addObject:@"IMG_02.png"];
    [mainImgNameMarr addObject:@"IMG_03.png"];
    [mainImgNameMarr addObject:@"IMG_04.png"];
    [mainImgNameMarr addObject:@"IMG_05.png"];
    
    BKAutoPagesView *mainView = [[BKAutoPagesView autoPagesView] initWithImageNameArray:mainImgNameMarr];
    mainView.blockToTapImageViewAction = ^(NSInteger tagOfImageView)
    {
        switch (tagOfImageView)
        {
            case 100:
            {
                FirstViewController *firstViewCtl = [[FirstViewController alloc] init];
                [self.navigationController pushViewController:firstViewCtl animated:YES];
            }break;
                
            case 101:
            {
                SecondViewController *secondViewCtl = [[SecondViewController alloc] init];
                [self.navigationController pushViewController:secondViewCtl animated:YES];
            }break;
                
            case 102:
            {
                ThirdViewController *thirdViewCtl = [[ThirdViewController alloc] init];
                [self.navigationController pushViewController:thirdViewCtl animated:YES];
            }break;
                
            case 103:
            {
                FourthViewController *fourthViewCtl = [[FourthViewController alloc] init];
                [self.navigationController pushViewController:fourthViewCtl animated:YES];
            }break;
                
            case 104:
            {
                FifthViewController *fifthViewCtl = [[FifthViewController alloc] init];
                [self.navigationController pushViewController:fifthViewCtl animated:YES];
            }break;
                
            default:
                break;
        }
    };
    [mainView loadAutoPagesViewMainFunction];
    //------------------------------------------------------------
    [self.view addSubview:mainView];
}



@end
