//
//  GrubhubViewController.h
//  MC
//
//  Created by Nick Monaco on 8/13/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GrubhubViewController : UIViewController <UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *GrubhubWebView;

-(IBAction)openActionSheet:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forward;

- (void)updateButtons;

@end
