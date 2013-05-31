//
//  RequestUtility.h
//  SocialCDE for IOS
//
//  Created by Floris on 4/16/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestUtility : NSObject


+ (NSString *) getRequest:(NSString *)url;
+ (NSString *) postRequest:(NSString*) url body:(NSDictionary*) bodyValue;
@end
