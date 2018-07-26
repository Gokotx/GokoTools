//
//  AppInfo.h
//  GlobalScanner
//
//  Created by kiefer on 14-9-22.
//  Copyright (c) 2014年 kiefer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfo : NSObject

// 操作系统
+ (NSString *)system;
+ (NSString *)systemName;
+ (NSString *)systemVersion;

// 应用程序版本号
+ (NSString *)version;
// 应用程序名称
+ (NSString *)displayName;
// 应用程序id
+ (NSString *)bundleIdentifier;
// 网络请求版本号
+ (NSString *)networkVersion;

// App更新地址
+ (NSURL *)appStoreURL;
//是否允许通知
+ (BOOL)isAllowedNotification;
//打开系统设置
+ (void)openSystemSettings;

@end
