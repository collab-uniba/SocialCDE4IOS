//
//  ConversionUtility.m
//  SocialCDE for IOS
//
//  Created by Floris on 07/05/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import "ConversionUtility.h"
#import "WUser.h"
#import "WService.h"

@implementation ConversionUtility

+ (WUser* ) getSingleWUser:(NSString *)data
{
   
    
    if ([data isEqualToString:@""]) {
        return nil;
    }
    else
    {
        
        NSData *dataResponse = [data dataUsingEncoding:NSUTF8StringEncoding];
        
        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:dataResponse options:kNilOptions error:nil];
        NSLog(@"data response %@", data);
        
    NSLog(@"id %d" , [[jsonResponse objectForKey:@"Id"] intValue]);
    WUser *user = [WUser alloc];
    [user setIdUser: [[jsonResponse objectForKey:@"Id"] intValue]];
    [user setAvatar:[jsonResponse objectForKey:@"Avatar"]];
    [user setMail:[jsonResponse objectForKey:@"Email"]];
    [user setUsername:[jsonResponse objectForKey:@"Username"]];
    [user setFollowings:[[jsonResponse objectForKey:@"Followings"] intValue]];
    [user setFollowers:[[jsonResponse objectForKey:@"Followers"] intValue]];
    [user setStatuses:[[jsonResponse objectForKey:@"Statuses"] intValue]];
    NSLog(@"Followers %d" , [[jsonResponse objectForKey:@"Followers"] intValue]);
    NSLog(@"Followings %d" , [[jsonResponse objectForKey:@"Followings"] intValue]);
    
    NSLog(@"Statuses %d" , [[jsonResponse objectForKey:@"Statuses"] intValue]);
    return user;
    }
}

+ (NSArray*) getMultipleWService:(NSString *)data
{
    NSData *dataResponse = [data dataUsingEncoding:NSUTF8StringEncoding];
    
    NSArray *jsonResponse = [NSJSONSerialization JSONObjectWithData:dataResponse options:kNilOptions error:nil];
    
    NSEnumerator *e = [jsonResponse objectEnumerator];
    
    NSDictionary *service;
    
    NSArray *result = [[NSArray alloc] init];
    
    
    while (service = [e nextObject]) {
        
        WService *newService = [WService alloc];
        [newService setName:[service objectForKey:@"Name"]];
        [newService setHost:[service objectForKey:@"Host"]];
        [newService setBaseService:[service objectForKey:@"BaseService"]];
        [newService setIdService:[[service objectForKey:@"Id"] intValue]];
        [newService setImage:[service objectForKey:@"Image"]];
        [newService setOAuthVersion:[[service objectForKey:@"OAuthVersion"] intValue]];
        [newService setFlagRegistered:[[service objectForKey:@"Registered"] boolValue]];
        [newService setFlagRequireOAuth:[[service objectForKey:@"RequireOAuth"] boolValue]];
        [newService setFlagRequireTFSAuthentication:[[service objectForKey:@"RequireTFSAuthentication"] boolValue]];
        [newService setFlagRequireTFSDomain:[[ service objectForKey:@"RequireTFSDomain"] boolValue]];
      
        result = [result arrayByAddingObject:newService];
        
    }
    return result;
}
    
@end


