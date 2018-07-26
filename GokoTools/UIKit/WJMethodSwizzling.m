//
//  WJMethodSwizzling.m
//  
//
//  Created by wangjie on 15/11/25.
//
//

#import "WJMethodSwizzling.h"
#import <objc/runtime.h>

//静态就交换静态，实例方法就交换实例方法
void SwizzlingMethod(Class class, SEL originSEL, SEL swizzledSEL) {
    Method originMethod = class_getInstanceMethod(class, originSEL);
    Method swizzledMethod = nil;
    if (!originMethod) {//处理为类的方法
        originMethod = class_getClassMethod(class, originSEL);
        swizzledMethod = class_getClassMethod(class, swizzledSEL);
        if (!originMethod || !swizzledMethod) return;
    } else {//处理为事例的方法
        swizzledMethod = class_getInstanceMethod(class, swizzledSEL);
        if (!swizzledMethod) return;
    }
    if (class_addMethod(class, originSEL, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))) {
        class_replaceMethod(class, swizzledSEL, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    } else {
        method_exchangeImplementations(originMethod, swizzledMethod);
    }
}
