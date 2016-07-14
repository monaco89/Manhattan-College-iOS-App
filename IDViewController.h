//
//  IDViewController.h
//  MC
//
//  Created by Nick Monaco on 8/12/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IDViewController : UIViewController <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
{
    IDViewController *viewController;
}

-(IBAction)openActionSheet:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@end
