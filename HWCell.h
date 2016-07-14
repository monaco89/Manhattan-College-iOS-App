//
//  HWCell.h
//  ManhattanCollegeApp
//
//  Created by Nick Monaco on 2/3/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HWCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *HWLabel;
@property (nonatomic, strong) IBOutlet UILabel *classLabel;
@property (nonatomic, strong) IBOutlet UILabel *dueDateLabel;
@property (nonatomic, strong) IBOutlet UILabel *numLabel;

@end
