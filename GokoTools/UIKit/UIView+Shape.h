//
//  UIView+Shape.h
//  CloudShop
//
//  Created by Goko on 06/09/2017.
//  Copyright © 2017 xiaojian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Shape)

/**
 水平线条，默认灰色，使用指定center即可

 @param length 线条的长度
 @return 一条宽度为1的水平线
 */
+(UIView *)horizontalLineWithLength:(CGFloat)length;
/**
 垂直线条，默认灰色，使用指定center即可
 
 @param length 线条的长度
 @return 一条宽度为1的垂直线
 */

+(UIView *)verticalLineWithLength:(CGFloat)length;

/**
 可以自定线条的宽度和高度，默认为灰色，使用指定center即可

 @param height 高度
 @param width 宽度
 @return 指定宽高的线条
 */
+(UIView *)lineWithHeight:(CGFloat)height width:(CGFloat)width;


/**
 view 切不规则圆角

 @param rectCorner 指定要切的是哪些角
 @param radii 半径
 */
-(void)roundCornerWithUIRectCorner:(UIRectCorner)rectCorner cornerRadii:(CGFloat)radii;



/**
 任意圆角，带边框

 @param rectCorner 圆角的位置
 @param radii 圆角的半径
 @param borderWidth 边框的宽度
 @param borderColor 边框的颜色
 @param fillColor view 的填充色
 */
-(void)roudCornerWithUIRectCorner:(UIRectCorner)rectCorner
                      cornerRadii:(CGFloat)radii
                      borderWidth:(CGFloat)borderWidth
                      borderColor:(UIColor *)borderColor
                        fillColor:(UIColor *)fillColor;

@end
