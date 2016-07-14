//
//  HomeDriveViewController.h
//  MC
//
//  Created by Nick Monaco on 12/17/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeDriveViewController : UIViewController <UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *HomeDriveWebView;

-(IBAction)openActionSheet:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forward;

- (void)updateButtons;


@end
