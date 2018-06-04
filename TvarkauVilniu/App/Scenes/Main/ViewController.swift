//
//  ViewController.swift
//  webViewDemo
//
//  Created by Kyle Suchar on 2/26/17.
//  Copyright © 2017 Kyle Suchar. All rights reserved.
//

import UIKit
import WebKit

final class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: UIWebView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let URL = NSURL(string: "https://tvarkaumiesta.lt") else { return }

        webView.scrollView.delegate = self
        webView.scrollView.bounces = false
        webView.loadRequest(NSURLRequest(url: URL as URL) as URLRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func goAction(_ sender: Any) {
        guard
            let text = textField.text,
            let url = NSURL(string: text)
        else {
            return
        }
        let req = NSURLRequest(url:url as URL)
        self.webView.loadRequest(req as URLRequest)
    }
    
    @IBAction func goBack(_ sender: Any) {
        webView.goBack()
    }
    
    @IBAction func goFoward(_ sender: Any) {
        webView.goForward()
    }
    
}

extension ViewController: UIScrollViewDelegate {

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return nil
    }

}
