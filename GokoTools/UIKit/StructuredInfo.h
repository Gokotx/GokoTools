//
//  StructuredInfo.h
//  CloudShop
//
//  Created by Goko on 07/09/2017.
//  Copyright © 2017 xiaojian. All rights reserved.
//

#ifndef StructuredInfo_h
#define StructuredInfo_h

typedef void(^VoidBlock)(void);
typedef void(^ParamBlock)(id param);
#define HEX_COLOR(c)    [UIColor colorWithRed:((c>>16)&0xFF)/255.0 \
                                green:((c>>8)&0xFF)/255.0 \
                                blue:(c&0xFF)/255.0 \
                                alpha:1.0]

#define DocumentsPath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0]
#define CachesPath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask, YES) objectAtIndex:0]

// DEVICE VERSION
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)


#define GokoTotalParams(firstParam) ({\
    NSMutableArray * paramArray = [[NSMutableArray alloc]init];\
    va_list argList;\
    if (firstParam) {\
        [paramArray addObject:firstParam];\
        va_start(argList, firstParam);\
        id tempObject;\
        while ((tempObject = va_arg(argList, id))) {\
            [paramArray addObject:tempObject];\
        }\
        va_end(argList);\
    }\
    paramArray;\
})



/**
 Dynmic add ivar with given name ,hold by self.
 @return (id)added ivar
 */
#define DynamicGetIvar(selector) ({\
                            id dynamicIvar = objc_getAssociatedObject(self, selector);\
                            dynamicIvar;\
                        });

/**
 set ivar value with key

 @param selector : selector
 @param value: must be an object
 @return void
 */
#define DynamicSetIvar(selector,value) ({\
                                    id dynamicIvar = objc_getAssociatedObject(self, selector);\
                                    dynamicIvar = value;\
                                    objc_setAssociatedObject(self, selector, dynamicIvar,OBJC_ASSOCIATION_RETAIN_NONATOMIC);\
                                });




#ifndef weakify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
        #else
            #define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
        #endif
    #endif
#endif

#ifndef strongify
    #if DEBUG
        #if __has_feature(objc_arc)
            #define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
        #endif
    #else
        #if __has_feature(objc_arc)
            #define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
        #else
            #define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
        #endif
    #endif
#endif

#endif /* StructuredInfo_h */
