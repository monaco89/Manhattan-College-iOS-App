//
//  EmailViewController.m
//  MC
//
//  Created by Nick Monaco on 11/13/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import "EmailViewController.h"
#import "JNKeychain.h"

@interface EmailViewController () <UIWebViewDelegate, UIScrollViewDelegate>

@end

@implementation EmailViewController
@synthesize EmailWebView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSString *fullURL = @"http://gmail.manhattan.edu/";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [EmailWebView loadRequest:requestObj];
    
    self.EmailWebView.delegate = self;
    
    EmailWebView.scrollView.delegate = self;
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

-(IBAction)openActionSheet:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Open In Safari", nil];
    [actionSheet showInView:[self.view window]];
    
}

-(void) actionSheet: (UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    {
        if (buttonIndex ==0)
        {
            NSString *currentURL = EmailWebView.request.URL.absoluteString;
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:currentURL]];
        }
    }
}

- (void)updateButtons
{
    self.forward.enabled = self.EmailWebView.canGoForward;
    self.back.enabled = self.EmailWebView.canGoBack;
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
