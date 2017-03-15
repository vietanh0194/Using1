//
//  ViewController.swift
//  demotoantreem
//
//  Created by Viet Anh on 3/6/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var checkTrue:Int = 0
    var checkFalse :Int = 0
    
    var kq: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setRandom()
    }
    
    @IBOutlet weak var lbl_so1: UILabel!
    @IBOutlet weak var lbl_so2: UILabel!
    @IBOutlet weak var lbl_so3: UILabel!
    
    @IBOutlet weak var lbl_true: UILabel!
    @IBOutlet weak var lbl_false: UILabel!
    @IBAction func btn_so1(_ sender: UIButton) {
        setCheck(check: sender.currentTitle!)
      
    }
    
    @IBAction func btn_so2(_ sender: UIButton) {
        setCheck(check: sender.currentTitle!)
      
    }
    @IBAction func btn_so3(_ sender: UIButton) {
        setCheck(check: sender.currentTitle!)
     
    }
    @IBOutlet weak var btn_so1_out: UIButton!
    @IBOutlet weak var btn_so3_out: UIButton!
    @IBOutlet weak var btn_so2_out: UIButton!
    func setResult(){
        
        
        let ketquagia = Int(arc4random_uniform(10))+1
        let ketquagia1 = Int(arc4random_uniform(10))+1
        let random1 = Int(arc4random_uniform(3))+1
        if (ketquagia != kq && ketquagia1 != kq)&&(ketquagia1 != ketquagia){
            switch random1 {
            case 1 :
                btn_so1_out.setTitle(String(kq), for: .normal)
                btn_so2_out.setTitle(String(ketquagia1), for: .normal)
                btn_so3_out.setTitle(String(ketquagia), for: .normal)
            case 2 :
                btn_so1_out.setTitle(String(ketquagia1), for: .normal)
                btn_so2_out.setTitle(String(kq), for: .normal)
                btn_so3_out.setTitle(String(ketquagia), for: .normal)
            case 3 :
                btn_so1_out.setTitle(String(ketquagia1), for: .normal)
                btn_so2_out.setTitle(String(ketquagia), for: .normal)
                btn_so3_out.setTitle(String(kq), for: .normal)
            default :
                print("sai")
            }
        }
        
        
    }
    func setRandom()  {
        let random1 = Int(arc4random_uniform(4))+1
        let random2 = Int(arc4random_uniform(4))+1
        
        lbl_so1.text = String(random1)
        lbl_so2.text = String(random2)
        //        lbl_so3.text = String(kq)
        kq = random1 +  random2
        setResult()
        
        
    }
  
    func setCheck(check : String)  {
      
        if check == String(kq)
        {
            checkTrue = checkTrue + 1
            lbl_true.text = String(checkTrue)
        }
        else{
            checkFalse = checkFalse + 1
            lbl_false.text = String(checkFalse)
        }
        setRandom()
        //
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

