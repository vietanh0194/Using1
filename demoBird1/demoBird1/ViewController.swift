//
//  ViewController.swift
//  demoBird1
//
//  Created by Viet Anh on 3/14/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var bird = UIImageView()
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawJungle()
        addBird()
        flyUpAndDow()
        playSong()
    }
    func drawJungle(){
        let background = UIImageView(image: UIImage(named:"jungle.jpg"))
        background.frame = self.view.bounds;
        background.contentMode = .scaleAspectFit
        self.view.addSubview(background)
    
    }
    func addBird(){
        bird = UIImageView(frame: CGRect(x: 0, y:0 , width : 100, height: 68))
        bird.animationImages = [
        UIImage(named:"bird1.png")!,
        UIImage(named:"bird2.png")!,
        UIImage(named:"bird3.png")!,
        UIImage(named:"bird4.png")!,
        UIImage(named:"bird5.png")!
        ]
        bird.animationRepeatCount = 0
        bird.animationDuration = 1
        self.view.addSubview(bird)
        bird.startAnimating()
    }
    func flyUpAndDow(){
        UIView.animate(withDuration: 4, animations: {
            self.bird.center = CGPoint(x: self.view.bounds.width - 10, y: self.view.bounds.height - 20)
        },completion:{(finished) in
            self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 0))
            //rotation la quay 45 do
            UIView.animate(withDuration: 4, animations: {
                self.bird.center = CGPoint(x: 10, y: self.view.bounds.height - 20)
            },completion: {(finished) in
                self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 0))
                UIView.animate(withDuration: 4, animations: {
                    self.bird.center = CGPoint(x: self.view.bounds.width - 10, y: 10)
                },completion:{(finished) in
                    self.bird.transform = self.bird.transform.scaledBy(x: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 0))
                    UIView.animate(withDuration: 4, animations: {
                        self.bird.center = CGPoint(x: 10, y: 30 )
                    },completion:{(finished) in
                        self.bird.transform = CGAffineTransform.identity
                        self.flyUpAndDow()
                    })
                }
                )
                
            })
        })
    
    
    }
    func playSong(){
    let filePath = Bundle.main.path(forResource: "A+ – Chào Mào Mái Hót", ofType: ".mp3")
        let url = URL(fileURLWithPath: filePath!)
        audioPlayer = try!AVAudioPlayer(contentsOf:url)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
    override func viewWillDisappear(_ animated: Bool) {
        audioPlayer.stop()
    }
    
}

