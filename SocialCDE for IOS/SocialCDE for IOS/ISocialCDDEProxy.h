//
//  ISocialCDDEProxy.h
//  SocialCDE for IOS
//
//  Created by Floris on 4/17/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WUser.h"
#import "WService.h"
@protocol ISocialCDEProxy <NSObject>
- (Boolean) IsWebServiceRunning;
- (Boolean) IsAvailable: (NSString *) username;
- (WUser*) GetUser: (NSString *) username password: (NSString*) password;
- (NSString*) GetServices: (NSString *)username password: (NSString*) password;
- (int) SubscribeUser: (NSString*) mail username: (NSString*) username password: (NSString*) password;
- (Boolean) ChangePassword: (NSString*) username oldpassword: (NSString*) oldpswd newpassword: (NSString*) newpswd; 
@end
