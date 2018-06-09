//
//  BandView.swift
//  Metal Band App
//
//  Created by Conor Thomas Higgins on 23/02/2017.
//  Copyright © 2017 Conor Thomas Higgins. All rights reserved.
//

import UIKit

class BandView: UIViewController {
    
    // outlets and actions
    @IBOutlet weak var bandLabel: UILabel!
    @IBOutlet weak var bandView: UIImageView!
    
    @IBAction func moreInfo(_ sender: UIButton) {
    }
    
    // functions and variables
    var bandData : Band!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "firstSegue"
        {
            // get the destination controller
            let controller = segue.destination as! BandDetailsView
            
            // push data to it
            controller.bandData = bandData
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = bandData.name
                
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "images/background.jpg")
        backgroundImage.alpha = 0.65
        self.view.insertSubview(backgroundImage, at: 0)
        
        // populate the views with data
        bandLabel.text = bandData.name
        bandView.image = UIImage(named: "images/" + bandData.image)
        bandView.contentMode = UIViewContentMode.scaleAspectFill
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
