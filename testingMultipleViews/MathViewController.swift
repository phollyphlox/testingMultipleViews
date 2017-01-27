//
//  MathViewController.swift
//  testingMultipleViews
//
//  Created by Apple28 on 1/27/17.
//  Copyright © 2017 Apple28. All rights reserved.
//

import UIKit

class MathViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        lblDivisionMessage.isHidden = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var lblProblem: UILabel!
    @IBOutlet weak var lblDivisionMessage: UILabel!
    @IBOutlet weak var lblResults: UILabel!
    @IBOutlet weak var lblCorrect: UILabel!
    @IBOutlet weak var lblWrong: UILabel!
    @IBOutlet weak var txtAnswer: UITextField!
    
    var num1:UInt32 = 0
    var num2:UInt32 = 0
    var newSign: String = "+"
    var correct = 0
    var wrong = 0
    
    @IBAction func btnNewProblem(_ sender: UIButton) {
        lblDivisionMessage.isHidden  = true
        num1 = arc4random() % 101
        num2 = arc4random() % 101
        let sign = arc4random() % 4
        
        if sign == 0
        {
            newSign = "+"
            lblProblem.text = "\(num1)  +  \(num2)"
        }
        else if sign == 1
        {
            newSign = "-"
            if num1 < num2
            {
                let temp = num1
                num1 = num2
                num2 = temp
            }
           lblProblem.text = "\(num1)  -  \(num2)"
        }
        else if sign == 2
        {
            newSign = "*"
            lblProblem.text = "\(num1)  *  \(num2)"
        }
        else
        {
            newSign = "/"
            if num1 < num2
            {
                let temp = num1
                num1 = num2
                num2 = temp
            }
            lblProblem.text = "\(num1)  /  \(num2)"
            lblDivisionMessage.isHidden = false
        }
        txtAnswer.becomeFirstResponder()
    }
    
    @IBAction func btnCheckAnswer(_ sender: UIButton) {
        view.endEditing(true)
        var correctAnswer:UInt32 = 0
        
        if txtAnswer.text == ""
        {
            lblResults.text = "You must enter an anser before\ntapping Check Answer."
        }
        else if lblProblem.text == "Problem will appear here"
        {
            lblResults.text = "You must tap 'Get A New Problem'\nbefore tapoping Check Answer."
        }
        else
        {
            let strAnswer = txtAnswer.text!
            let answer: UInt32 = UInt32(strAnswer)!
            
            if newSign == "+"
            {
                correctAnswer = num1 + num2
            }
            else if newSign == "-"
            {
                correctAnswer = num1 - num2
            }
            else if newSign == "*"
            {
                correctAnswer = num1 * num2
            }
            else
            {
                if num2 == 0
                {
                    correctAnswer = 0
                }
                else
                {
                    correctAnswer = num1 / num2
                }
            }
            if answer == correctAnswer
            {
                lblResults.text = "Correct! You are doing great!"
                correct += 1
                lblCorrect.text = "\(correct)"
                txtAnswer.text = ""
                lblProblem.text = "Problem will appear here"
            }
            else
            {
                lblResults.text = "Wrong.\n\(num1) \(newSign) \(num2) = \(correctAnswer)\nDon't be discouraged.\nKeep Trying."
                wrong += 1
                lblWrong.text = "\(wrong)"
                txtAnswer.text = ""
                lblProblem.text = "Problem will appear here"
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
