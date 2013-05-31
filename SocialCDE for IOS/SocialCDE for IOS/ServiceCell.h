//
//  ServiceCell.h
//  SocialCDE4IOS
//
//  Created by Floris on 24/05/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WService.h"

@interface ServiceCell : UITableViewCell

- (void) initSubviewObjects: (WService*) service;

@end

