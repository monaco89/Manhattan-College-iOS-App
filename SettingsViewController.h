//
//  SettingsViewController.h
//  MC
//
//  Created by Nick Monaco on 8/17/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray *tableData;
}

-(IBAction)rate:(id)sender;

@end
