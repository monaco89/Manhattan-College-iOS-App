//
//  IDViewController.m
//  MC
//
//  Created by Nick Monaco on 8/12/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import "IDViewController.h"

@interface IDViewController ()

@end

@implementation IDViewController
@synthesize imageView;

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
    // Do any additional setup after loading the view.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *imageData = [defaults dataForKey:@"id"];
    UIImage *idImage = [UIImage imageWithData:imageData];
    imageView.image = idImage;
    
    NSTimer* myTimer = [NSTimer scheduledTimerWithTimeInterval: 2.0 target: self
                                                      selector: @selector(repeating:) userInfo: nil repeats: YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)openActionSheet:(id)sender;
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Student ID" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Add ID",@"Remove ID", nil];
    [actionSheet showInView:[self.view window]];
    
}

-(void) actionSheet: (UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    {
        if (buttonIndex ==0)
        {
            NSLog(@"add id");
            UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
            
            imagePicker.sourceType =  UIImagePickerControllerSourceTypeCamera;
            
            imagePicker.delegate = self;

            imagePicker.allowsEditing = NO;
            
            imagePicker.cameraFlashMode = NO;

            [self presentViewController:imagePicker animated:YES completion:nil];
            
        }
    
        if (buttonIndex ==1)
        {
            NSLog(@"remove id");
            
            imageView.image = nil;
            
            UIImage *idImage = imageView.image;
            NSData *imageData = UIImageJPEGRepresentation(idImage, 100);
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            [defaults setObject:imageData forKey:@"id"];
            
            [defaults synchronize];

        }
        
}}

-(void)imagePickerController:(UIImagePickerController *)picker
      didFinishPickingImage : (UIImage *)image
                 editingInfo:(NSDictionary *)editingInfo
{
	imageView.image = image;
	[picker dismissModalViewControllerAnimated:YES];
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *) picker
{
	[picker dismissViewControllerAnimated:YES completion:nil];
    
    
}

-(void) repeating:(NSTimer*) t
{
    if (self.isViewLoaded && self.view.window)
    {

    UIImage *idImage = imageView.image;
    NSData *imageData = UIImageJPEGRepresentation(idImage, 100);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:imageData forKey:@"id"];
    
    [defaults synchronize];
    
    NSLog(@"saving.");
    NSLog(@"saving...");
    }
}

@end
