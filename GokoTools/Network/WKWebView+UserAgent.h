//
//  WKWebView+UserAgent.h
//  gegejia
//
//  Created by kiefer on 17/3/7.
//  Copyright © 2017年 Neo Yang. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface WKWebView (UserAgent)

- (void)evaluateUserAgentCompletionHandler:(void(^)())completionHandler;

@end
