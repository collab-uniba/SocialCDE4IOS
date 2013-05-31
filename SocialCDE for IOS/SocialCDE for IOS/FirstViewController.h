//
//  FirstViewController.h
//  SocialCDE for IOS
//
//  Created by Floris on 4/14/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIController.h"
@interface FirstViewController : UIViewController <UITextFieldDelegate>
    {
        IBOutlet UILabel *lblTitle;
        IBOutlet UILabel *lblSubtitle; 
        
        IBOutlet UILabel *lblAlert;
        
        IBOutlet UILabel *lblProxy;
        IBOutlet UITextField *txtProxy;
        
        IBOutlet UILabel *lblUsername;
        IBOutlet UITextField *txtUsername;
        
        IBOutlet UILabel *lblPassword;
        IBOutlet UITextField *txtPassword;
        
        IBOutlet UIActivityIndicatorView *loadprocess; 
        
    }
- (IBAction)ActionLogin:(id)sender;
- (IBAction)HideKeyboardOnReturnBotton:(id)sender;

@end
