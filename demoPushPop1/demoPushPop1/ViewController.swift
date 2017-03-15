//
//  ViewController.swift
//  demoPushPop1
//
//  Created by Viet Anh on 3/10/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPopoverPresentationControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var lbl_logo: UILabel!
    @IBOutlet weak var img_logo: UIImageView!
    
    @IBAction func btn_login(_ sender: UIButton) {
            
    }
//    @IBAction func Push(_ sender: UIButton) {
//        let v2 = self.storyboard?.instantiateViewController(withIdentifier: "V2")
//        self.navigationController?.pushViewController(v2!, animated: true)
//    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 4, animations: {
        self.img_logo.alpha = 1
        }, completion: {(finished) in UIView.animate(withDuration: 3, animations: {
            self.lbl_logo.center = CGPoint(x: self.img_logo.center.x, y: 110)
            self.lbl_logo.alpha = 1
        })}
        )
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "View2") {
            let x = segue.destination
            x.popoverPresentationController?.delegate = self
            x.preferredContentSize = CGSize(width : 375 , height : 350)
        }
    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }


}

