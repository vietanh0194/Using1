//
//  ViewController.swift
//  demoBonglan1
//
//  Created by Viet Anh on 3/15/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var ball = UIImageView()
    var timer = Timer()
    var radians = CGFloat()
    var ballRadious = CGFloat()
    var ballRadious2 = CGFloat()
    var right: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        addBall()
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(check), userInfo: nil, repeats: true)
    }
    
    func addBall()
    {
        let mainViewSize = self.view.bounds.size
        ball = UIImageView(image: UIImage(named: "ball.png"))
        ballRadious = 32.0
        ballRadious2 = self.view.bounds.maxX
        ball.center = CGPoint(x: ballRadious, y: mainViewSize.height * 0.5)
        
//       ball.center = CGPoint(x: self.view.bounds.width, y: mainViewSize.height * 0.5)
        
        self.view.addSubview(ball)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    func check(){
        if right {
            rollBall()
        }else{
            rollBall2()
        }
    }
    func rollBall()
    {
        var deltaAngle: CGFloat = 0.1
//        var deltaAngle2: CGFloat = 0.4
        radians = radians + deltaAngle
        ball.transform = CGAffineTransform(rotationAngle: radians)
//        ball.center = CGPoint(x: ballRadious, y:  self.view.bounds.height * 0.5)
//        ball.center = CGPoint(x: ball.center.x + ballRadious * deltaAngle, y: ball.center.y)
        ball.center = CGPoint(x: ball.center.x + ballRadious * deltaAngle, y: ball.center.y)
        if ball.center.x  >= self.view.bounds.width {
            rollBall2()
            right = false

        }
//        if ball.center.x - ballRadious * deltaAngle == self.view.bounds.width {
//            ball.center = CGPoint(x: ball.center.x - ballRadious * deltaAngle, y: ball.center.y)
//        }
//        ball.center = CGPoint(x: ballRadious2 - ballRadious * deltaAngle2, y: ball.center.y)
//        print(self.view.bounds.width)
//        print(ball.center.x - ballRadious * deltaAngle)
        
    }
    func rollBall2()
    {
        var deltaAngle: CGFloat = -0.1
        radians = radians + deltaAngle
//        ball.center = CGPoint(x: self.view.bounds.width, y: self.view.bounds.height * 0.5)
        ball.transform = CGAffineTransform(rotationAngle: radians)
        ball.center = CGPoint(x: ball.center.x + ballRadious * deltaAngle, y: ball.center.y)
        if ball.center.x  <= ballRadious {
            rollBall()
            right = true
            
        }
        
    }
}

