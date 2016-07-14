//
//  LoginViewController.h
//  MC
//
//  Created by Nick Monaco on 11/13/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UIActionSheetDelegate>
{
    NSString *Pkey;
    NSString *Ukey;
}

@property (weak, nonatomic) IBOutlet UITextField *UsernameTxtFld;
@property (weak, nonatomic) IBOutlet UITextField *passwordTxtFld;

- (IBAction)login:(id)sender;
//- (IBAction)updateButtonPressed:(id)sender;
-(IBAction)logout:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *loginLbl;

- (IBAction)resetKeychain:(id)sender;

@end
