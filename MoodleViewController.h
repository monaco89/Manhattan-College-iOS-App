//
//  MoodleViewController.h
//  Manhattan College App
//
//  Created by Nick Monaco on 2/3/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MoodleViewController : UIViewController <UIActionSheetDelegate>
{
    UINavigationBar *navBar;
    BOOL webViewScrollIsDragging;
    BOOL webViewScrollIsDecelerating;
    
}

@property (strong, nonatomic) IBOutlet UIWebView *MoodleWebView;

-(IBAction)openActionSheet:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forward;

- (void)updateButtons;

@end
