//
//  ViewController.swift
//  democalculator
//
//  Created by Viet Anh on 3/13/17.
//  Copyright © 2017 Viet Anh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isTapingNumber: Bool = false
    var isEndOperation: Bool = true
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var operation: String = ""
    
    @IBOutlet weak var lbl_output: UILabel!
    
    @IBOutlet weak var tf_input: UITextField!
    
    @IBAction func numberAction(_ sender: UIButton) {
        let number = sender.currentTitle
        if isTapingNumber {
            tf_input.text = tf_input.text! + number!
            
        }else{
            tf_input.text = number!
            isTapingNumber = true
        }
        
    }
    
    @IBAction func operatorAction(_ sender: UIButton) {
        operation = sender.currentTitle!
        if let inputOperation = Double(tf_input.text!) {
            if isEndOperation {
                firstNumber = inputOperation
                isEndOperation = false
            }else{
                firstNumber = Double(lbl_output.text!)!
                tf_input.text = "\(firstNumber)"
                
            }
        }else{
            print("ban can nhap so")
            
        }
        isTapingNumber = false
        if operation == "%" {
            equalsAction(sender)
        }else if operation == "+/-"{
            equalsAction(sender)
            
        }
        
    }
    
    @IBAction func equalsAction(_ sender: UIButton) {
        isTapingNumber = false
        var result : Double = 0
        if let realsecondNumber = Double(tf_input.text!) {
            secondNumber = realsecondNumber
        }
        switch operation {
        case "+":
            result = firstNumber + secondNumber
        case "-":
            result = firstNumber - secondNumber
            
        case "*":
            result = firstNumber * secondNumber
            
        case "/":
            result = firstNumber / secondNumber
            
        case "%":
            result = firstNumber / 100
            
        case "+/-":
            if firstNumber < 0 {
                firstNumber = fabs(firstNumber)
                result = firstNumber
            }else{
                firstNumber = -1 * firstNumber
                result = firstNumber
                
            }
            
            
        default:
            print("failse xxxx")
        }
        lbl_output.text = "\(result)"
        
    }
    
    
    @IBAction func Ac_action(_ sender: UIButton) {
        isEndOperation = true
        firstNumber = 0
        secondNumber = 0
        operation = ""
        tf_input.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

