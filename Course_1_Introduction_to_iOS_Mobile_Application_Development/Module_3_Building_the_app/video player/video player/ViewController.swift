//
//  ViewController.swift
//  video player
//
//  Created by Neslihan Turpcu on 2024-07-29.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        playVideo()
    }
    
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "peace", ofType: "mp4") else {
            debugPrint("video not found")
            return
        }
        
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        
        let playerController = AVPlayerViewController()
        
        playerController.player = player
        present(playerController, animated: true) {
            player.play()
        }
    }
}

