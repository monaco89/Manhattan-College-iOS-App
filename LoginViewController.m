//
//  LoginViewController.m
//  MC
//
//  Created by Nick Monaco on 11/13/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import "LoginViewController.h"
#import <Security/Security.h>
#import "JNKeychain.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize loginLbl;
@synthesize UsernameTxtFld;
@synthesize passwordTxtFld;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    Pkey = @"passwordKey";
    Ukey = @"usernameKey";
    
    if ([JNKeychain loadValueForKey:Ukey] != nil ) {
        UsernameTxtFld.text = [JNKeychain loadValueForKey:Ukey];
    }
    
    if ([JNKeychain loadValueForKey:Pkey] != nil) {
        passwordTxtFld.text = [JNKeychain loadValueForKey:Pkey];
    }
    
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

- (IBAction)login:(id)sender
{
    NSString *username = self.UsernameTxtFld.text;
    NSString *password = self.passwordTxtFld.text;
    Pkey = @"passwordKey";
    Ukey = @"usernameKey";
    
    if ([JNKeychain saveValue:password forKey:Pkey]) {
        NSLog(@"Correctly saved value '%@' for key '%@'", password, Pkey);
    } else {
        NSLog(@"Failed to save!");
    }
    
    if ([JNKeychain saveValue:username forKey:Ukey]) {
        NSLog(@"Correctly saved value '%@' for key '%@'", username, Ukey);
    } else {
        NSLog(@"Failed to save!");
    }
    
    NSLog(@"login saved");
    
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Login Successful" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)logout:(id)sender
{
    NSString *username = nil;
    NSString *password = nil;
    
    // Store the data
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:username forKey:@"UserName"];
    [defaults setObject:password forKey:@"Password"];
    
    [defaults synchronize];
    
    NSLog(@"logged out");
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Logout Successful" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:ok];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    // the user clicked one of the OK/Cancel buttons
//    if (buttonIndex == 0)
//    {
//        Pkey = @"passwordKey";
//        Ukey = @"usernameKey";
//        
//        
//        if ([JNKeychain deleteValueForKey:Pkey]) {
//            NSLog(@"Deleted value for key '%@'. Value is: %@", Pkey, [JNKeychain loadValueForKey:Pkey]);
//        } else {
//            NSLog(@"Failed to delete!");
//        }
//        
//        if ([JNKeychain deleteValueForKey:Ukey]) {
//            NSLog(@"Deleted value for key '%@'. Value is: %@", Ukey, [JNKeychain loadValueForKey:Ukey]);
//        } else {
//            NSLog(@"Failed to delete!");
//        }
//
//        /*
//        NSString *nilPassword = nil;
//        NSString *nilUsername = nil;
//        
//        if ([JNKeychain saveValue:nilPassword forKey:Pkey]) {
//            NSLog(@"Correctly saved value '%@' for key '%@'", nilPassword, Pkey);
//        } else {
//            NSLog(@"Failed to save!");
//        }
//        
//        if ([JNKeychain saveValue:nilUsername forKey:Ukey]) {
//            NSLog(@"Correctly saved value '%@' for key '%@'", nilUsername, Ukey);
//        } else {
//            NSLog(@"Failed to save!");
//        }
//        */
//    }
//}

- (IBAction)resetKeychain:(id)sender
{
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"Logout" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
        // Cancel button tappped.
        //        [self dismissViewControllerAnimated:YES completion:^{
        //        }];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        // OK button tapped.
        Pkey = @"passwordKey";
        Ukey = @"usernameKey";
        
        
        if ([JNKeychain deleteValueForKey:Pkey]) {
            NSLog(@"Deleted value for key '%@'. Value is: %@", Pkey, [JNKeychain loadValueForKey:Pkey]);
        } else {
            NSLog(@"Failed to delete!");
        }
        
        if ([JNKeychain deleteValueForKey:Ukey]) {
            NSLog(@"Deleted value for key '%@'. Value is: %@", Ukey, [JNKeychain loadValueForKey:Ukey]);
        } else {
            NSLog(@"Failed to delete!");
        }

        
        [self dismissViewControllerAnimated:YES completion:^{
        }];
    }]];
    // Present action sheet.
    [self presentViewController:actionSheet animated:YES completion:nil];
}


@end
