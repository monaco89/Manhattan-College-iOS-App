//
//  DegreeWorksViewController.m
//  Manhattan College App
//
//  Created by Nick Monaco on 2/3/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import "DegreeWorksViewController.h"
#import "JNKeychain.h"

@interface DegreeWorksViewController () <UIWebViewDelegate, UIScrollViewDelegate>

@end

@implementation DegreeWorksViewController
@synthesize DegreeWebView;

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
    
    NSString *fullURL = @"https://dgww.manhattan.edu/IRISLink.cgi?CAS=ENABLED&SERVICE=LOGON&SCRIPT=SD2WORKS&";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [DegreeWebView loadRequest:requestObj];
	// Do any additional setup after loading the view.
    
    self.DegreeWebView.delegate = self;
    
    DegreeWebView.scrollView.delegate = self;
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
            NSString *currentURL = DegreeWebView.request.URL.absoluteString;
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:currentURL]];
        }
    }
}

- (void)updateButtons
{
    self.forward.enabled = self.DegreeWebView.canGoForward;
    self.back.enabled = self.DegreeWebView.canGoBack;
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
    
    NSString *Pkey = @"passwordKey";
    NSString *Ukey = @"usernameKey";
    
    
    NSString *userId = [JNKeychain loadValueForKey:Ukey];
    NSString *password = [JNKeychain loadValueForKey:Pkey];

    
    if(userId != nil && password != nil )
    {
        
        NSString*  jScriptString1 = [NSString  stringWithFormat:@"document.getElementById('username').value='%@'", userId];
        
        NSString*  jScriptString2 = [NSString stringWithFormat:@"document.getElementById('password').value='%@'", password];
        
        [webView stringByEvaluatingJavaScriptFromString:jScriptString1];
        [webView stringByEvaluatingJavaScriptFromString:jScriptString2];
        [webView stringByEvaluatingJavaScriptFromString:@"document.forms['login_form'].submit();"];
    }
    

}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self updateButtons];
}


@end
