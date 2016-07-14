//
//  HWTableViewController.h
//  ManhattanCollegeApp
//
//  Created by Nick Monaco on 2/4/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HWDetailViewController.h"

@interface HWTableViewController : UITableViewController <HWDetailViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *homework;
@property (nonatomic, strong) NSMutableArray *course;
@property (nonatomic, strong) NSMutableArray *date;
@property (nonatomic, strong) NSMutableArray *hws;
@property (nonatomic, strong) NSMutableArray *num;

@property (nonatomic, strong) NSMutableArray *saveContent;

-(NSString *) dataFilePath;

@property (weak,nonatomic)IBOutlet UITableView *myTableView;

@end
