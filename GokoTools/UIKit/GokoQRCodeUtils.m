//
//  GokoQRCodeUtils.m
//  CloudShop
//
//  Created by Goko on 2018/6/12.
//  Copyright © 2018 xiaojian. All rights reserved.
//

#import <CoreImage/CoreImage.h>
#import "GokoQRCodeUtils.h"

@implementation GokoQRCodeUtils

+(UIImage *)generateQRCodeWithString:(NSString *)strContent sideLength:(CGFloat)sideLength{
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setDefaults];
    NSData *data = [strContent dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKeyPath:@"inputMessage"];
    CIImage *ciImage = [filter outputImage];
    UIImage * finalImage = [self p_createNonInterpolatedUIImageFormCIImage:ciImage sideLength:sideLength];
    return finalImage;
}

+(UIImage *)p_createNonInterpolatedUIImageFormCIImage:(CIImage *)image sideLength:(CGFloat)sideLength {
    CGRect extent = CGRectIntegral(image.extent);
    CGFloat scale = MIN(sideLength/CGRectGetWidth(extent), sideLength/CGRectGetHeight(extent));
    
    // 1.创建bitmap;
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef bitmapImage = [context createCGImage:image fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmapImage);
    
    // 2.保存bitmap到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmapImage);
    return [UIImage imageWithCGImage:scaledImage];
}

@end
