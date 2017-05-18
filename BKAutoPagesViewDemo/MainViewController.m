//
//  MainViewController.m
//  BKAutoPagesViewDemo
//
//  Created by 张加宁 on 2017/5/16.
//  Copyright © 2017年 BlackKnife. All rights reserved.
//

#import "MainViewController.h"
#import "BKAutoPagesView.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSMutableArray *mainImgNameMarr = [[NSMutableArray alloc] init];
    [mainImgNameMarr addObject:@"IMG_01.png"];
    [mainImgNameMarr addObject:@"IMG_02.png"];
    [mainImgNameMarr addObject:@"IMG_03.png"];
    [mainImgNameMarr addObject:@"IMG_04.png"];
    [mainImgNameMarr addObject:@"IMG_05.png"];
    
    //框架外[核心代码]
    BKAutoPagesView *mainView = [[BKAutoPagesView autoPagesView] initWithImageNameArray:mainImgNameMarr];
    [mainView loadAutoPagesViewMainFunction];
    //------------------------------------------------------------
    [self.view addSubview:mainView];
}



@end
