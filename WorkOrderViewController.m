//
//  WorkOrderViewController.m
//  MC
//
//  Created by Nick Monaco on 3/3/15.
//  Copyright (c) 2015 Monaco Software Productions. All rights reserved.
//

#import "WorkOrderViewController.h"

@interface WorkOrderViewController () <UIWebViewDelegate, UIScrollViewDelegate>

@end

@implementation WorkOrderViewController
@synthesize WOWebView;



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Which Service" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"ITS" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSString *fullURL = @"http://hosted.micromain.com/Manhattan/WebRequest/WRNew.aspx";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [WOWebView loadRequest:requestObj];
        
        self.WOWebView.delegate = self;
        
        WOWebView.scrollView.delegate = self;
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Physical Plant" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSString *fullURL = @"https://docs.google.com/a/manhattan.edu/forms/d/1rRM3SLxYPrrV47Ve3V0Irq0dpyCvUEI2vkBPq-pmXxA/viewform?fbzx=-1341163421992974385";
        NSURL *url = [NSURL URLWithString:fullURL];
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
        [WOWebView loadRequest:requestObj];
        
        self.WOWebView.delegate = self;
        
        WOWebView.scrollView.delegate = self;
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [self closeAlertview];
    }]];
    
    dispatch_async(dispatch_get_main_queue(), ^ {
        [self presentViewController:alertController animated:YES completion:nil];
    });
    
}

-(void)closeAlertview
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
        NSString *currentURL = WOWebView.request.URL.absoluteString;
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:currentURL]];
        
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    // Present action sheet.
    [self presentViewController:actionSheet animated:YES completion:nil];
    
}

- (void)updateButtons
{
    self.forward.enabled = self.WOWebView.canGoForward;
    self.back.enabled = self.WOWebView.canGoBack;
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
