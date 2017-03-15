//
//  ViewController.swift
//  demoled1
//
//  Created by Viet Anh on 3/10/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var x: Int = 5
    var n: Int = 0
    var _margin: CGFloat = 40
//    @IBOutlet weak var tf_nhap: UITextField!
//    
//    @IBAction func btn_click(_ sender: UIButton) {
////        var z = Int(tf_nhap.text!)!
////        sobong = z
//        
//    }
    @IBOutlet weak var tf_sobong: UITextField!
    @IBAction func btn_OK(_ sender: UIButton) {
        n = Int(tf_sobong.text!)!
        drawRowOfBall()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      
    }
    func drawRowOfBall(){
        for indexHang in 0..<n {
            for indexCot in 0..<n {
                print(index)
                let image = UIImage(named: "green")
                let ball = UIImageView(image: image)
                ball.center = CGPoint(x: _margin + CGFloat(indexHang) * spaceBetweenBall(), y: CGFloat(indexCot)*50 + _margin)
                
                self.view.addSubview(ball)
            }
            
        }
    }
    func spaceBetweenBall() -> CGFloat {
        let space = (self.view.bounds.size.width - 2*_margin)/CGFloat(n-1)
        return space
    }
}

