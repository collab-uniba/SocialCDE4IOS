//
//  FirstViewController.m
//  SocialCDE for IOS
//
//  Created by Floris on 4/14/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import "FirstViewController.h"
#import "HomeView.h"
#import "WUser.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

-(void) startAnimationTextField:(UITextField*)campo
{
    campo.frame =CGRectMake(campo.frame.origin.x, (campo.frame.origin.y -100), campo.frame.size.width, campo.frame.size.height);
}
-(void) endAnimationTextField:(UITextField*)campo
{
    campo.frame =CGRectMake(campo.frame.origin.x, (campo.frame.origin.y +100), campo.frame.size.width, campo.frame.size.height);
}

-(void) startAnimationLabel:(UILabel*)campo
{
    campo.frame =CGRectMake(campo.frame.origin.x, (campo.frame.origin.y -100), campo.frame.size.width, campo.frame.size.height);
}


-(void) endAnimationLabel:(UILabel*)campo
{
    campo.frame =CGRectMake(campo.frame.origin.x, (campo.frame.origin.y +100), campo.frame.size.width, campo.frame.size.height);
}

- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == txtPassword) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        
        [self startAnimationLabel:lblTitle];
        [self startAnimationLabel:lblSubtitle];
        [self startAnimationLabel:lblAlert];
        
        [self startAnimationLabel:lblProxy];
        [self startAnimationTextField:txtProxy];
        [self startAnimationLabel:lblUsername];
        [self startAnimationTextField:txtUsername];
        [self startAnimationLabel:lblPassword];
        [self startAnimationTextField:txtPassword];
        
        
        [UIView commitAnimations];
    }
    
   
}

-(void) textFieldDidEndEditing:(UITextField *)textField
{
    if (textField == txtPassword) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelegate:self];
        [UIView setAnimationDuration:0.5];
        [UIView setAnimationBeginsFromCurrentState:YES];
        
        [self endAnimationLabel:lblTitle];
        [self endAnimationLabel:lblSubtitle];
        [self endAnimationLabel:lblAlert];
        
        [self endAnimationLabel:lblProxy];
        [self endAnimationTextField:txtProxy];
        [self endAnimationLabel:lblUsername];
        [self endAnimationTextField:txtUsername];
        [self endAnimationLabel:lblPassword];
        [self endAnimationTextField:txtPassword];
        
        
        [UIView commitAnimations];
    }
    
}

-(IBAction)HideKeyboardOnReturnBotton:(id)sender
{
    
    switch ([sender tag]) {
        case 1:
            [txtProxy resignFirstResponder];
            break;
        case 2:
            [txtUsername resignFirstResponder];
            break;
        case 3:
            [txtPassword resignFirstResponder];
            break;
        default:
            break;
    }
    
    
    
}

- (void)backgroundProcess
{
    [self performSelectorOnMainThread:@selector(setloadIndicator) withObject:nil waitUntilDone:NO];
    
    int flag = 0;
    
    NSString *strProxy = [[txtProxy text] stringByTrimmingCharactersInSet:[ NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *strUsername = [[txtUsername text] stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSString *strPassword = [[txtPassword text] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([UIController isValidString:strProxy]) {
        
        [[[UIController getController] getProxy] setHost:[txtProxy text ]];
        
        if (![[[UIController getController] getProxy] IsWebServiceRunning]) {
            
            flag = 1;
        }
    }
    else{ flag = 1;}
    
    if (![UIController isValidString:strUsername] && flag != 0) {
        flag = 2;
    }
    
    
    if (![UIController isValidString:strPassword] && flag != 0) {
        flag = 3;
    }
    
    
    
    switch (flag) {
        case 1:
            [lblAlert setText:@"Wrong proxy"];
            [lblAlert setHidden:FALSE];
            break;
        case 2:
            [lblAlert setText:@"Wrong username"];
            [lblAlert setHidden:FALSE];
            
            
        case 3:
            [lblAlert setText:@"Wrong password"];
            [lblAlert setHidden:FALSE];
            break;
    }
    
    if (flag != 0) {
        [self performSelectorOnMainThread:@selector(stoploadIndicator) withObject:nil waitUntilDone:NO];
    }
    
    if(flag==0)
    {
        
        WUser *currentUser = [[[UIController getController] getProxy] GetUser:strUsername password:strPassword];
        
        if (currentUser != nil) {
            [[UIController getController] setCurrentUser:currentUser];
            [[UIController getController] setCurrentUserPassword:strPassword];
            
            
            HomeView *homeWindow = [[HomeView alloc] initWithNibName:nil bundle:nil];
            
            
            homeWindow.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
            
           
            
            [self presentViewController:homeWindow animated:YES completion:nil];
           
             [self performSelectorOnMainThread:@selector(stoploadIndicator) withObject:nil waitUntilDone:NO];
        }
        else
        {
            
            
            [lblAlert setText:@"User credential not found"];
            [lblAlert setHidden:FALSE];
            
            [self performSelectorOnMainThread:@selector(stoploadIndicator) withObject:nil waitUntilDone:NO];
        }
        
    }
    
      
}

- (void) setloadIndicator
{
    [loadprocess startAnimating]; 
}

- (void) stoploadIndicator
{
    [loadprocess stopAnimating];
    [loadprocess setHidden:true];
}


- (IBAction)ActionLogin:(id)sender
{
   
    /*
    NSString *result =  [self getDataFrom:@"http://192.168.1.250:8081/SocialTFSProxy.svc/IsWebServiceRunning"];
    NSLog(@"risultato %@" , result);
    */
    
    [lblAlert setHidden:true]; 
    [loadprocess setHidden:false];
   
    [self performSelectorInBackground:@selector(backgroundProcess) withObject:nil];

}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Log in", @"Log in");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}
							
- (void)viewDidLoad
{
    [super viewDidLoad];
    [lblAlert setHidden:true];
    [txtProxy setPlaceholder:@"Type proxy adress here"];
    [txtUsername setPlaceholder:@"Type username here"];
    [txtPassword setPlaceholder:@"Type password here"];
    [loadprocess setHidden:true];
    txtPassword.delegate = self; 
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
