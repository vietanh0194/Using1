//
//  ViewController.swift
//  demoCauca
//
//  Created by Viet Anh on 3/22/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController, AVAudioPlayerDelegate {
    var deepSea = AVAudioPlayer()
    var gameManager : GameManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        playSong()
        self.gameManager = GameManager()
        self.view.addSubview((self.gameManager?.hookView)!)
        self.gameManager?.addFishToViewController(viewconller: self, width: Int(self.view.bounds.width))
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(ViewController.tapHandle(_:))))
        Timer.scheduledTimer(timeInterval: 0.025, target: self.gameManager!, selector: Selector(("updateMove")), userInfo: nil, repeats: true)
        
    }
    func tapHandle(_ sender: UIGestureRecognizer)
    {
        let tapPoint = sender.location(in: self.view)
        self.gameManager?.dropHookerAtX(x: Int(tapPoint.x))
    }

   
    
    func playSong()
    {
        let filePath = Bundle.main.path(forResource: "nhac song", ofType: ".mp3")
        let url = URL(fileURLWithPath: filePath!)
        deepSea = try! AVAudioPlayer(contentsOf: url)
        deepSea.prepareToPlay()
        deepSea.play()
    }
    
    
    @IBAction func reset(_ sender: Any) {
        self.gameManager?.fishViews?.removeAllObjects()
        for object in self.view.subviews
        {
            if (object .isKind(of: FishView.self))
            {
                object .removeFromSuperview()
            }
        }
        self.gameManager?.addFishToViewController(viewconller: self, width: Int(self.view.bounds.width))
    }
    
    @IBAction func addFish(_ sender: Any) {
        self.gameManager?.addFishToViewController(viewconller: self, width: Int(self.view.bounds.width))
    }
}

