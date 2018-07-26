//
//  UIButton+BlockAction.m
//  Jumper
//
//  Created by Goko on 27/09/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import "UIButton+BlockAction.h"

@implementation UIButton (BlockAction)
-(void)goko_addAction:(VoidBlock)action{
    [self goko_addActionWithEvent:UIControlEventTouchUpInside Action:action];
}
-(void)goko_addActionWithEvent:(UIControlEvents)event Action:(VoidBlock)action{
    SEL selector = @selector(p_buttonClick);
    [self addTarget:self action:selector forControlEvents:event];
    DynamicSetIvar(selector, action);
}
-(void)p_buttonClick{
    VoidBlock block = DynamicGetIvar(_cmd);
    if (block) {
        block();
    }
}
@end
