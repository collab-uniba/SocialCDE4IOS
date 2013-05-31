//
//  ServiceCell.m
//  SocialCDE4IOS
//
//  Created by Floris on 24/05/13.
//  Copyright (c) 2013 Collab. All rights reserved.
//

#import "ServiceCell.h"
#import "WService.h"
#import "UIController.h"

@implementation ServiceCell

UIImageView *serviceImage;
UILabel *serviceName;
/*
 UIImageView *registeredBtn;
*/



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier 
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        NSLog(@"Inizializzazione cella");
        
        
        
        serviceImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 48, 48)];
        
         serviceName = [[UILabel alloc] initWithFrame:CGRectMake(80, 5, 150, 50)];
        /*
        registeredBtn = [[UIImageView alloc] initWithFrame:CGRectMake(210, 10, 48, 48)];
        */
        [self addSubview:serviceImage];
        [self addSubview:serviceName];
        //[self addSubview:registeredBtn];
        
        
        
        
    }
    return self;
}

- (void) initSubviewObjects: (WService*) service
{
    NSURL *imageURL = [NSURL URLWithString: [[[[UIController getController] getProxy] getBaseHost] stringByAppendingString:[service getImage]]];
    NSLog(@"url %@",[[[[UIController getController] getProxy] getBaseHost] stringByAppendingString:[service getImage]]);
    NSData *serviceImageData = [[NSData alloc] initWithContentsOfURL: imageURL];
    
    UIImage *serviceUImage = [UIImage imageWithData:serviceImageData ];
    
    [serviceImage setBackgroundColor:[UIColor blueColor]];
    serviceImage.image = serviceUImage;
    
    [serviceName setText:[service getName]];
  /*
    NSData *serviceImageButton = [[NSData alloc] initWithContentsOfFile:@"first.png"];
    
    [registeredBtn setImage:[UIImage imageWithData:serviceImageButton]];
    */
[self setNeedsDisplay];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
