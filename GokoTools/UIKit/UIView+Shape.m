//
//  UIView+Shape.m
//  CloudShop
//
//  Created by Goko on 06/09/2017.
//  Copyright © 2017 xiaojian. All rights reserved.
//

#import "UIView+Shape.h"

@implementation UIView (Shape)

+(UIView *)horizontalLineWithLength:(CGFloat)length{
    return [self lineWithHeight:1 width:length];
}

+(UIView *)verticalLineWithLength:(CGFloat)length{
    return [self lineWithHeight:length width:1];
}
+(UIView *)lineWithHeight:(CGFloat)height width:(CGFloat)width{
    UIView * view = [UIView new];
    view.bounds = CGRectMake(0, 0, width, height);
    view.backgroundColor = UIColor.grayColor;
    return view;
}

-(void)roundCornerWithUIRectCorner:(UIRectCorner)rectCorner cornerRadii:(CGFloat)radii{
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:rectCorner cornerRadii:CGSizeMake(radii, radii)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

-(void)roudCornerWithUIRectCorner:(UIRectCorner)rectCorner
                      cornerRadii:(CGFloat)radii
                      borderWidth:(CGFloat)borderWidth
                      borderColor:(UIColor *)borderColor
                        fillColor:(UIColor *)fillColor{
    UIBezierPath * path = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                byRoundingCorners:rectCorner
                                                      cornerRadii:CGSizeMake(radii, radii)];
    CAShapeLayer * maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.lineWidth = borderWidth;
    maskLayer.lineCap = kCALineCapSquare;
    
    // 带边框则两个颜色不要设置成一样即可
    maskLayer.strokeColor = borderColor.CGColor;
    maskLayer.fillColor = fillColor.CGColor;
    
    maskLayer.path = path.CGPath;
    [self.layer insertSublayer:maskLayer atIndex:0];
}

@end
