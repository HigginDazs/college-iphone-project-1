//
//  AudioView.swift
//  Metal Band App
//
//  Created by Conor Thomas Higgins on 01/03/2017.
//  Copyright © 2017 Conor Thomas Higgins. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class AudioView: AVPlayerViewController {
    
    var bandData : Band!
    var albumOriginVal : CGFloat!
    var albumSize : CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let albumArt = UIImageView(image: UIImage(named: "icons/" + bandData.icon))
        let originVal = (albumOriginVal / 2) - (albumSize / 2)
        albumArt.frame = CGRect(x: 0, y: originVal, width: albumSize, height: albumSize)
        self.contentOverlayView?.addSubview(albumArt)
        
        let endIndex = bandData.image.index(bandData.image.endIndex, offsetBy: -4)
        let bandSong = bandData.image.substring(to: endIndex)
        
        let audioURL: NSURL = Bundle.main.url(forResource: "music/" + bandSong, withExtension: "mp3")! as NSURL
        self.player = AVPlayer(url: audioURL as URL)
        self.player?.play()

        // Do any additional setup after loading the view.
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
