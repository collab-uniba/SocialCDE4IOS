//
//  WUser.m
//  SocialCDE for IOS
//
//  Created by Floris on 5/5/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import "WUser.h"

@implementation WUser

- (void) setIdUser:(int)newId
{
    idUser = ( newId != 0 ? newId : -1 );
}

- (int) getIdUser{ return idUser; }

- (void) setUsername:(NSString *)newUsername
{
    Username = ( ![newUsername isEqualToString:@""] ? newUsername : @"Error" );
}

- (NSString*) getUsername{ return Username;}

- (void) setMail:(NSString *)newEmail
{
    Mail = (![newEmail isEqualToString:@""] ? newEmail : @"Error");
}

- (NSString*) getEmail { return Mail; }

- (void) setAvatar:(NSString *)newAvatar
{
    Avatar = (![newAvatar isEqualToString:@""] ? newAvatar : @"Error");
}

- (NSString *) getAvatar { return Avatar;}

- (void) setStatuses:(int)newStatuses
{
    Statuses = newStatuses;
}

- (int) getStatuses {  return  Statuses; }

- (void) setFollowings:(int)newFollowings{ Following = newFollowings;}
- (int) getFollowings { return Following;}

- (void) setFollowers:(int)newFollowers {  Followers = newFollowers;}
- (int) getFollowers { return Followers;}

- (void) setFollowed:(BOOL)newFollowed { Followed = newFollowed;}
- (BOOL) isFollowed{ return Followed; }

@end
