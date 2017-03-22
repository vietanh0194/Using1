
//
//  Item.swift
//  demoUIGestureRecognizer1
//
//  Created by Viet Anh on 3/22/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//

import UIKit
class Item: UIImageView, UIGestureRecognizerDelegate{
    required init(coder aDecoder:NSCoder) {
        super.init(coder: aDecoder)!
        self.setup()
    }
    //khoi tao
    func setup(){
    self.isUserInteractionEnabled = true
    self.isMultipleTouchEnabled = true
    let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onPan))
    self.addGestureRecognizer(panGesture)
    let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(pinchPhoto(pinchGestureReconnizer:)))
    self.addGestureRecognizer(pinchGesture)
    let rotateItem = UIRotationGestureRecognizer(target: self, action: #selector(rotateItem(rotatoGestureReconnizer:)))
    self.addGestureRecognizer(rotateItem)
        //khoi tao
    }
    //keo tha khi giu chuot
    func onPan(panGesture: UIPanGestureRecognizer){
        if (panGesture.state == .began || panGesture.state == .changed) {
            let point = panGesture.location(in: self.superview)
            super.center = point
        }
    }
    ///keo tha khi giu chuot
    func pinchPhoto(pinchGestureReconnizer: UIPinchGestureRecognizer){
        if let view = pinchGestureReconnizer.view {
            view.transform = view.transform.scaledBy(x: pinchGestureReconnizer.scale, y: pinchGestureReconnizer.scale)
            pinchGestureReconnizer.scale = 1
            
            
        }
    
    }
    func rotateItem(rotatoGestureReconnizer: UIRotationGestureRecognizer){
        if let view = rotatoGestureReconnizer.view {
            view.transform = view.transform.rotated(by: rotatoGestureReconnizer.rotation)
            rotatoGestureReconnizer.rotation = 0
        }
    }
}
