//
//  HWTableViewController.m
//  ManhattanCollegeApp
//
//  Created by Nick Monaco on 2/4/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import "HWTableViewController.h"
#import "HW.h"
#import "HWCell.h"
#import "ViewController.h"

@implementation HWTableViewController

@synthesize homework;
@synthesize course;
@synthesize date;
@synthesize hws;
@synthesize num;

@synthesize saveContent;
NSString  *arrayPath;
@synthesize myTableView;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	if ([segue.identifier isEqualToString:@"AddAssignment"])
	{
		UINavigationController *navigationController = segue.destinationViewController;
		HWDetailViewController *hwDetailViewController = [[navigationController viewControllers] objectAtIndex:0];
		hwDetailViewController.delegate = self;
	}
}

-(NSString *) dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    return [documentsDirectory stringByAppendingPathComponent:@"Homework.plist"];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [hws count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	HWCell *cell = (HWCell *)[tableView dequeueReusableCellWithIdentifier:@"HWCell" forIndexPath:indexPath];
    
	cell.HWLabel.text = [hws objectAtIndex:indexPath.row];
	cell.classLabel.text = [course objectAtIndex:indexPath.row];
	cell.dueDateLabel.text = [date objectAtIndex:indexPath.row];
    cell.numLabel.text = [num objectAtIndex:indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != 5)
    {
	if (editingStyle == UITableViewCellEditingStyleDelete)
	{
        // load data
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        NSString *recentFilePath = [documentsDirectory stringByAppendingPathComponent:@"Homework.plist"];
        NSMutableArray *recentArray = [[NSMutableArray alloc] initWithContentsOfFile:recentFilePath];
        
        
        hws = [recentArray objectAtIndex:0];
        course = [recentArray objectAtIndex:1];
        date = [recentArray objectAtIndex:2];
        num = [recentArray objectAtIndex:3];
        
        
        NSLog(@"%@", hws);
        NSLog(@"%@", course);
        NSLog(@"%@", date);
        NSLog(@"%@", num);

        //remove data
		[hws removeObjectAtIndex:indexPath.row];
        [course removeObjectAtIndex:indexPath.row];
        [date removeObjectAtIndex:indexPath.row];
        [num removeObjectAtIndex:indexPath.row];
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        // write data
        NSLog(@"Write.");
        
        NSString *documentsDirectory2 = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *finalPath = [documentsDirectory2 stringByAppendingPathComponent:@"Homework.plist"];
        
        NSMutableDictionary *hwPlist = [[NSMutableDictionary alloc] initWithContentsOfFile:finalPath];
        NSMutableArray *hwArray = [hwPlist objectForKey:@"Roots"];
        
        if (hwArray == nil) {
            hwArray = [[NSMutableArray alloc] init];
        }
        
        [hwArray addObject:hws];
        
        [hwArray addObject:course];
        
        [hwArray addObject:date];
        
        [hwArray addObject:num];
        
        [hwArray writeToFile:finalPath atomically:YES];
        
	}
    }}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
}

#pragma mark - PlayerDetailsViewControllerDelegate

- (void)hwDetailViewControllerDidCancel:(HWDetailViewController *)controller
{
	[self dismissViewControllerAnimated:YES completion:nil];
}

// remove
- (void)hwDetailViewController:(HWDetailViewController *)controller didAddHW:(HW *)hw
{/*
	[self.homework addObject:hw];
    
	NSIndexPath* indexPath = [NSIndexPath indexPathForRow:[hws count] - 1 inSection:0];
	[self.tableView insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    */
	[self dismissViewControllerAnimated:YES completion:nil];
}
//


-(void)viewDidLoad
{
    [super viewDidLoad];
    
    homework = [NSMutableArray arrayWithCapacity:20];

    NSError *error;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); //1
    
    NSString *documentsDirectory = [paths objectAtIndex:0]; //2
    
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"Homework.plist"]; //3
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if (![fileManager fileExistsAtPath: path]) //4
        
    {
        
        NSString *bundle = [[NSBundle mainBundle] pathForResource:@"Homework" ofType:@"plist"]; //5
        
        [fileManager copyItemAtPath:bundle toPath: path error:&error]; //6
        
    }
    
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:path];
    
    NSString *errorDesc = nil;
    
    NSPropertyListFormat format;
    
    NSDictionary *temp = (NSDictionary *) [NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    
    if (!temp)
    {
      //  NSLog(@"Error reading plist: %@, format %d", errorDesc, format);
    }

    hws = [[NSMutableArray alloc] initWithCapacity:20];
    course = [[NSMutableArray alloc] initWithCapacity:20];
    date = [[NSMutableArray alloc] initWithCapacity:20];
    num = [[NSMutableArray alloc] initWithCapacity:20];
    
    NSArray *paths2 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory2 = [paths2 objectAtIndex:0];
    
    NSString *recentFilePath = [documentsDirectory2 stringByAppendingPathComponent:@"Homework.plist"];
    NSMutableArray *recentArray = [[NSMutableArray alloc] initWithContentsOfFile:recentFilePath];
    
    hws = [recentArray objectAtIndex:0];
    course = [recentArray objectAtIndex:1];
    date = [recentArray objectAtIndex:2];
    num = [recentArray objectAtIndex:3];
    
    
    NSLog(@"%@",hws);
    NSLog(@"%@",course);
    NSLog(@"%@",date);
    NSLog(@"%@",num);
    
    // refresh view controller
    
    
}



@end
