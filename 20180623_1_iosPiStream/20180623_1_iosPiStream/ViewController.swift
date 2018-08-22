//
//  ViewController.swift
//  20180623_1_iosPiStream
//
//  Created by Yen on 2018/6/23.
//  Copyright © 2018年 Yen. All rights reserved.
//

import UIKit
import MediaPlayer
import AVFoundation
import AVKit
class ViewController: UIViewController {
    @IBAction func onClickReload(_ sender: Any) {
        print("AAA")
        moviePlayer.view.setNeedsLayout()
        moviePlayer.view.layoutIfNeeded()
        
        
    }
    let url = URL(string: "http://10.2.24.110/stream.m3u8")
    var moviePlayer:MPMoviePlayerController!
    //var m3u8Player:AVPlayerViewController!
    override func viewDidLoad() {
        super.viewDidLoad()

        
//        let url = URL(string: "http://10.2.24.110/stream.m3u8")
        
        moviePlayer =  MPMoviePlayerController(contentURL: url)
        
            
        moviePlayer.view.frame = CGRect(x: 20, y: 100, width: 250, height: 400)
        
        self.view.addSubview(moviePlayer.view)
        moviePlayer.isFullscreen = true
        
        moviePlayer.controlStyle = MPMovieControlStyle.embedded
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}

