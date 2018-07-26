//
//  NSString+Ext.h
//  GlobalScanner
//
//  Created by kiefer on 15/11/20.
//  Copyright © 2015年 Neo Yang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Ext)

// 过滤表情符号
- (BOOL)containsEmoji;
// 根据最大长度截断字符串 在行尾加上...
- (NSString *)lineBreakByTruncatingTail:(CGFloat)maxWidth font:(UIFont *)font;


/**
 获取文本高度

 @param width 指定文本的宽度
 @param font 文本的字体
 @return 文本的size大小
 */
-(CGSize)textHeightWithWidth:(CGFloat)width font:(UIFont*)font;

/**
 获取文本的高度

 @param width 指定的文本的宽度
 @return 文本的size大小
 */
-(CGSize)textHeightUseSystemFontWithWidth:(CGFloat)width;

-(CGSize)textSizeWithWidthLimited:(CGFloat)width font:(UIFont *)font;
-(CGSize)textSizeWithHeightLimited:(CGFloat)Height font:(UIFont *)font;

@end
