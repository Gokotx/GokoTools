//
//  NSURLRequest+SSL.h
//  CloudShop
//
//  Created by Goko on 23/10/2017.
//  Copyright © 2017 xiaojian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSURLRequest (SSL)
+(BOOL)allowsAnyHTTPSCertificateForHost:(NSString*)host;
+(void)setAllowsAnyHTTPSCertificate:(BOOL)allow forHost:(NSString*)host;
@end
