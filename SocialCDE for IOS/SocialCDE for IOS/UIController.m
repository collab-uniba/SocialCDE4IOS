//
//  UIController.m
//  SocialCDE for IOS
//
//  Created by Floris on 4/17/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import "UIController.h"
#import "ProxyWrapper.h"
#import "WUser.h"

@implementation UIController

static UIController *controller; 
static WUser *currentUser;
static NSString *currentUserPassword;
static UINavigationController *nav; 


+(Boolean*) isValidString: (NSString*) value{
    NSLog(@"analisi valore %@",value);
    return ( value != [NSNull null] && ![value isEqualToString:@""]? true : false);
    
}

+(void) setNavigationController: (UIViewController*)view
{
    if(nav == nil)
    {
        NSLog(@"NavigationController creato");
        nav = [[UINavigationController alloc] initWithRootViewController:view];
    }
    else
    {
        NSLog(@"NavigationController inserito");
        [nav pushViewController:view animated:YES]; 
    }
    
}

+ (UINavigationController*) getNavigationController
{
    return nav;
}

+(void) popNavigationController
{
    [nav popViewControllerAnimated:YES]; 
}


+(UIController*)getController
{
    if (!controller) {
        [[self alloc] init ];
        
    }
    return controller;
}

+(id)alloc
{
    controller = [super alloc];
    return controller; 
}

-(id) init
{
    self = [super init];
    if(self != nil)
    {
        proxy = [ProxyWrapper alloc];
    }
    return self; 
}

- (ProxyWrapper*) getProxy
{
    return (proxy != nil ? proxy : [ProxyWrapper alloc]);
}

- (void) setCurrentUser:(WUser *)utente
{
    currentUser = utente;
}

- (WUser*) getCurrentUser{ return currentUser;  }

- (void) setCurrentUserPassword:(NSString *)newPassword
{
    currentUserPassword = ( [UIController isValidString:newPassword] ? newPassword : @"Error" );
}

- (NSString*) getCurrentUserPassword{ return currentUserPassword; }


@end
