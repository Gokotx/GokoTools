//
//  UIView+Operation.m
//  CloudShop
//
//  Created by Goko on 02/11/2017.
//  Copyright © 2017 xiaojian. All rights reserved.
//

#import "UIView+Operation.h"

@implementation UIView (Operation)
-(void)removeAllSubviewsRecursively{
    while (self.subviews.count) {
        UIView * tempView = self.subviews.lastObject;
        [tempView removeAllSubviewsRecursively];
        [tempView removeFromSuperview];
        tempView = nil;
    }
}
@end
