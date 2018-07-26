//
//  NSObject+ThreadSafe.h
//  CloudShop
//
//  Created by Goko on 23/11/2017.
//  Copyright © 2017 xiaojian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StructuredInfo.h"

//#define Lock() pthread_mutex_lock(&_lock)
//#define Unlock() pthread_mutex_unlock(&_lock)

void DEBUG_MODE_EXEPRESSION(VoidBlock expression){
#ifdef DEBUG
    if (expression) {
        expression();
    }
#endif
}
void MAIN_THREAD_EXEPRESSION(VoidBlock expression){
    BOOL isMainThread = [NSThread isMainThread];
    if (!isMainThread) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (expression) {
                expression();
            }
        });
    }else{
        if (expression) {
            expression();
        }
    }
}


@interface NSObject (ThreadSafe)

-(void)ensureMainThread:(VoidBlock)block;
-(void)pthreadMutexLock;
-(void)pthreadMutexUnLock;

@end
