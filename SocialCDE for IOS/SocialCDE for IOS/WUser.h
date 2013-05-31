//
//  WUser.h
//  SocialCDE for IOS
//
//  Created by Floris on 5/5/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WUser : NSObject
{
    int idUser;
    NSString *Username;
    NSString *Mail;
    NSString *Avatar;
    int Statuses;
    int Following;
    int Followers;
    BOOL Followed;
}

- (void) setIdUser: (int) newId;
- (int) getIdUser;
- (void) setUsername: (NSString*) newUsername;
- (NSString *) getUsername;
- (void) setMail : (NSString *) newEmail;
- (NSString *) getEmail;
- (void) setAvatar: (NSString *) newAvatar;
- (NSString *) getAvatar;
- (void) setStatuses: (int) newStatuses;
- (int) getStatuses;
- (void) setFollowings: (int) newFollowings;
- (int) getFollowings;
- (void) setFollowers: (int) newFollowers;
- (int) getFollowers;
- (void) setFollowed: (BOOL) newFollowed;
- (BOOL) isFollowed; 

@end



