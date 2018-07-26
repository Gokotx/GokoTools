//
//  GokoBadgeView.h
//  CloudShop
//
//  Created by Goko on 2018/5/22.
//  Copyright © 2018 xiaojian. All rights reserved.
//

#import "BaseView.h"

@interface GokoBadgeView : BaseView

-(void)setBadgeCount:(NSString *)count;

//本地名称和网络地址均可
-(void)setImage:(NSString *)imagePath;

@end
