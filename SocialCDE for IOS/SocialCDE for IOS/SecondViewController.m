//
//  SecondViewController.m
//  SocialCDE for IOS
//
//  Created by Floris on 4/14/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import "SecondViewController.h"
#import "HomeView.h"


@interface SecondViewController ()

@end

@implementation SecondViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Sign up", @"Sign up");
        self.tabBarItem.image = [UIImage imageNamed:@"second"];
    }
    return self;
}

- (IBAction)HideKeyboardOnReturnBotton:(id)sender
{
    switch ([sender tag]) {
        case 1:
            [txtProxy resignFirstResponder];
            break;
        case 2:
            [txtMail resignFirstResponder];
            break;
        case 3:
            [txtInvitatioCode resignFirstResponder];
            break;
        case 4:
            [txtUsername resignFirstResponder];
            break;
        case 5:
            [txtPassword1 resignFirstResponder];
            break;
        case 6:
            [txtPassword2 resignFirstResponder]; 
            break;
        default:
            break;
    }
}

- (IBAction)BtnRegister_action:(id)sender
{
    
    
    NSString *strProxy = [[txtProxy text] stringByTrimmingCharactersInSet:[ NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *strUsername = [[txtUsername text] stringByTrimmingCharactersInSet:[ NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *strInvitationCode = [[txtInvitatioCode text] stringByTrimmingCharactersInSet:[ NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *strMail = [[txtMail text] stringByTrimmingCharactersInSet:[ NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *strPassword1 = [[[txtPassword1 text] stringByTrimmingCharactersInSet:[ NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    NSString *strPassword2 = [[[txtPassword2 text] stringByTrimmingCharactersInSet:[ NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    if ([self checkRegisterData:strProxy username:strUsername invitation_code:strInvitationCode email:strMail password:strPassword1 second_password:strPassword2] ) {
        NSLog(@"Check registration data passed");
        
        if ([self checkNetworkStatus:strProxy username:strUsername]) {
            NSLog(@"Network status ok");
            int res = [[[UIController getController] getProxy] SubscribeUser:strMail username:strUsername password:strInvitationCode ];
            NSLog(@"Risultato %d", res); 
            NSString *error = [NSString alloc];
            bool flag = true;
            
            switch (res) {
                case 0:
                   
                    if ([[[UIController getController] getProxy] ChangePassword:strUsername oldpassword:strInvitationCode newpassword:strPassword1]) {
                        
                        
                        HomeView *loginWindow = [[HomeView alloc] initWithNibName:nil bundle:nil];
                        
                        
                        loginWindow.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
                        
                        [self presentViewController:loginWindow animated:YES completion:nil];
                        
                    }
                    else
                    {
                        error = @"Error to change password.";
                        flag = false; 
                    }
                    
                    break;
                case 1:
                    error = @"Email do not exists in database.";
                    flag = false; 
                    
                    break;
                case 2:
                    error = @"Password and Email do not match.";
                    flag = false; 
                    
                    break;
                case 3:
                    error = @"Username already used.";
                    flag = false; 
                    
                    break;
                default:
                    break;
            }
            
            if (!flag) {
                [lblAlert setText:error];
                [lblAlert setHidden:false]; 
            }
            
            
        }
        
    }

    
}

-(void) startAnimationField:(UIView*)campo offset: (int) offset
{
    campo.frame =CGRectMake(campo.frame.origin.x, (campo.frame.origin.y - offset), campo.frame.size.width, campo.frame.size.height);
}
-(void) endAnimationField:(UIView*)campo offset: (int) offset
{
    campo.frame =CGRectMake(campo.frame.origin.x, (campo.frame.origin.y + offset), campo.frame.size.width, campo.frame.size.height);
}

- (void) startAnimationMultipleField: (NSArray*) fields offset: (int) offset
{
    for (UIView *field in fields) {
        field.frame =CGRectMake(field.frame.origin.x, (field.frame.origin.y - offset), field.frame.size.width, field.frame.size.height);
    }
}

- (void) endAnimationMultipleField: (NSArray*) fields offset: (int) offset
{
    for (UIView *field in fields) {
        field.frame =CGRectMake(field.frame.origin.x, (field.frame.origin.y + offset), field.frame.size.width, field.frame.size.height);
    }
}

- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    
    NSArray *fields = [[NSArray alloc] initWithObjects:lblTitle,lblSubTitle,lblAlert,lblProxy,txtProxy,lblmail,txtMail,lblusername,txtUsername,lblInvitationCode,txtInvitatioCode, nil];
    
    if (textField == txtInvitatioCode) {
       
        
        [self startAnimationMultipleField:fields offset:20];
       
    }
    
    else if(textField == txtPassword1)
    {
        NSArray *pswd1_fields = [[NSArray alloc] initWithObjects:lblPassword1, txtPassword1, nil];
        
        [self startAnimationMultipleField:[fields arrayByAddingObjectsFromArray:pswd1_fields] offset:50];
    }
    
    else if (textField == txtPassword2)
    {
        NSArray * pswd2_fields = [[NSArray alloc] initWithObjects:lblPassword1,txtPassword1, lblPassword2,txtPassword2, nil];
        [self startAnimationMultipleField:[fields arrayByAddingObjectsFromArray:pswd2_fields] offset:100];
    }
    
     [UIView commitAnimations];
    
    
}

- (void) textFieldDidEndEditing:(UITextField *)textField
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDuration:0.5];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    
    NSArray *fields = [[NSArray alloc] initWithObjects:lblTitle,lblSubTitle,lblAlert,lblProxy,txtProxy,lblmail,txtMail,lblusername,txtUsername,lblInvitationCode,txtInvitatioCode, nil];
    
    if (textField == txtInvitatioCode) {
        
        [self endAnimationMultipleField:fields offset:20];
    }
    
    else if(textField == txtPassword1)
    {
        NSArray *pswd1_fields = [[NSArray alloc] initWithObjects:lblPassword1, txtPassword1, nil];
        [self endAnimationMultipleField:[fields arrayByAddingObjectsFromArray:pswd1_fields] offset:50];
    }
    else if (textField == txtPassword2)
    {
        NSArray * pswd2_fields = [[NSArray alloc] initWithObjects:lblPassword1,txtPassword1, lblPassword2,txtPassword2, nil];
        [self endAnimationMultipleField:[fields arrayByAddingObjectsFromArray:pswd2_fields] offset:100];
    }
    
     [UIView commitAnimations];
}

- (BOOL) checkNetworkStatus: (NSString*) strProxy username: (NSString*) strUsername
{
    int flag = 0;
    
    [[[UIController getController] getProxy] setHost:strProxy];
    
    if (![[[UIController getController] getProxy] IsWebServiceRunning]) {
        flag = 1; 
    }
  
    
    
    if( flag == 0 && ![[[UIController getController] getProxy] IsAvailable:strUsername])
    {
        flag = 2;
    }
    
    NSString *error = [NSString alloc];
    
    if (flag != 0) {
        switch (flag) {
            case 1:
                error = @"Incorrect proxy.";
                break;
            case 2:
                error = @"Username not available";
                break;
            default:
                break;
        }
        
        [lblAlert setText:error];
        [lblAlert setHidden:FALSE];
    }
    
    return (flag != 0 ? false : true); 
    
    
    }

- (BOOL) checkRegisterData: (NSString*) proxy username: (NSString*) username invitation_code: (NSString*) invitationCode email: (NSString*) email password: (NSString*) pswd1 second_password: (NSString*) pswd2
{
    int flag = 0;
   
    
    if (![UIController  isValidString:proxy]) {
        flag = 1;
    }
    else if (![UIController isValidString:username] && flag == 0)
    {
        flag = 2;
    }
    else if(![UIController isValidString:invitationCode] && flag == 0)
    {
        flag = 3;
    }
    else if (![UIController isValidString:email] && flag == 0)
    {
        flag = 4;
    }
    else if (![UIController isValidString:pswd1] && flag == 0)
    {
        flag = 5;
    }
    else if(![UIController isValidString:pswd2] && flag == 0)
    {
        flag = 6;
    }
    else if(![pswd1 isEqual:pswd2])
    {
        flag = 7;
    }
    
    NSString *error = [NSString alloc];
    
    if (flag != 0) {
        switch (flag) {
            case 1:
                error = @"Wrong proxy!";
                break;
            case 2:
                error = @"Wrong username.";
                break;
            case 3:
                error = @"Wrong invitation code.";
                break;
            case 4:
                error = @"Wrong email.";
                break;
            case 5:
                error = @"Wrong password.";
                break;
            case 6:
                error = @"Wrong second password.";
                break;
            case 7:
                error = @"Passord must be egual."; 
                break;
            default:
                break;
        }
        
        
            [lblAlert setText:error];
            [lblAlert setHidden:FALSE];
        
    }
    
    
    
    return ( flag != 0 ? false : true);


}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [lblAlert setHidden:true]; 
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
