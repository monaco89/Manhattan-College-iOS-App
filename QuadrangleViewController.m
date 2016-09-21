//
//  QuadrangleViewController.m
//  MC
//
//  Created by Nick Monaco on 12/23/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import "QuadrangleViewController.h"

@interface QuadrangleViewController () <UIWebViewDelegate, UIScrollViewDelegate>

@end

@implementation QuadrangleViewController
@synthesize QuadWebView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSString *fullURL = @"http://mc360.maytag.com";
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    [QuadWebView loadRequest:requestObj];
    
    self.QuadWebView.delegate = self;
    
    QuadWebView.scrollView.delegate = self;
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
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        // Cancel button tappped.
        //        [self dismissViewControllerAnimated:YES completion:^{
        //        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Open In Safari" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        // OK button tapped.
        NSString *currentURL = QuadWebView.request.URL.absoluteString;
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:currentURL]];
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    // Present action sheet.
    [self presentViewController:actionSheet animated:YES completion:nil];
    
}

- (void)updateButtons
{
    self.forward.enabled = self.QuadWebView.canGoForward;
    self.back.enabled = self.QuadWebView.canGoBack;
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
