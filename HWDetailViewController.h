//
//  HWDetailViewController.h
//  ManhattanCollegeApp
//
//  Created by Nick Monaco on 2/4/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HWDetailViewController;
@class HW;
@class HWTableViewController;

@protocol HWDetailViewControllerDelegate <NSObject>

- (void)hwDetailViewControllerDidCancel:(HWDetailViewController *)controller;
- (void)hwDetailViewController:(HWDetailViewController *)controller didAddHW:(HW *)HW;

@end


@interface HWDetailViewController : UITableViewController
{
    NSMutableArray *n;
    NSMutableArray *c;
    NSMutableArray *d;
    NSMutableArray *h;
    IBOutlet HWTableViewController *tableViewController;
}

@property (nonatomic, weak) id <HWDetailViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *detailLabel;
@property (strong, nonatomic) IBOutlet UITextField *dueDateLabel;
@property (strong, nonatomic) IBOutlet UITextField *numLabel;



- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;
- (IBAction)test:(id)sender;
- (IBAction)updateTextField:(id)sender;


@end
