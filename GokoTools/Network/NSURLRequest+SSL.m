//
//  NSURLRequest+SSL.m
//  CloudShop
//
//  Created by Goko on 23/10/2017.
//  Copyright © 2017 xiaojian. All rights reserved.
//

#import "NSURLRequest+SSL.h"

@implementation NSURLRequest (SSL)
+(BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host{
    return YES;
}
+(void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host{
    
}
@end
