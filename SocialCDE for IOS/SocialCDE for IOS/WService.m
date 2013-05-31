//
//  WService.m
//  SocialCDE for IOS
//
//  Created by Floris on 08/05/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import "WService.h"
#import "UIController.h"
@implementation WService
- (void) setIdService: (int) newIdService
{
    idService = (newIdService >= 1 ? newIdService : -1);
}
- (int) getIdService {  return idService;}
- (void) setName: (NSString*) newName
{
    Name = ([UIController isValidString:newName] ? newName : @"Error");
}
- (NSString*) getName{ return Name; }
- (void) setHost: (NSString*) newHost
{
    Host = ([UIController isValidString:newHost] ? newHost : @"Error");
}
- (NSString*) getHost { return Host; }
- (void) setBaseService: (NSString*) newBaseService
{
    BaseService = ([UIController isValidString:newBaseService] ? newBaseService : @"Error");
}
- (NSString*) getBaseService { return BaseService; }
- (void) setImage: (NSString*) newImage
{
    Image = ([UIController isValidString:newImage] ? newImage : @"Error");
}
- (NSString*) getImage { return Image;  }
- (BOOL) isRegistered { return Registered; }
- (void) setFlagRegistered: (BOOL) registered { Registered = registered;}
- (BOOL) isRequireOAuth{ return RequireOAuth; }
- (void) setFlagRequireOAuth: (BOOL) requireOAuth{ RequireOAuth = requireOAuth; }
- (void) setOAuthVersion: (int) newOAuthVersion{
    OAuthVersion = (newOAuthVersion >=1 ? newOAuthVersion : -1);
}
- (int) getOAuthVersion{ return OAuthVersion; }
- (void) setFlagRequireTFSAuthentication: (BOOL) TFSAuthentication{ RequireTFSAuthentication = TFSAuthentication;}
- (BOOL) isRequireTFSAuthentication{ return RequireTFSAuthentication; }
- (void) setFlagRequireTFSDomain: (BOOL) TFSDomain{ RequireTFSDomain = TFSDomain; }
- (BOOL) isRequireTFSDomain{ return RequireTFSDomain;}
@end
