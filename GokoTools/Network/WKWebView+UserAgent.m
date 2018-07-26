//
//  WKWebView+UserAgent.m
//  gegejia
//
//  Created by kiefer on 17/3/7.
//  Copyright © 2017年 Neo Yang. All rights reserved.
//

#import "WKWebView+UserAgent.h"

@implementation WKWebView (UserAgent)

+ (NSString *)gegejia {
    // ios/gegejia/1.0
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    return [NSString stringWithFormat:@"/ios/maibaocloud/%@", version];
}

- (void)evaluateUserAgentCompletionHandler:(void(^)())completionHandler {
//    __weak typeof(self) weakSelf = self;
    [self evaluateJavaScript:@"navigator.userAgent" completionHandler:^(id result, NSError *error) {
        DBLog(@"userAgent %@", result);
//        __strong typeof(weakSelf) strongSelf = weakSelf;
        NSString *userAgent = result;
        NSString *gegejia = [WKWebView gegejia];
        NSRange range = [userAgent rangeOfString:gegejia];
        if (range.location != NSNotFound) {
            if (completionHandler) completionHandler();
            return;
        }
        NSString *newUserAgent = [userAgent stringByAppendingString:gegejia];
        NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:newUserAgent, @"UserAgent", nil];
        [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
        if (completionHandler) completionHandler();
    }];
}

@end
