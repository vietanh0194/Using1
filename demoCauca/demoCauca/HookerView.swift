//
//  HookerView.swift
//  demoCauca
//
//  Created by Viet Anh on 3/22/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//
import UIKit
import AVFoundation

class HookerView: UIImageView, AVAudioPlayerDelegate {
    let PREPARE = 0
    let DROPPING = 1
    let DRAWINGUP = 2
    let CAUGHTF = 3
    var status : Int?
    var audio = AVAudioPlayer()
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!

    }
    override init(frame: CGRect){
    super.init(frame: frame)
        self.image = UIImage(named: "hook")
        self.status = PREPARE
    }
    func updateMove(){
        if (self.status == DROPPING) {
            self.center = CGPoint(x: self.center.x, y: self.center.y + 10)
            if (self.frame.origin.y + self.frame.height > 480) {
                self.status =  DRAWINGUP
            }
        }
        else if(self.status == DRAWINGUP){
            self.center = CGPoint(x:self.center.x, y:self.center.y - 20)
            if  (self.frame.origin.y + self.frame.size.height < 0){
            self.status = PREPARE
            }
        }
        else if(self.status == CAUGHTF){
            self.center = CGPoint(x: self.center.x , y: self.center.y - 5)
            if(self.frame.origin.y + self.frame.height < 0){
                self.status = PREPARE
            }
        
        }
        if self.status == PREPARE{
            playSong()
        }
    }
    func dropDowAtX(x: Int){
        if (self.status == PREPARE){
            self.center = CGPoint(x: CGFloat(x), y: self.center.y)
            self.status = DROPPING
        }
    }
    func playSong(){
    let filePath = Bundle.main.path(forResource: "music", ofType: ".mp3")
        let url = URL(fileURLWithPath: filePath!)
        audio = try! AVAudioPlayer(contentsOf: url)
        audio.prepareToPlay()
        audio.play()
    }
}
