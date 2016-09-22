//
//  BookViewController.swift
//  MC
//
//  Created by Nick Monaco on 9/22/16.
//  Copyright © 2016 Monaco Software Productions. All rights reserved.
//

import Foundation
import UIKit


class BookViewController: UIViewController, UIActionSheetDelegate, UIWebViewDelegate {
    @IBOutlet var bookWebView: UIWebView!
    @IBOutlet weak var back: UIBarButtonItem!
    @IBOutlet weak var forward: UIBarButtonItem!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        // Custom initialization
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fullURL = "http://manhattan.bncollege.com/webapp/wcs/stores/servlet/BNCBHomePage?storeId=77236&catalogId=10001&langId=-1"
        let url = NSURL(string: fullURL)!
        let requestObj = URLRequest(url: url as URL)
        bookWebView.loadRequest(requestObj)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func openActionSheet(_ sender: Any) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(action: UIAlertAction) -> Void in
            // Cancel button tappped.
            //        [self dismissViewControllerAnimated:YES completion:^{
            //        }];
        }))
        actionSheet.addAction(UIAlertAction(title: "Open In Safari", style: .default, handler: {(action: UIAlertAction) -> Void in
            // OK button tapped.
            let currentURL = self.bookWebView.request!.url?.absoluteString
            UIApplication.shared.openURL(NSURL(string: currentURL!)! as URL)
            self.dismiss(animated: true, completion: {() -> Void in
            })
        }))
        // Present action sheet.
        self.present(actionSheet, animated: true, completion: { _ in })
    }
    
    func updateButtons() {
        self.forward.isEnabled = self.bookWebView.canGoForward
        self.back.isEnabled = self.bookWebView.canGoBack
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        self.updateButtons()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        self.updateButtons()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        self.updateButtons()
    }
}
