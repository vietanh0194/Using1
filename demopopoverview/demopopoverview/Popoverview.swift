//
//  Popoverview.swift
//  demopopoverview
//
//  Created by Viet Anh on 3/9/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//

import UIKit
class Popoverview : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func btn_icon(_ sender: Any) {
        if ((sender as AnyObject).tag == 101) {
            print("xxx")
        }
    }

}
