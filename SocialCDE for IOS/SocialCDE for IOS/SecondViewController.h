//
//  SecondViewController.h
//  SocialCDE for IOS
//
//  Created by Floris on 4/14/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIController.h"

@interface SecondViewController : UIViewController <UITextFieldDelegate>
{
    IBOutlet UILabel *lblTitle;
    IBOutlet UILabel *lblSubTitle; 
    IBOutlet UILabel *lblAlert;
    IBOutlet UILabel *lblProxy;
    IBOutlet UITextField *txtProxy;
    IBOutlet UILabel *lblmail;
    IBOutlet UITextField *txtMail;
    IBOutlet UILabel *lblusername;
    IBOutlet UITextField *txtUsername;
    IBOutlet UILabel *lblInvitationCode;
    IBOutlet UITextField *txtInvitatioCode;
    IBOutlet UILabel *lblPassword1;
    IBOutlet UITextField *txtPassword1;
    IBOutlet UILabel *lblPassword2;
    IBOutlet UITextField *txtPassword2; 
}

- (IBAction)BtnRegister_action:(id)sender;
- (IBAction)HideKeyboardOnReturnBotton:(id)sender; 
@end

