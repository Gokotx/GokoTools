//
//  AppInfo.m
//  GlobalScanner
//
//  Created by kiefer on 14-9-22.
//  Copyright (c) 2014年 kiefer. All rights reserved.
//

#import "AppInfo.h"

@implementation AppInfo

// 操作系统
+ (NSString *)system {
    NSString *systemName = [AppInfo systemName];
    NSString *systemVersion = [AppInfo systemVersion];
    if (systemName.length > 0 && systemVersion.length > 0) {
        return Format(@"%@ %@", systemName, systemVersion);
    }
    return systemName;
}

+ (NSString *)systemName {
    return [UIDevice currentDevice].systemName;
}

+ (NSString *)systemVersion {
    return [UIDevice currentDevice].systemVersion;
}

// 应用程序版本号
+ (NSString *)version {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

// 应用程序名称
+ (NSString *)displayName {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleName"];
}

// 应用程序id
+ (NSString *)bundleIdentifier {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleIdentifier"];
}

// 网络请求版本号
+ (NSString *)networkVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    if (version.length > 0) {
        NSMutableString *tempString = [NSMutableString string];
        NSArray *arr = [version componentsSeparatedByString:@"."];
        if (arr.count > 0) {
            for (int i = 0; i < arr.count; i++) {
                if (i == 0) {
                    [tempString appendString:arr[0]];
                    [tempString appendString:@"."];
                } else {
                    [tempString appendString:arr[i]];
                }
            }
            return tempString;
        }
    }
    return version;
}

+ (NSURL *)appStoreURL {
    return [NSURL URLWithString:@"http://maibaodownload.51yanwang.com"];
}

//是否允许通知
+ (BOOL)isAllowedNotification {
    //iOS8 check if user allow notification
    if (IOS_8_OR_LATER) {// system is iOS8
        UIUserNotificationSettings *setting = [[UIApplication sharedApplication] currentUserNotificationSettings];
        if (setting.types != UIUserNotificationTypeNone) return YES;
    } else {//iOS7
        //UIRemoteNotificationType type = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
        //if (type != UIRemoteNotificationTypeNone) return YES;
    }
    return NO;
}

//打开系统设置
+ (void)openSystemSettings {
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
