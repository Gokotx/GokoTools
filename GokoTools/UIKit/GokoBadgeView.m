//
//  GokoBadgeView.m
//  CloudShop
//
//  Created by Goko on 2018/5/22.
//  Copyright © 2018 xiaojian. All rights reserved.
//

#import "GokoBadgeView.h"
#import "UIView+Shape.h"

@interface GokoBadgeView()
@property(nonatomic, strong) UIImageView * imageView;
@property(nonatomic, strong) UILabel * badgeLabel;
@end

@implementation GokoBadgeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.badgeLabel];
        self.badgeLabel.hidden = YES;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
-(void)setBadgeCount:(NSString *)count{
    if (count.intValue == 0) {
        self.badgeLabel.hidden = YES;
    }else{
        self.badgeLabel.hidden = NO;
        self.badgeLabel.text = count;
        if (count.intValue>99) {
            self.badgeLabel.text = @"99+";
        }
        self.badgeLabel.width = [self.badgeLabel.text textSizeWithHeightLimited:16 font:self.badgeLabel.font].width+10;
        [self setNeedsLayout];
        [self layoutIfNeeded];
    }
}
-(void)setImage:(NSString *)imagePath{
    if ([imagePath hasPrefix:@"http"]) {
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:imagePath]];
    }else if([imagePath hasPrefix:@"file"]){
        self.imageView.image = [UIImage imageWithContentsOfFile:imagePath];
    }else{
        self.imageView.image = ImageNamed(imagePath);
    }
}
-(void)layoutSubviews{
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.bottom.equalTo(self);
    }];
    [self.badgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.imageView.mas_right);
        make.centerY.equalTo(self.imageView.mas_top);
        make.width.mas_equalTo(self.badgeLabel.width);
        make.height.mas_equalTo(self.badgeLabel.height);
    }];
}
-(UIImageView *)imageView{
    if (nil == _imageView) {
        UIImageView * imageView = [UIImageView new];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.image = PlaceHolderImage;
//        imageView.layer.cornerRadius = 4;
//        imageView.layer.masksToBounds = YES;
        imageView.userInteractionEnabled = YES;
        _imageView = imageView;
    }
    return _imageView;
}
-(UILabel *)badgeLabel{
    if (nil == _badgeLabel) {
        UILabel * label = [UILabel new];
        label.textAlignment = NSTextAlignmentCenter;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:10];
        label.backgroundColor = UIColor.redColor;
        label.bounds = CGRectMake(0, 0, 16, 16);
        label.layer.borderColor = UIColor.whiteColor.CGColor;
        label.layer.borderWidth = 1;
        label.layer.cornerRadius = 8;
        label.layer.masksToBounds = YES;
        label.numberOfLines = 0;
        _badgeLabel = label;
    }
    return _badgeLabel;
}
@end
