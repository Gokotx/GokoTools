//
//  UIView+Effect.m
//  CloudShop
//
//  Created by Goko on 17/11/2017.
//  Copyright © 2017 xiaojian. All rights reserved.
//

#import "UIView+Effect.h"
#import "StructuredInfo.h"

@implementation UIView (Effect)

+(UIVisualEffectView *)blurEffectViewWithStyle:(UIBlurEffectStyle)style{
    UIVisualEffectView * blurView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:style]];
    return blurView;
}

-(void)bouceViewWithDuration:(CGFloat)duration{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.values = @[@(0.8), @(1.05), @(1.1), @(1)];
    animation.keyTimes = @[@(0), @(0.3), @(0.5), @(1.0)];
    animation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear]];
    animation.duration = duration;
    [self.layer addAnimation:animation forKey:@"bouce"];
}

-(void)horizontalGradientWithLeftColor:(UIColor *)leftColor rightColor:(UIColor *)rightColor{
    DEBUG_MODE_EXEPRESSION(^{
        if (CGRectEqualToRect(self.bounds, CGRectZero)) {
            @throw [NSException exceptionWithName:@"Frame Error"
                                           reason:@"view.bounds can not be CGRectZero"
                                         userInfo:@{@"view":self}];
        }
    });
    NSString * layerName = NSStringFromSelector(_cmd);
    //防止对一个view 重复添加不同的渐变色导致的多层layer覆盖的问题
    [self.layer.sublayers enumerateObjectsUsingBlock:^(CALayer * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj.name isEqualToString:layerName]) {
            [obj removeFromSuperlayer];
            *stop = YES;
        }
    }];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.bounds;
    gradient.name = layerName;
    gradient.colors = [NSArray arrayWithObjects:
                       (id)leftColor.CGColor,
                       (id)rightColor.CGColor, nil];
    gradient.startPoint = CGPointMake(0, 0.5);
    gradient.endPoint = CGPointMake(1, 0.5);
    gradient.locations = @[@0.0, @1.0];
    [self.layer insertSublayer:gradient atIndex:0];
}

@end
