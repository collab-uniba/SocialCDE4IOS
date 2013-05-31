//
//  ProxyWrapper.h
//  SocialCDE for IOS
//
//  Created by Floris on 4/17/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ISocialCDDEProxy.h"
#import "RequestUtility.h"

@interface ProxyWrapper : NSObject <ISocialCDEProxy>

- (void) setHost: (NSString*) newHost;
- (NSString*) getHost;
- (NSString*) getBaseHost; 

@end
