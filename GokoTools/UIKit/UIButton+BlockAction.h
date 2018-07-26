//
//  UIButton+BlockAction.h
//  Jumper
//
//  Created by Goko on 27/09/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (BlockAction)

-(void)goko_addAction:(VoidBlock)action;
-(void)goko_addActionWithEvent:(UIControlEvents)event Action:(VoidBlock)action;

@end
