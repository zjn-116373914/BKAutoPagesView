#import <UIKit/UIKit.h>
typedef void(^blockOfAutoPagesView)(NSInteger);

@interface BKAutoPagesView : UIView
@property(nonatomic,copy) blockOfAutoPagesView blockToTapImageViewAction;

/**[初始化]**/
+ (instancetype)autoPagesView;
- (instancetype)initWithImageNameArray:(NSArray*)imageNameArray;

/**[添加单一图像]到主视图中**/
- (void)addImageNameToMainView:(NSString*)imageName;

/**[设置主试图坐标]**/
- (void)setPositionWithX:(CGFloat)x Y:(CGFloat)y;
/**[设置主试图大小]**/
- (void)setSizeWithWidth:(CGFloat)width Height:(CGFloat)height;

/**最终加载[主方法]**/
- (void)loadAutoPagesViewMainFunction;

/*mainTimer翻页计时器[启动]*/
- (void)playMainTimerAction;
/*mainTimer翻页计时器[关闭]*/
- (void)stopMainTimerAction;

@end

