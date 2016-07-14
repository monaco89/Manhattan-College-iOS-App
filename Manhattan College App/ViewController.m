//
//  ViewController.m
//  Manhattan College App
//
//  Created by Nick Monaco on 2/3/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import "ViewController.h"
#import "HWTableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)facebook
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.facebook.com/ManhattanCollegeEdu"]];
}

-(IBAction)twitter
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://twitter.com/MCStudAct"]];
}

-(IBAction)instagram
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://instagram.com/ManhattanEdu"]];
}

-(IBAction)switchController:(id)sender
{
   // NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    //NSMutableArray *loadData = [defaults objectForKey:@"saveData"];
    
    
    
    
    [self performSegueWithIdentifier:@"HW" sender:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /*
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentSize:(CGSizeMake(320, 535))];
     */
}

- (void)viewDidAppear:(BOOL)animated {
    [self.scrollView setScrollEnabled:YES];
    [self.scrollView setContentSize:(CGSizeMake(320, 537))];
    
    //self.screenName = @"Home screen";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
