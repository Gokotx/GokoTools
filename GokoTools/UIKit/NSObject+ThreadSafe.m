//
//  NSObject+ThreadSafe.m
//  CloudShop
//
//  Created by Goko on 23/11/2017.
//  Copyright © 2017 xiaojian. All rights reserved.
//

#import <pthread/pthread.h>
#import "NSObject+ThreadSafe.h"
#import "StructuredInfo.h"

@interface Lock_pthread_mutex_t:NSObject
@property(nonatomic,assign) pthread_mutex_t pthread_mutex_t_lock;
@end
@implementation Lock_pthread_mutex_t
- (instancetype)init
{
    self = [super init];
    if (self) {
        pthread_mutex_init(&_pthread_mutex_t_lock, NULL);
    }
    return self;
}
@end

@implementation NSObject (ThreadSafe)

-(void)ensureMainThread:(VoidBlock)block{
    if ([NSThread isMainThread]) {
        if (block) {
            block();
        }
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            if (block) {
                block();
            }
        });
    }
}
//待验证
-(void)pthreadMutexLock{
    Lock_pthread_mutex_t * lock_pthread_mutex_t = (Lock_pthread_mutex_t *)DynamicGetIvar(_cmd);
    if (!lock_pthread_mutex_t) {
        lock_pthread_mutex_t = [Lock_pthread_mutex_t new];
        DynamicSetIvar(_cmd,lock_pthread_mutex_t);
    }
    pthread_mutex_t lock = lock_pthread_mutex_t.pthread_mutex_t_lock;
    pthread_mutex_lock(&lock);
}
-(void)pthreadMutexUnLock{
    Lock_pthread_mutex_t * lock_pthread_mutex_t = (Lock_pthread_mutex_t *)DynamicGetIvar(_cmd);
    pthread_mutex_t lock = lock_pthread_mutex_t.pthread_mutex_t_lock;
    pthread_mutex_unlock(&lock);
}
@end
