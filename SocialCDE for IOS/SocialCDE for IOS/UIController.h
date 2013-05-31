//
//  UIController.h
//  SocialCDE for IOS
//
//  Created by Floris on 4/17/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProxyWrapper.h"


@interface UIController : NSObject
{
    ProxyWrapper *proxy;
    
    
}
+ (UIController*) getController;
+ (Boolean*) isValidString: (NSString*) value;
- (ProxyWrapper*) getProxy;
- (void) setCurrentUser: (WUser*) utente;
- (WUser*) getCurrentUser;
- (void) setCurrentUserPassword: (NSString*) newPassword;
- (NSString*) getCurrentUserPassword;
+(void) setNavigationController: (UIViewController*)view;
+(void) popNavigationController;
+ (UINavigationController*) getNavigationController;
@end

