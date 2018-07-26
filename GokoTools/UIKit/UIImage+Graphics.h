//
//  UIImage+Graphics.h
//
//
//  Created by kiefer on 13-9-26.
//  Copyright (c) 2013年 cztv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Graphics)

- (UIImage *)fixOrientation;
////////////////////////////////////////////////////////////////////////////////////////////////////
- (UIImage *)imageAtRect:(CGRect)rect;
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;
// 使用颜色创建UIImage
+ (UIImage *)imageWithColor:(UIColor *)color;
// 给UIImage加圆角
- (UIImage *)imageAddCornerWithRadius:(CGFloat)radius andSize:(CGSize)size;

+ (UIImage *)imageWithSize:(CGSize)size
                 lineColor:(UIColor *)lineColor
                 lineWidth:(CGFloat)lineWidth
                isLineDash:(BOOL)isLineDash;


+(UIImage *)imageWithCurrentScreenshot;

@end
