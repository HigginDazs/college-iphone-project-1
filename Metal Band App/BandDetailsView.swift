//
//  BandDetailsView.swift
//  Metal Band App
//
//  Created by Conor Thomas Higgins on 23/02/2017.
//  Copyright © 2017 Conor Thomas Higgins. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class BandDetailsView: UIViewController {
    
    // outlets
    @IBOutlet weak var bandNameLabel: UILabel!
    @IBOutlet weak var bandImage: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var formedLabel: UILabel!
    
    // actions
    @IBAction func websiteAction(_ sender: UIButton)
    {
        
    }
    @IBAction func soundbiteAction(_ sender: UIButton)
    {
        
    }
    
    var bandData : Band!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "webSegue"
        {
            // get the destination controller
            let controller = segue.destination as! WebView
            
            // push data to it
            controller.bandData = bandData
        }
            
        else if segue.identifier == "audioSegue"
        {
            let controller = segue.destination as! AudioView
            
            controller.bandData = bandData
            controller.albumSize = self.view.frame.width
            controller.albumOriginVal = self.view.frame.height
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "\(bandData.name) Details"
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "images/background.jpg")
        backgroundImage.alpha = 0.65
        self.view.insertSubview(backgroundImage, at: 0)
        
        bandNameLabel.text = "Name: \(bandData.name)"
        bandImage.image = UIImage(named: "images/" + bandData.image)
        bandImage.contentMode = UIViewContentMode.scaleAspectFill
        countryLabel.text = "Country: \(bandData.country)"
        genreLabel.text = "Genre: \(bandData.genre)"
        formedLabel.text = "Year Formed: \(bandData.formed)"
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
