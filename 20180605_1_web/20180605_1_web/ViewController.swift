//
//  ViewController.swift
//  20180605_1_web
//
//  Created by Yen on 2018/6/5.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController,UITextFieldDelegate,WKNavigationDelegate,WKUIDelegate,WKScriptMessageHandler {
    
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        let tmp = message.body as! String
        print(tmp)
        webView.evaluateJavaScript("setLabelTitle('\(tmp)')", completionHandler: nil)
    }
    
    
    
    
    var url = URL(string: "https://tw.yahoo.com")
    @IBOutlet weak var btnBack: UIBarButtonItem!
    
    @IBOutlet weak var btnForward: UIBarButtonItem!
    @IBAction func goHome(_ sender: UIBarButtonItem) {
        url = URL(string: "https://tw.yahoo.com")
        let request = URLRequest(url: url!)
        webView.load(request)
        
    }
    @IBAction func reLoad(_ sender: UIBarButtonItem) {
        webView.reload()
    }
    
    @IBAction func goForward(_ sender: Any) {
        
        webView.goForward()
    }
    @IBAction func goBack(_ sender: Any) {
        webView.goBack()
        
    }
    
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        btnBack.isEnabled = webView.canGoBack
        btnForward.isEnabled = webView.canGoForward
    }
    
    
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        
        let userInput = urltext.text!
        


        
        
        
        
        if userInput.split(separator: ".").count == 4{
            print("BB")
//            let url = URL(string: "https://www.google.com.tw/search?q=" + urltext.text!)
//            print(url)
        }else{
        
            let url = URL(string: "https://www.google.com.tw/search?q=" + urltext.text!)
    //        let url = URL(string: "https://www.google.com")
//            print(url)
            let request = URLRequest(url: url!)
            webView.load(request)
        }
    }
    
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        print("hi")
        
    
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert,animated: true,completion: nil)
        completionHandler()
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if urltext.text != ""{
            
            
            do {
                let userInput = urltext.text!
                let pat = "([1-2])*([0-9])*([0-9])*\\.([1-2])*([0-9])*([0-9])*\\.([1-2])*([0-9])*([0-9])*\\.([1-2])*([0-9])*([0-9])*"
                // (2):
                let testStr = userInput
//                print("testStr : \(testStr)")
                // (3):
                let regex = try! NSRegularExpression(pattern: pat, options: [])
                // (4):
                let matches = regex.matches(in: testStr, options: [], range: NSRange(location: 0, length: testStr.characters.count))
                print(matches.count)
            }catch{
                
                
            }
            
            
            let inputURL = urltext.text
            if ( (inputURL?.count)! >= 8 && inputURL![(inputURL?.startIndex)! ..< (inputURL?.index((inputURL?.startIndex)!, offsetBy: 8))!] == "https://") || ( (inputURL?.count)! >= 7  && inputURL![(inputURL?.startIndex)! ..< (inputURL?.index((inputURL?.startIndex)!, offsetBy: 7))!] == "http://"){
                // user input start from http:// or https:// and string length >= 7 or 8
                url = URL(string: urltext.text!)
                
                
                let request = URLRequest(url: url!)
                webView.load(request)
                
                
                
                
                
            }else{
                // user input directly start from website
                url = URL(string: "https://" + urltext.text!)
//
//                print("AA")
//                print(url)
            
                let request = URLRequest(url: url!)
                webView.load(request)
                
            }

            
        }
        
        
        
        return true
    }
    

    
    @IBOutlet weak var urltext: UITextField!
    
    @IBOutlet weak var webView: WKWebView!
    

    

   override func viewDidLoad() {
        super.viewDidLoad()

//        let url = URL(string: "https://tw.yahoo.com")
    
        let request = URLRequest(url: url!)
        webView.load(request)
        webView.navigationDelegate = self
        webView.uiDelegate = self
    
        webView.configuration.userContentController = WKUserContentController()
        webView.configuration.userContentController.add(self,name: "Test")
    
    
    
//        urltext.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

//    override func loadView() {
//        let configuration = WKWebViewConfiguration()
//
//        configuration.userContentController = WKUserContentController()
//        configuration.userContentController.add(self,name: "Test")
//        webView = WKWebView()
//        view = webView
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

