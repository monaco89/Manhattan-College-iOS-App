//
//  LibraryViewController.m
//  Manhattan College App
//
//  Created by Nick Monaco on 2/3/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import "LibraryViewController.h"

@interface LibraryViewController () <UIWebViewDelegate, UIScrollViewDelegate>

@end

@implementation LibraryViewController
@synthesize LibWebView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *fullURL = @"http://lib.manhattan.edu/";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [LibWebView loadRequest:requestObj];
	// Do any additional setup after loading the view.
    
    self.LibWebView.delegate = self;
    
    LibWebView.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)openActionSheet:(id)sender;
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Open In Safari", nil];
    [actionSheet showInView:[self.view window]];
    
}

-(void) actionSheet: (UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    {
        if (buttonIndex ==0)
        {
            NSString *currentURL = LibWebView.request.URL.absoluteString;
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:currentURL]];
        }
    }
}

- (void)updateButtons
{
    self.forward.enabled = self.LibWebView.canGoForward;
    self.back.enabled = self.LibWebView.canGoBack;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self updateButtons];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateButtons];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateButtons];
}


@end
