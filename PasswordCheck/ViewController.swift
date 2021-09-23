//
//  ViewController.swift
//  PasswordCheck
//
//  Created by Bryan Kuo on 2021/8/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var password: UITextField!
    
//    列出數字，標點符號
    let digits = "0123456789"
    let punctuation = "!@#$%^&*(),.<>;'`~[]{}\\|/?_-+= "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func checkPassword(_ sender: UIButton) {
        
        resultLabel.isHidden = false
        
        if password.text!.count < 16 {
            resultLabel.text = "密碼設定至少 16 個字元！"
        } else if password.text!.contains(username.text!) {
            resultLabel.text = "密碼設定不可以包含使用者名稱！"
        } else {
            var numberOfDigits = 0
            var numberOfPunctuations = 0
            var numberOfRegularLetters = 0
            var numberOfUppercases = 0
            var numberOfLowercases = 0
            
//            建立迴圈檢查每一個字母
            for character in password.text! {
                if digits.contains(character) {
                    numberOfDigits += 1
                } else if punctuation.contains(character) {
                    numberOfPunctuations += 1
                } else {
                    numberOfRegularLetters += 1
                    
                    if character.isUppercase {
                        numberOfUppercases += 1
                    } else {
                        numberOfLowercases += 1
                    }
                }
            }
            
            if numberOfDigits == 0 {
                resultLabel.text = "密碼設定至少一個數字！"
            } else if numberOfPunctuations == 0 {
                resultLabel.text = "密碼設定至少一個標點符號！"
            } else if numberOfRegularLetters == 0 {
                resultLabel.text = "密碼設定至少包含字母！"
            } else if numberOfLowercases == 0 {
                resultLabel.text = "密碼設定至少包含一個小寫字母！"
            } else if numberOfUppercases == 0 {
                resultLabel.text = "密碼設定至少包含一個大寫字母！"
            } else {
                resultLabel.text = "恭喜你，終極密碼設定完成！"
            }
        }
    }
}
