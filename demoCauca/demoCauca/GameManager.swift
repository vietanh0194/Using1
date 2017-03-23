//
//  GameManager.swift
//  demoCauca
//
//  Created by Viet Anh on 3/22/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//

import UIKit
class GameManager: NSObject {
    var fishViews : NSMutableArray?
    var hookView : HookerView?
    override init(){
    self.fishViews = NSMutableArray()
        self.hookView = HookerView(frame: CGRect(x:0 ,y:-490, width:20 , height:490))
    }
    func addFishToViewController(viewconller: UIViewController, width: Int){
        let fishView = FishView(frame: CGRect(x:0 , y: 0, width : 70 , height: 50))
        fishView.generateFish(width: width)
        self.fishViews?.add(fishView)
        viewconller.view.addSubview(fishView)
    }
    func updateMove(){
    self.hookView?.updateMove()
        for fishView in self.fishViews! {
            (fishView as AnyObject).updateMove()
            if (((fishView as AnyObject).frame).contains(CGPoint(x: self.hookView!.center.x, y: self.hookView!.frame.origin.y + self.hookView!.frame.height + (fishView as AnyObject).frame.width/2)))
            {
                bite (fishView as! FishView)
            }
        }
    
    }
    func dropHookerAtX(x: Int){
    self.hookView?.dropDowAtX(x: x)
    
    }
    func bite(_ fishView: FishView)
    {
        if (fishView.status != fishView.CAUGHT && self.hookView?.status != self.hookView?.DRAWINGUP && self.hookView?.status != self.hookView?.CAUGHTF)
        {
            fishView.caught()
            fishView.center = CGPoint(x: self.hookView!.center.x, y: self.hookView!.frame.origin.y + self.hookView!.frame.height + fishView.frame.width/2)
            self.hookView?.status = self.hookView?.CAUGHTF
        }
    }}
