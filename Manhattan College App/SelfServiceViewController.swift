////
////  SelfServiceViewController.swift
////  MC
////
////  Created by Nick Monaco on 9/22/16.
////  Copyright © 2016 Monaco Software Productions. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class SelfServiceViewController: UIViewController, UIActionSheetDelegate, UIWebViewDelegate {
//    @IBOutlet var selfServiceWebView: UIWebView!
//    @IBOutlet weak var back: UIBarButtonItem!
//    @IBOutlet weak var forward: UIBarButtonItem!
//    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//        
//        // Custom initialization
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let fullURL = "https://self-service.manhattan.edu/"
//        let url = NSURL(string: fullURL)!
//        let requestObj = URLRequest(url: url as URL)
//        selfServiceWebView.loadRequest(requestObj)
//        // Do any additional setup after loading the view.
//        self.selfServiceWebView.delegate! = self as! UIWebViewDelegate
//        selfServiceWebView.scrollView.isScrollEnabled = true
//        //selfServiceWebView.scroll.delegate = self
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    @IBAction func openActionSheet(_ sender: Any) {
//        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
//        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {(action: UIAlertAction) -> Void in
//            // Cancel button tappped.
//            //        [self dismissViewControllerAnimated:YES completion:^{
//            //        }];
//        }))
//        actionSheet.addAction(UIAlertAction(title: "Open In Safari", style: .default, handler: {(action: UIAlertAction) -> Void in
//            // OK button tapped.
//            let currentURL = self.selfServiceWebView.request!.url?.absoluteString
//            UIApplication.shared.openURL(NSURL(string: currentURL!)! as URL)
//            self.dismiss(animated: true, completion: {() -> Void in
//            })
//        }))
//        // Present action sheet.
//        self.present(actionSheet, animated: true, completion: { _ in })
//    }
//    
//    func updateButtons() {
//        self.forward.isEnabled = self.selfServiceWebView.canGoForward
//        self.back.isEnabled = self.selfServiceWebView.canGoBack
//    }
//    
//    func webViewDidStartLoad(_ webView: UIWebView) {
//        UIApplication.shared.isNetworkActivityIndicatorVisible = true
//        self.updateButtons()
//    }
//    
//    func webViewDidFinishLoad(_ webView: UIWebView) {
//        UIApplication.shared.isNetworkActivityIndicatorVisible = false
//        self.updateButtons()
//        let Pkey = "passwordKey"
//        let Ukey = "usernameKey"
//        let userId = JNKeychain.loadValue(forKey: Ukey)
//        let password = JNKeychain.loadValue(forKey: Pkey)
//        if userId != nil && password != nil {
//            let jScriptString1 = "document.getElementById('username').value='\(userId)'"
//            let jScriptString2 = "document.getElementById('password').value='\(password)'"
//            webView.stringByEvaluatingJavaScript(from: jScriptString1)!
//            webView.stringByEvaluatingJavaScript(from: jScriptString2)!
//            webView.stringByEvaluatingJavaScript(from: "document.forms['login_form'].submit();")!
//        }
//    }
//    
//    func webView(_ webView: UIWebView, didFailLoadWithError error: Error?) {
//        UIApplication.shared.isNetworkActivityIndicatorVisible = false
//        self.updateButtons()
//    }
//}
