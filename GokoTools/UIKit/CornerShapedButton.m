//
//  CornerShapedButton.m
//  CloudShop
//
//  Created by Goko on 2018/5/17.
//  Copyright © 2018 xiaojian. All rights reserved.
//

#import "CornerShapedButton.h"

@interface CornerShapedButton()

@end

@implementation CornerShapedButton

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.titleLabel];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.titleLabel];
    }
    return self;
}
-(void)shapedWithCorner:(UIRectCorner)corner radii:(CGFloat)radii{
    [self roundCornerWithUIRectCorner:corner cornerRadii:radii];
    [self.titleLabel roundCornerWithUIRectCorner:corner cornerRadii:radii-1];
}
- (void)setBorderColor:(UIColor *)color title:(NSString *)title{
    self.backgroundColor = color;
    self.titleLabel.text = title;
    self.titleLabel.textColor = color;
}

-(void)layoutSubviews{
    self.titleLabel.frame = CGRectMake(1, 1, self.width-2, self.height-2);
}
-(UILabel *)titleLabel{
    if (nil == _titleLabel) {
        UILabel * label = [UILabel new];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:[UIFont labelFontSize]];
        label.backgroundColor = [UIColor whiteColor];
        label.numberOfLines = 0;
        _titleLabel = label;
    }
    return _titleLabel;
}

@end
