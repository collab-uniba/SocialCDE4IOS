//
//  HomeView.m
//  SocialCDE for IOS
//
//  Created by Floris on 5/4/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import "HomeView.h"
#import "UIController.h"
#import "ServiceCell.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface HomeView ()

@end

@implementation HomeView

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"Avatar utente %@", [[[UIController getController] getCurrentUser] getAvatar]);
    
    NSURL *imgUrl = [NSURL URLWithString: [[[UIController getController] getCurrentUser] getAvatar]];
    NSData *imgData = [[NSData alloc] initWithContentsOfURL:imgUrl];
    UIImage *finalImage = [UIImage imageWithData:imgData];
    [avatar setImage:finalImage];
    
    [lblusername setText:[[lblusername text] stringByAppendingString:[[[UIController getController] getCurrentUser] getUsername]]];
    
    [ lblfollower setText: [[lblfollower text] stringByAppendingFormat:@"%d", [[[UIController getController] getCurrentUser] getFollowers]]];
    
    
    [lblfollowings setText: [[lblfollowings text] stringByAppendingFormat: @"%d",  [[[UIController getController] getCurrentUser] getFollowings]]];
    
    [ lblposts setText:[[lblposts text] stringByAppendingFormat:@"%d", [[[UIController getController] getCurrentUser] getStatuses]]];
    
    NSLog(@"Current user statuses %d" , [[[UIController getController] getCurrentUser] getStatuses]); 
    
     services = [[[UIController getController] getProxy] GetServices:[[[UIController getController] getCurrentUser] getUsername] password:[[UIController getController] getCurrentUserPassword]];
    NSLog(@"servizi ottenuti %d", [services count]);
    }

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}



- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [services count]; 
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 48;
}

- (UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ServiceCell *custom_cell = (ServiceCell*)[tableView dequeueReusableCellWithIdentifier:@"service"];
    
    if (custom_cell == nil) {
        custom_cell = [[ServiceCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"service"];
        [custom_cell initSubviewObjects:[services objectAtIndex:indexPath.row]];
        
    }
    else
    {
    custom_cell = [[ServiceCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"service"];
     [custom_cell initSubviewObjects:[services objectAtIndex:indexPath.row]];
    }
    return custom_cell;
}

- (IBAction)Btn_logout:(id)sender
{
    UITabBarController *tab = [[UITabBarController alloc] init];
   
    UIViewController *viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    UIViewController *viewController2 = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
        tab.viewControllers = @[viewController1, viewController2];

        
    
        
    
    [self presentViewController:tab animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
