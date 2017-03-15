//
//  View2.swift
//  demoPushPop1
//
//  Created by Viet Anh on 3/10/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//

import UIKit

class View2: UIViewController {
    var users = ["vietanh":"123","abc":"456"]
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var tf_username: UITextField!
    
    @IBOutlet weak var tf_password: UITextField!
    
    @IBAction func btn_login(_ sender: UIButton) {
        if var pass = users[tf_username.text!] {
            if pass == tf_password.text! {
              let viewnhac = self.storyboard?.instantiateViewController(withIdentifier: "viewNhac")
                self.navigationController?.pushViewController(viewnhac!, animated: true)
                
            }else{
                print("sai pass")
            }
        }
        else{
            print("tai khoan khong co")
        }
    }
    
    @IBAction func btn_creat(_ sender: UIButton) {
        if var pass = users[tf_username.text!] {
            print("tai khoan da ton tai")
        }else{
            users[tf_username.text!] = tf_password.text
            print("them ok")
        }
    }
    @IBAction func btn_delete(_ sender: UIButton) {
        if var pass = users[tf_username.text!] {
            users.removeValue(forKey: tf_username.text!)
            print("xoa ok")
        }
    }
    @IBAction func btn_edit(_ sender: UIButton) {
        if var pass = users[tf_username.text!] {
            users.updateValue(tf_password.text!, forKey: tf_username.text!)
        }else{
        print("tai khoan khong co")
        }
    }
//    @IBAction func btn_pop(_ sender: UIButton) {
//        self.navigationController?.popViewController(animated: true)
//    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    
  

}
