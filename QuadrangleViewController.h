//
//  QuadrangleViewController.h
//  MC
//
//  Created by Nick Monaco on 12/23/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuadrangleViewController : UIViewController <UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *QuadWebView;

-(IBAction)openActionSheet:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forward;

- (void)updateButtons;


@end
