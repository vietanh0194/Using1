//
//  ViewController.swift
//  demopopoverview
//
//  Created by Viet Anh on 3/9/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UIPopoverPresentationControllerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
//    @IBAction func btn_like(_ sender: UIButton) {
//        like =  like + 1
//        lbl_like.text = String(like)
//    }
    @IBOutlet weak var lbl_like: UILabel!
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "showView") {
//            let controller = segue.destination
//            controller.popoverPresentationController?.delegate = self
//            controller.preferredContentSize = CGSize(width : 220 , height : 35)
//            
//        }
//    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showView") {
            let x = segue.destination
            x.popoverPresentationController?.delegate = self
            x.preferredContentSize = CGSize(width : 220 , height : 35)
        }
    }
//    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
//        return .none
//        
//    }
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    
    }

}

