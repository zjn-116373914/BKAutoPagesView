#import <UIKit/UIKit.h>

@interface BKAutoPagesView : UIView

//**[初始化]**//
+ (instancetype)autoPagesView;
- (instancetype)initWithImageNameArray:(NSArray*)imageNameArray;

//**[设置主试图坐标]**//
- (void)setPositionWithX:(CGFloat)x Y:(CGFloat)y;
//**[设置主试图大小]**//
- (void)setSizeWithWidth:(CGFloat)width Height:(CGFloat)height;

//**最终加载[主方法]**//
- (void)loadAutoPagesViewMainFunction;


@end

