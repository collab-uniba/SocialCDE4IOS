//
//  RequestUtility.m
//  SocialCDE for IOS
//
//  Created by Floris on 4/16/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import "RequestUtility.h"

@implementation RequestUtility
+ (NSString *) getRequest:(NSString *)url{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] >= 200 && [responseCode statusCode] <= 299){
        
        return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
    }
    else
    {
        NSLog(@"Error getting %@, HTTP status code %i", url, [responseCode statusCode]);
        return @"Error";
    }
    
    
}

+ (NSString *) postRequest:(NSString*) url body:(NSDictionary*) bodyValue{
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"POST"];
    [request setURL:[NSURL URLWithString:url]];
    
    NSLog(@"Url fornito %@",url);
    
/*
    NSDictionary *jsonDictionary = [NSDictionary dictionaryWithObject:objects forKey:keys];
 
    NSDictionary* jsonDictionary = @{
                          @"username" : @"Floriano",
                          @"password" : @"patrizio"
                          };
    */
    NSData *jsondata = [NSJSONSerialization dataWithJSONObject:bodyValue options:0 error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsondata encoding:NSUTF8StringEncoding];
    NSLog(@"stringa json %@",jsonString);
    [request setHTTPBody:jsondata];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if([responseCode statusCode] >= 200 && [responseCode statusCode] <= 299){
        
        return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
    }
    else
    {
        NSLog(@"Error getting %@, HTTP status code %i", url, [responseCode statusCode]);
        return @"Error";
    }
}
@end
