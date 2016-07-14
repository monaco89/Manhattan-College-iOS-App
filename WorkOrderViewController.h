//
//  WorkOrderViewController.h
//  MC
//
//  Created by Nick Monaco on 3/3/15.
//  Copyright (c) 2015 Monaco Software Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkOrderViewController : UIViewController <UIActionSheetDelegate>

@property (strong, nonatomic) IBOutlet UIWebView *WOWebView;

-(IBAction)openActionSheet:(id)sender;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *back;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forward;

- (void)updateButtons;


@end
