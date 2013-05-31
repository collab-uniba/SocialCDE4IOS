//
//  WService.h
//  SocialCDE for IOS
//
//  Created by Floris on 08/05/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WService : NSObject
{
    int idService;
    NSString *Name;
    NSString *Host;
    NSString *BaseService;
    NSString *Image;
    BOOL Registered;
    BOOL RequireOAuth;
    int OAuthVersion;
    BOOL RequireTFSAuthentication;
    BOOL RequireTFSDomain;
}

- (void) setIdService: (int) newIdService;
- (int) getIdService;
- (void) setName: (NSString*) newName;
- (NSString*) getName;
- (void) setHost: (NSString*) newHost;
- (NSString*) getHost;
- (void) setBaseService: (NSString*) newBaseService;
- (NSString*) getBaseService;
- (void) setImage: (NSString*) newImage;
- (NSString*) getImage;
- (BOOL) isRegistered;
- (void) setFlagRegistered: (BOOL) registered;
- (BOOL) isRequireOAuth;
- (void) setFlagRequireOAuth: (BOOL) requireOAuth;
- (void) setOAuthVersion: (int) OAuthVersion;
- (int) getOAuthVersion;
- (void) setFlagRequireTFSAuthentication: (BOOL) TFSAuthentication;
- (BOOL) isRequireTFSAuthentication;
- (void) setFlagRequireTFSDomain: (BOOL) TFSDomain;
- (BOOL) isRequireTFSDomain; 
@end
