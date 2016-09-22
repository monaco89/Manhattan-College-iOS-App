////
////  ViewController.swift
////  MC
////
////  Created by Nick Monaco on 9/22/16.
////  Copyright © 2016 Monaco Software Productions. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class ViewController: UIViewController {
//    @IBOutlet var scrollView: UIScrollView!
//    
//    @IBAction func facebook() {
//        UIApplication.shared.openURL(NSURL(string: "https://www.facebook.com/ManhattanCollegeEdu")! as URL)
//    }
//    
//    @IBAction func twitter() {
//        UIApplication.shared.openURL(NSURL(string: "https://twitter.com/MCStudentEngage")! as URL)
//    }
//    
//    @IBAction func instagram() {
//        UIApplication.shared.openURL(NSURL(string: "https://instagram.com/ManhattanEdu")! as URL)
//    }
//    
//    @IBAction func more() {
//        UIApplication.shared.openURL(NSURL(string: "https://inside.manhattan.edu")! as URL)
//    }
//    
//    @IBAction func `switch`(_ sender: Any) {
//        // NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//        //NSMutableArray *loadData = [defaults objectForKey:@"saveData"];
//        self.performSegue(withIdentifier: "HW", sender: self)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//        /*
//         [self.scrollView setScrollEnabled:YES];
//         [self.scrollView setContentSize:(CGSizeMake(320, 535))];
//         */
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        self.scrollView.isScrollEnabled = true
//        self.scrollView.contentSize = (CGSize(width: 320, height: 537))
//        //self.screenName = @"Home screen";
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//}
