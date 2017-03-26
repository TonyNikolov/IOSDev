//
//  ViewController.swift
//  Downloading Web Content
//
//  Created by Tony Nikolov on 3/20/17.
//  Copyright © 2017 Tony Nikolov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let webView = URL(string:"https://www.stackoverflow.com"){
            let request = NSMutableURLRequest(url: webView)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest){
                data,response,error in
                if(error != nil){
                    print(error!)
                } else{
                    if let unwrappedData = data {
                        let dataString = NSString(data:unwrappedData,encoding: String.Encoding.utf8.rawValue)
                        
                        print(dataString!)
                    }
                }
            }
            
            task.resume()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

