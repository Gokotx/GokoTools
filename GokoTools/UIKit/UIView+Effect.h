//
//  UIView+Effect.h
//  CloudShop
//
//  Created by Goko on 17/11/2017.
//  Copyright © 2017 xiaojian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Effect)

+(UIVisualEffectView *)blurEffectViewWithStyle:(UIBlurEffectStyle)style;

-(void)bouceViewWithDuration:(CGFloat)duration;

-(void)horizontalGradientWithLeftColor:(UIColor *)leftColor rightColor:(UIColor *)rightColor;
@end
