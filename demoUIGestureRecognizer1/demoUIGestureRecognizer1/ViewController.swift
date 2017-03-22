//
//  ViewController.swift
//  demoUIGestureRecognizer1
//
//  Created by Viet Anh on 3/22/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGesture = UIGestureRecognizer(target: self, action: #selector(ViewController.onTap(tapGesture:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    func onTap(tapGesture: UIGestureRecognizer){
        let point = tapGesture.location(in: self.view)
        let snowflake = UIImageView(image: UIImage(named: "snowflake.png"))
        snowflake.bounds.size = CGSize(width: 40 , height: 40)
        snowflake.center = point
        self.view.addSubview(snowflake)
    }
    


}

