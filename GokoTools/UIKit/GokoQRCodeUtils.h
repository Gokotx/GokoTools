//
//  GokoQRCodeUtils.h
//  CloudShop
//
//  Created by Goko on 2018/6/12.
//  Copyright © 2018 xiaojian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GokoQRCodeUtils : NSObject

/**
 根据给定的内容和边长返回二维码image对象

 @param strContent 二维码内容
 @param sideLength 二维码边长大小
 @return image
 */
+(UIImage *)generateQRCodeWithString:(NSString *)strContent sideLength:(CGFloat)sideLength;

@end
