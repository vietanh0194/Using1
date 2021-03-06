//
//  ViewController.swift
//  demomp3.zing
//
//  Created by Viet Anh on 3/7/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        imgview_logo!.alpha = 0
        lbl_zing.center = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height - 100)
        load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var imgview_logo: UIImageView!
    @IBOutlet weak var lbl_zing: UILabel!
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        UIView.animate(withDuration: 4, animations: {
//        self.imgview_logo!.alpha = 1
//        }, completion: {(finished) in UIView.animate(withDuration: 3, animations: {
//            self.lbl_zing.alpha = 1
//            self.lbl_zing.center = CGPoint(x: self.imgview_logo.center.x, y: 70)
//           
//        })
//        
//        }
//        
//        )
//    }
    func load(){
        UIView.animate(withDuration: 4, animations: {
        self.imgview_logo.alpha = 1
        self.lbl_zing.alpha = 1
        self.lbl_zing.center = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height - 100)
        },completion:{(finished) in
        UIView.animate(withDuration: 4, animations: {
        self.imgview_logo.alpha = 1
            self.lbl_zing.alpha = 1
            self.lbl_zing.center = CGPoint(x: self.view.bounds.width / 2, y: self.view.center.x - 100)
        },completion:{(finished) in
            UIView.animate(withDuration: 4, animations: {
                self.imgview_logo.alpha = 1
                self.lbl_zing.text = "Viet Anh"
                self.lbl_zing.alpha = 1
                self.lbl_zing.center = CGPoint(x: self.view.bounds.width / 2, y: self.view.bounds.height - 100)
            },completion:{(finished) in})
        
        })
        }
        )
    
    }
}

