//
//  HomeDriveViewController.m
//  MC
//
//  Created by Nick Monaco on 12/17/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import "HomeDriveViewController.h"
#import "JNKeychain.h"

@interface HomeDriveViewController ()  <UIWebViewDelegate, UIScrollViewDelegate>

@end

@implementation HomeDriveViewController
@synthesize HomeDriveWebView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSString *fullURL = @"http://drive.manhattan.edu/";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [HomeDriveWebView loadRequest:requestObj];
    
    self.HomeDriveWebView.delegate = self;
    
    HomeDriveWebView.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

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
            NSString *currentURL = HomeDriveWebView.request.URL.absoluteString;
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:currentURL]];
        }
    }
}

- (void)updateButtons
{
    self.forward.enabled = self.HomeDriveWebView.canGoForward;
    self.back.enabled = self.HomeDriveWebView.canGoBack;
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