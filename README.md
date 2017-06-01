# BKAutoPagesView
该框架是一个图像3d重叠显示的试图.该框架不仅有酷炫的翻页特性,而且具有自动翻页功能.另外,该框架中所添加试图都具有点击手势以及执行方法.

例如:

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
