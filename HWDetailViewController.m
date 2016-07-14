//
//  HWDetailViewController.m
//  ManhattanCollegeApp
//
//  Created by Nick Monaco on 2/4/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import "HWDetailViewController.h"
#import "HW.h"
#import "HWTableViewController.h"
#import "ViewController.h"

@interface HWDetailViewController ()

@end

@implementation HWDetailViewController
@synthesize delegate;
@synthesize nameTextField;
@synthesize detailLabel;
@synthesize dueDateLabel;
@synthesize numLabel;

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if ((self = [super initWithCoder:aDecoder]))
	{
		NSLog(@"init HWDetailViewController");
		
	}
	return self;
}

- (void)dealloc
{
	NSLog(@"dealloc HWDetailViewController");
}

-(void)updateTextField:(id)sender
{
    NSDate * dateSelected = ((UIDatePicker *) sender).date;
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    //[formatter setDateFormat:@"dd/MM h:mm a"];
    [formatter setDateFormat:@"EEE LLL"];
    self.dueDateLabel.text = [formatter stringFromDate:dateSelected];
    
    NSDateFormatter * formatterNum = [[NSDateFormatter alloc]init];
    //[formatter setDateFormat:@"dd/MM h:mm a"];
    [formatterNum setDateFormat:@"dd"];
    self.numLabel.text = [formatterNum stringFromDate:dateSelected];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (indexPath.section == 0)
		[self.nameTextField becomeFirstResponder];
    if (indexPath.section == 1)
		[self.detailLabel becomeFirstResponder];
    if (indexPath.section == 2)
    {
		//[self.dueDateLabel becomeFirstResponder];
    }
    
}

- (IBAction)cancel:(id)sender
{
	[self.delegate hwDetailViewControllerDidCancel:self];
    NSLog(@"Cancel.");
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)done:(id)sender
{
    // load data
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *recentFilePath = [documentsDirectory stringByAppendingPathComponent:@"Homework.plist"];
    NSMutableArray *recentArray = [[NSMutableArray alloc] initWithContentsOfFile:recentFilePath];
    
    
    h = [recentArray objectAtIndex:0];
    c = [recentArray objectAtIndex:1];
    d = [recentArray objectAtIndex:2];
    n = [recentArray objectAtIndex:3];
    
    
    NSLog(@"%@", h);
    NSLog(@"%@", c);
    NSLog(@"%@", d);
    NSLog(@"%@", n);
    
    // add Data
    [h addObject:nameTextField.text];
    
    [c addObject:detailLabel.text];
    
    [d addObject:dueDateLabel.text];
    
    [n addObject:numLabel.text];
    
    NSLog(@"%@", h);
    NSLog(@"%@", c);
    NSLog(@"%@", d);
    NSLog(@"%@", n);
    
    // write data
    NSLog(@"Write.");
    
    NSString *documentsDirectory2 = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *finalPath = [documentsDirectory2 stringByAppendingPathComponent:@"Homework.plist"];
    
    NSMutableDictionary *hwPlist = [[NSMutableDictionary alloc] initWithContentsOfFile:finalPath];
    NSMutableArray *hwArray = [hwPlist objectForKey:@"Roots"];
    
    if (hwArray == nil) {
        hwArray = [[NSMutableArray alloc] init];
    }
    
    [hwArray addObject:h];
    
    [hwArray addObject:c];
    
    [hwArray addObject:d];
    
    [hwArray addObject:n];
    
    [hwArray writeToFile:finalPath atomically:YES];
    
    
    //switch controllers
    /*
    [self.delegate hwDetailViewControllerDidCancel:self];
    NSLog(@"Done.");  */
    
    
}
- (IBAction)test:(id)sender
{
    NSLog(@"test");
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"Done"])
    {
        // load data
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        
        NSString *recentFilePath = [documentsDirectory stringByAppendingPathComponent:@"Homework.plist"];
        NSMutableArray *recentArray = [[NSMutableArray alloc] initWithContentsOfFile:recentFilePath];
        
        
        h = [recentArray objectAtIndex:0];
        c = [recentArray objectAtIndex:1];
        d = [recentArray objectAtIndex:2];
        n = [recentArray objectAtIndex:3];
        
        
        NSLog(@"%@", h);
        NSLog(@"%@", c);
        NSLog(@"%@", d);
        NSLog(@"%@", n);
        
        // add Data
        [h addObject:nameTextField.text];
        
        [c addObject:detailLabel.text];
        
        [d addObject:dueDateLabel.text];
        
        [n addObject:numLabel.text];
        
        NSLog(@"%@", h);
        NSLog(@"%@", c);
        NSLog(@"%@", d);
        NSLog(@"%@", n);
        
        // write data
        NSLog(@"Write.");
        
        NSString *documentsDirectory2 = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        NSString *finalPath = [documentsDirectory2 stringByAppendingPathComponent:@"Homework.plist"];
        
        NSMutableDictionary *hwPlist = [[NSMutableDictionary alloc] initWithContentsOfFile:finalPath];
        NSMutableArray *hwArray = [hwPlist objectForKey:@"Roots"];
        
        if (hwArray == nil) {
            hwArray = [[NSMutableArray alloc] init];
        }
        
        [hwArray addObject:h];
        
        [hwArray addObject:c];
        
        [hwArray addObject:d];
        
        [hwArray addObject:n];
        
        [hwArray writeToFile:finalPath atomically:YES];
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    h = [[NSMutableArray alloc] initWithCapacity:10];
    c = [[NSMutableArray alloc] initWithCapacity:10];
    d = [[NSMutableArray alloc] initWithCapacity:10];
    n = [[NSMutableArray alloc] initWithCapacity:10];
    
    
    UIDatePicker *datePicker = [[UIDatePicker alloc]init];
    
    [datePicker setDate:[NSDate date]];
    [datePicker addTarget:self action:@selector(updateTextField:) forControlEvents:UIControlEventValueChanged];
    [dueDateLabel setInputView:datePicker];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
