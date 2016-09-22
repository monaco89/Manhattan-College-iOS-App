//
//  ViewController.h
//  Manhattan College App
//
//  Created by Nick Monaco on 2/3/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
   
}

-(IBAction)twitter;
-(IBAction)facebook;
-(IBAction)instagram;
-(IBAction)switchController:(id)sender;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
