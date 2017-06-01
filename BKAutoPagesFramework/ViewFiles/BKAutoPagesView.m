#import "BKAutoPagesView.h"
#import "UIView+Layout.h"
#import "UIImageView+Shadow.h"

//宏定义屏幕长宽以及其他参数
#define ScreenWidth   [UIScreen mainScreen].bounds.size.width
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height
#define HeadHeight    20
#define NavigationItemHeight 44
#define TabBarItemHeight     49



@interface BKAutoPagesView()

@property (nonatomic, strong) NSMutableArray *mainImagesNameMarr;
@property (nonatomic, strong) NSTimer *mainTimer;
@property (nonatomic, strong) UIButton *centerBtn;

@end

@implementation BKAutoPagesView
#pragma mark - 系统方法
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.mainImagesNameMarr = [[NSMutableArray alloc] init];
        
        CGFloat mainViewWidth = ScreenWidth;
        CGFloat mainViewHeight = ScreenHeight/3.0;
        self.frame = CGRectMake(0, HeadHeight+NavigationItemHeight, mainViewWidth, mainViewHeight);
        
    }
    return self;
}
#pragma mark ---------------------------------------------------------------------------

#pragma mark - [外部开放]方法
/**[初始化]**/
+ (instancetype)autoPagesView
{
    return  [[self alloc] init];
}

- (instancetype)initWithImageNameArray:(NSArray*)imageNameArray
{
    self = [super init];
    if (self)
    {
        self.mainImagesNameMarr = [NSMutableArray arrayWithArray:imageNameArray];
    }
    return self;
}

/**[添加单一图像]到主视图中**/
- (void)addImageNameToMainView:(NSString*)imageName
{
    [self.mainImagesNameMarr addObject:imageName];
}

/**[设置主试图坐标]**/
- (void)setPositionWithX:(CGFloat)x Y:(CGFloat)y
{
    self.x = x;
    self.y = y;
}


/**[设置主试图大小]**/
- (void)setSizeWithWidth:(CGFloat)width Height:(CGFloat)height
{
    self.width = width;
    self.height = height;
}

/**最终加载[主方法]**/
- (void)loadAutoPagesViewMainFunction
{
    //加载[显示图像]
    CGFloat imgViewWidthSpace = self.width*0.2/(self.mainImagesNameMarr.count-1);
    for(int i=0; i<self.mainImagesNameMarr.count; i++)
    {
        UIImageView *mainImgView = [[UIImageView alloc] init];
        mainImgView.width = self.frame.size.width - i*2*imgViewWidthSpace;
        mainImgView.height = self.height;
        mainImgView.x = imgViewWidthSpace*i;
        mainImgView.y = 0;
        
        [mainImgView setImage:[UIImage imageNamed:self.mainImagesNameMarr[(self.mainImagesNameMarr.count-1) - i]]];
        [mainImgView loadShadowOfImageViewToAllBounds];
        
        mainImgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(TapGestureAction:)];
        [mainImgView addGestureRecognizer:tap];
        mainImgView.tag = ((self.mainImagesNameMarr.count-1) - i) + 100;
        
        [self addSubview:mainImgView];
    }
    //------------------------------------------------------
    
    //加载[左侧控制按钮]
    UIButton *leftBtn = [[UIButton alloc] init];
    leftBtn.width = 0.15*self.width;
    leftBtn.height = leftBtn.width;
    leftBtn.x = 0;
    leftBtn.y = self.height/2 - leftBtn.height/2;
    
    [leftBtn setImage:[UIImage imageNamed:@"icon_btn_left.png"] forState:UIControlStateNormal];
    leftBtn.alpha = 0.5;
    
    [leftBtn addTarget:self action:@selector(leftBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftBtn];
    //------------------------------------------------------
    
    //加载[右侧控制按钮]
    UIButton *rightBtn = [[UIButton alloc] init];
    rightBtn.width = 0.15*self.width;
    rightBtn.height = rightBtn.width;
    rightBtn.x = self.width - rightBtn.width;
    rightBtn.y = self.height/2 - rightBtn.height/2;
    
    [rightBtn setImage:[UIImage imageNamed:@"icon_btn_right.png"] forState:UIControlStateNormal];
    rightBtn.alpha = 0.5;
    
    [rightBtn addTarget:self action:@selector(rightBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:rightBtn];
    //------------------------------------------------------
    
    //加载[中部暂停与播放按钮]
    self.centerBtn = [[UIButton alloc] init];
    self.centerBtn.width = rightBtn.width = 0.15*self.width;
    self.centerBtn.height = self.centerBtn.width;
    self.centerBtn.x = self.width/2 - self.centerBtn.width/2;
    self.centerBtn.y = self.self.height - self.centerBtn.height;
    self.centerBtn.alpha = 1;
    
    [self.centerBtn setImage:[UIImage imageNamed:@"icon_stop.png"] forState:UIControlStateNormal];
    [self.centerBtn setImage:[UIImage imageNamed:@"icon_start.png"] forState:UIControlStateSelected];
    self.centerBtn.selected = NO;
    [self.centerBtn addTarget:self action:@selector(centerBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.centerBtn];
    //------------------------------------------------------
    
    [self playMainTimerAction];
}


#pragma mark ---------------------------------------------------------------------------

#pragma mark - [按钮控件]方法
/**[左端]控制按钮执行方法**/
- (void)leftBtnAction
{
    [self stopMainTimerAction];
    
    [UIView animateWithDuration:0.5 animations:^
     {
         for (NSInteger i=1; i<self.mainImagesNameMarr.count; i++)
         {
             UIImageView *currentImgView = self.subviews[i-1];
             UIImageView *targetImgView = self.subviews[i];
             
             [self exchangeSubviewAtIndex:(i-1) withSubviewAtIndex:i];
             
             CGRect exchangeRect = currentImgView.frame;
             currentImgView.frame = targetImgView.frame;
             targetImgView.frame = exchangeRect;
             
             [currentImgView loadShadowOfImageViewToAllBounds];
             [targetImgView loadShadowOfImageViewToAllBounds];
         }
         
         
     } completion:^(BOOL finished)
     {
         if((self.mainTimer == nil)&&(self.centerBtn.selected ==NO))
         {
             [self playMainTimerAction];
         }
     }];
    
}

/**[右端]控制按钮执行方法**/
- (void)rightBtnAction
{
    [self stopMainTimerAction];
    
    [UIView animateWithDuration:0.5 animations:^
     {
         for (NSInteger i=(self.mainImagesNameMarr.count-1); i>0; i--)
         {
             UIImageView *currentImgView = self.subviews[i-1];
             UIImageView *targetImgView = self.subviews[i];
             
             [self exchangeSubviewAtIndex:(i-1) withSubviewAtIndex:i];
             
             CGRect exchangeRect = currentImgView.frame;
             currentImgView.frame = targetImgView.frame;
             targetImgView.frame = exchangeRect;
             
             [currentImgView loadShadowOfImageViewToAllBounds];
             [targetImgView loadShadowOfImageViewToAllBounds];
         }
         
     } completion:^(BOOL finished)
     {
         if((self.mainTimer == nil)&&(self.centerBtn.selected ==NO))
         {
             [self playMainTimerAction];
         }
     }];
    
}

/**[中间]控制按钮执行方法**/
- (void)centerBtnAction:(UIButton*)sender
{
    if(sender.selected == NO)
    {
        [self stopMainTimerAction];
        
        sender.selected = YES;
    }
    else if (sender.selected == YES)
    {
        [self playMainTimerAction];
        sender.selected = NO;
    }
    
}

/**图像[点击手势]执行方法**/
- (void)TapGestureAction:(UIGestureRecognizer*)sender
{
    self.blockToTapImageViewAction(sender.view.tag);
}

#pragma mark ---------------------------------------------------------------------------




#pragma mark - mainTimer计时器操作方法
/*mainTimer翻页计时器[启动]*/
- (void)playMainTimerAction
{
    if(self.mainTimer == nil)
    {
        self.mainTimer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(autoPageAction) userInfo:nil repeats:YES];
    }
}

/*mainTimer翻页计时器[关闭]*/
- (void)stopMainTimerAction
{
    if(self.mainTimer != nil)
    {
        [self.mainTimer invalidate];
        self.mainTimer = nil;
    }
}

/*mainTimer计时器[执行方法]*/
-(void)autoPageAction
{
    [self rightBtnAction];
}

#pragma mark ---------------------------------------------------------------------------

@end
