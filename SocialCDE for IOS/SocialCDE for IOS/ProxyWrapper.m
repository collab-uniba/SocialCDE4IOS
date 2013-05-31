//
//  ProxyWrapper.m
//  SocialCDE for IOS
//
//  Created by Floris on 4/17/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import "ProxyWrapper.h"
#import "ConversionUtility.h"

static NSString *host = @"";
static NSString *baseHost = @"";
@implementation ProxyWrapper


- (void) setHost: (NSString*)newHost
{
     host = [newHost stringByAppendingString: @"/SocialTFSProxy.svc"];
     baseHost = newHost;
}

-(NSString*) getHost
{
    return host;
}

- (NSString*) getBaseHost
{
    return  baseHost; 
}

- (Boolean) IsWebServiceRunning
{
    NSString *url = [host stringByAppendingString:@"/IsWebServiceRunning"];
    NSString *response = [RequestUtility getRequest: url];
    
    if ([response isEqualToString:@"true"]) {
        return true;
    }
    else
    {
        return false;
    }
    
    
}

- (Boolean) IsAvailable: (NSString *) username
{
    NSString *url = [host stringByAppendingString:[@"/IsAvailable?username=" stringByAppendingString:username]];
    
    NSString *response = [RequestUtility getRequest:url];
    
    if ([response isEqualToString:@"true"]) {
        return true;
    }
    else
    {
        return false;
    }
    
}

- (WUser*) GetUser:(NSString *)username password:(NSString *)password
{
    NSString *url = [host stringByAppendingString:@"/GetUser"];
    
    NSLog(@"url proxy wrapper %@",url);
    
    NSDictionary *body = @{
                           @"username" : username,
                           @"password" : password
                           };
    NSString *response = [RequestUtility postRequest:url body:body];
    NSLog(@"risposta post %@",response);
    
    if (![response isEqualToString:@"Error"]) {
        return [ConversionUtility getSingleWUser:response];
    }
    else
    {
        return nil;
    }

}

-(NSArray *)GetServices:(NSString *)username password:(NSString *)password
{
    NSString *url = [host stringByAppendingString:@"/GetServices"];
    
    NSLog(@"url proxy wrapper %@",url);
    
    NSDictionary *body = @{
                           @"username" : username,
                           @"password" : password
                           };
    NSString *response = [RequestUtility postRequest:url body:body];
    NSLog(@"risposta post %@",response);
    
    if (![response isEqualToString:@"Error"]) {
        return [ConversionUtility getMultipleWService:response];
    }
    else
    {
        return nil;
    }
    

}

- (int) SubscribeUser:(NSString *)mail username:(NSString *)username password:(NSString *)password
{
    NSString *url = [host stringByAppendingString:@"/SubscribeUser"];
    
    NSDictionary *body = @{
                           @"email" : mail,
                           @"username" : username,
                           @"password" : password
                           };
    NSString *response = [RequestUtility postRequest:url body:body];
    
    if (![response isEqualToString:@"Error"]) {
    
        return [response intValue]; 
    }
    else
    {
        return 25;
    }
    
}

- (Boolean) ChangePassword:(NSString *)username oldpassword:(NSString *)oldpswd newpassword:(NSString *)newpswd
{
    NSString *url = [host stringByAppendingString:@"/ChangePassword"];
    
    NSDictionary *body = @{
                           @"username" : username,
                           @"oldPassword": oldpswd,
                           @"newPassword": newpswd
                           };
    
    NSString *response = [RequestUtility postRequest:url body:body];
    
    NSLog(@"Risposta change password %@", response); 
    
    if (![response isEqualToString:@"Error"] || [response isEqualToString:@"true"]){
        return true;
    }
    else
    {
        return false;
    }
    
}

@end
