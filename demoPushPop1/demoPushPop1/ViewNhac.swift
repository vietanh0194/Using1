//
//  ViewNhac.swift
//  demoPushPop1
//
//  Created by Viet Anh on 3/10/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//

import UIKit
import AVFoundation
class ViewNhac: UIViewController {
    var audio = AVAudioPlayer()
    var isPlaying = true
    var time = Timer()
    
    
    @IBOutlet weak var my_Swich: UISwitch!

   
    @IBOutlet weak var slide_nhac: UISlider!
     @IBOutlet weak var slide_amthanh: UISlider!
    
    
    @IBOutlet weak var lbl_time1: UILabel!
    
    @IBOutlet weak var lbl_time2: UILabel!
    
    @IBOutlet weak var btn_play: UIButton!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        audio = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: Bundle.main.path(forResource: "Chiaxa", ofType: ".mp3")!))
        audio.prepareToPlay()
    
        my_Swich.addTarget(self, action: #selector(switchIsChange), for: UIControlEvents.valueChanged)
        let minu: Int = Int(audio.duration / 60)
        let sec: Int = Int(audio.duration.truncatingRemainder(dividingBy: 60))
        slide_nhac.maximumValue = Float(audio.duration)
    }

    func updateFrame(){
        let minu: Int = Int(audio.currentTime / 60)
        let sec : Int = Int(audio.currentTime.truncatingRemainder(dividingBy: 60))
        if (minu < 10 && sec < 10) {
            self.lbl_time1.text = "0\(minu):0\(sec)"
        }else{
            if sec < 10 {
                self.lbl_time1.text = "\(minu):0\(sec) "
            } else if minu < 10 {
                self.lbl_time1.text = "0\(minu):\(sec) "
            }else{
                self.lbl_time1.text = "\(minu):\(sec) "
            }
        
        }
        slide_amthanh.value = Float(audio.currentTime)
    
    }
    func switchIsChange(){
        
    }
    @IBAction func btn_play(_ sender: UIButton) {
        if isPlaying {
            audio.play()
            btn_play.setImage(UIImage(named: "pause.png"), for: UIControlState.normal)
            time = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateFrame), userInfo: nil, repeats: true)
            switchIsChange()
        }
        else{
            audio.stop()
            btn_play.setImage(UIImage(named: "play.png"), for: UIControlState.normal)
             time.invalidate()
        }
    }
    
    @IBAction func slide_amthanh(_ sender: UISlider) {
        audio.volume = sender.value
    }

}
