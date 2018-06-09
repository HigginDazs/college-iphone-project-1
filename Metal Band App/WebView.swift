//
//  WebView.swift
//  Metal Band App
//
//  Created by Conor Thomas Higgins on 25/02/2017.
//  Copyright © 2017 Conor Thomas Higgins. All rights reserved.
//

import UIKit

class WebView: UIViewController {
    
    var bandData : Band!

    @IBOutlet weak var bandWebView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = NSURL (string: bandData.url)
        let requestObj = NSURLRequest(url: url as! URL)
        bandWebView.loadRequest(requestObj as URLRequest)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
