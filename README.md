# BKAutoPagesView
该框架是一个图像3d重叠显示的试图.该框架不仅有酷炫的翻页特性,而且具有自动翻页功能.

例如:
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
