//
//  CornerShapedButton.h
//  CloudShop
//
//  Created by Goko on 2018/5/17.
//  Copyright © 2018 xiaojian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CornerShapedButton : UIView

@property (nonatomic, strong) UILabel * titleLabel;

- (void)shapedWithCorner:(UIRectCorner)corner radii:(CGFloat)radii;

- (void)setBorderColor:(UIColor *)color title:(NSString *)title;


@end
