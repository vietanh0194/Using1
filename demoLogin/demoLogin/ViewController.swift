//
//  ViewController.swift
//  demoLogin
//
//  Created by Viet Anh on 3/7/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var users = ["vietanh":"123" , "cuong":"456"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBOutlet weak var tf_user: UITextField!
    
    @IBOutlet weak var tf_pass: UITextField!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn_creat(_ sender: UIButton) {
        if var pass = users[tf_user.text!] {
            print("tai khoan da ton tai")
        }else{
            users[tf_user.text!] = tf_pass.text
            print("them ok")
            for (user , pass) in users {
                print(user)
            }
        }
        
    }
    
    @IBAction func btn_login(_ sender: UIButton) {
        if var pass = users[tf_user.text!] {
            if pass == tf_pass.text {
                print("ok")
            }else{
                print("sai")
            }
        }else{
            print("tai khoan khong ton tai")
            
        }
        
    }
    
    
    @IBAction func btn_delete(_ sender: UIButton) {
        if var pass = users[tf_user.text!] {
            users.removeValue(forKey: tf_user.text!)
            print("xoas ok")
        }
    }
    @IBAction func btn_change(_ sender: UIButton) {
        if var pass = users[tf_user.text!] {
            users.updateValue(tf_pass.text!, forKey: tf_user.text!)
            print("doi pass thanh cong")
        }
        else{
            print("tai khoan khong ton tai")
        }
    }
}

