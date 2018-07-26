//
//  UITableView+GokoTemplateLayoutCell.m
//  AutoCellHeight
//
//  Created by Goko on 04/08/2017.
//  Copyright © 2017 Goko. All rights reserved.
//

#import <UITableView+FDTemplateLayoutCell.h>
#import <objc/runtime.h>
#import "UITableView+GokoTemplateLayoutCell.h"
#import "WJMethodSwizzling.h"

@implementation UITableView (GokoTemplateLayoutCell)
+(void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        SEL originalSelector = @selector(fd_templateCellForReuseIdentifier:);
        SEL swizzledSelector = @selector(goko_templateCellForReuseIdentifier:);
        SwizzlingMethod(class, originalSelector, swizzledSelector);
    });
}
//#warning ！！！ 需要cell类名作为reuseIdentifier，才能动态注册
-(__kindof UITableViewCell *)goko_templateCellForReuseIdentifier:(NSString *)identifier {
    NSAssert(identifier.length > 0, @"Expect a valid identifier - %@", identifier);
    NSMutableDictionary<NSString *, UITableViewCell *> *templateCellsByIdentifiers = objc_getAssociatedObject(self, _cmd);
    if (!templateCellsByIdentifiers) {
        templateCellsByIdentifiers = @{}.mutableCopy;
        objc_setAssociatedObject(self, _cmd, templateCellsByIdentifiers, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    UITableViewCell *templateCell = templateCellsByIdentifiers[identifier];
    if (!templateCell) {
        templateCell = [self dequeueReusableCellWithIdentifier:identifier];
        if (nil == templateCell) {
            Class cls = NSClassFromString(identifier);
            if (cls) {
                templateCell = [(UITableViewCell *)[cls alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            }
        }
        NSAssert(templateCell != nil, @"Cell must be registered to table view for identifier - %@", identifier);
        templateCell.fd_isTemplateLayoutCell = YES;
        templateCell.contentView.translatesAutoresizingMaskIntoConstraints = NO;
        templateCellsByIdentifiers[identifier] = templateCell;
        [self fd_debugLog:[NSString stringWithFormat:@"layout cell created - %@", identifier]];
    }
    
    return templateCell;
}

@end
