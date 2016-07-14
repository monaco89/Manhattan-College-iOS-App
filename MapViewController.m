//
//  MapViewController.m
//  Manhattan College App
//
//  Created by Nick Monaco on 2/3/14.
//  Copyright (c) 2014 Monaco Software Productions. All rights reserved.
//

#import "MapViewController.h"

#define METERS_PER_MILE 1609.344

@interface MapViewController ()

@end

@implementation MapViewController
@synthesize campusPDF;

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
    
    NSURL *targetURL = [NSURL URLWithString:@"https://manhattan.edu/sites/default/files/map_2014_v.3.pdf"];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [campusPDF loadRequest:request];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    
    /*
    // 1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 40.8894;
    zoomLocation.longitude= -73.9005;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.3*METERS_PER_MILE, 0.3*METERS_PER_MILE);
     */
    /*
    // Create a coordinate structure for the location.
    CLLocationCoordinate2D ground = CLLocationCoordinate2DMake(40.8894, -73.9005);
    
    // Create a coordinate structure for the point on the ground from which to view the location.
    CLLocationCoordinate2D eye = CLLocationCoordinate2DMake(40.8894, -73.9005);
    
    // Ask Map Kit for a camera that looks at the location from an altitude of 100 meters above the eye coordinates.
    MKMapCamera *myCamera = [MKMapCamera cameraLookingAtCenterCoordinate:ground fromEyeCoordinate:eye eyeAltitude:100];
    
    // Assign the camera to your map view.
    _mapView.camera = myCamera;
    */
    /*
    // 3
    [_mapView setMapType:MKMapTypeSatellite];
    [_mapView setRegion:viewRegion animated:YES];
     */
    
}


@end
