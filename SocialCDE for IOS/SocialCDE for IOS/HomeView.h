//
//  HomeView.h
//  SocialCDE for IOS
//
//  Created by Floris on 5/4/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeView : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UIImageView *avatar;
    IBOutlet UILabel *lblusername;
    IBOutlet UILabel *lblposts;
    IBOutlet UILabel *lblfollower;
    IBOutlet UILabel *lblfollowings;
    IBOutlet UIScrollView *scrollView;
    IBOutlet UITableView *serviceView;
    IBOutlet UIButton *logout; 
    NSArray *services; 
    
}

- (IBAction)Btn_logout:(id)sender; 
@end
