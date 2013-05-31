//
//  ConversionUtility.h
//  SocialCDE for IOS
//
//  Created by Floris on 07/05/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WUser.h"
#import "WService.h"
@interface ConversionUtility : NSObject
    + (WUser*) getSingleWUser: (NSString *) data;
    + (NSArray*) getMultipleWService: (NSString*) data; 
@end
