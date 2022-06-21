//
//  ViewController.swift
//  Passcode
//
//  Created by Yoga on 2022/6/11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var backgroundImageView: UIImageView!
    
    
    @IBOutlet var numberButton: [UIButton]!
    
    @IBOutlet weak var passcode1ImageView: UIImageView!
    @IBOutlet weak var passcode2ImageView: UIImageView!
    @IBOutlet weak var passcode3ImageView: UIImageView!
    @IBOutlet weak var passcode4ImageView: UIImageView!
    
    var correctPassCode = "2022"
    var enterPassCode = ""
    var count = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        backgroundImageView.layer.cornerRadius=50


    }
    
    //檢查輸入的密碼是否正確，跳出提醒顯示
    func checkPassCode(){
        
        if count == 4{
        if enterPassCode == correctPassCode{
            let controller = UIAlertController(title: "正確！", message: "歡迎使用！", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){_ in self.reset()}
            controller.addAction(okAction)
            present(controller,animated: true,completion: nil)
        }else {
            let controller = UIAlertController(title: "錯誤！", message: "請重新輸入！", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default){_ in self.reset()}
            controller.addAction(okAction)
            present(controller,animated: true,completion: nil)
        }
        }
        
        
    }
    
    func reset(){
        passcode1ImageView.isHighlighted = false
        passcode2ImageView.isHighlighted = false
        passcode3ImageView.isHighlighted = false
        passcode4ImageView.isHighlighted = false
        count = 0
        enterPassCode = ""
    }

    //輸入密碼時imageview改變成實心
    func imageChange(){
        switch count{
        case 0 :
            passcode1ImageView.isHighlighted = false
            passcode2ImageView.isHighlighted = false
            passcode3ImageView.isHighlighted = false
            passcode4ImageView.isHighlighted = false
            
        case 1:
            passcode1ImageView.isHighlighted = true
            passcode2ImageView.isHighlighted = false
            passcode3ImageView.isHighlighted = false
            passcode4ImageView.isHighlighted = false
            
            
        case 2:
            passcode1ImageView.isHighlighted = true
            passcode2ImageView.isHighlighted = true
            passcode3ImageView.isHighlighted = false
            passcode4ImageView.isHighlighted = false
        case 3:
            passcode1ImageView.isHighlighted = true
            passcode2ImageView.isHighlighted = true
            passcode3ImageView.isHighlighted = true
            passcode4ImageView.isHighlighted = false
        case 4:
            passcode1ImageView.isHighlighted = true
            passcode2ImageView.isHighlighted = true
            passcode3ImageView.isHighlighted = true
            passcode4ImageView.isHighlighted = true
            
        default :
            break
            
        }
    }
    
    @IBAction func check(_ sender: UIButton) {
    
        //每按一個數字count+1
        count += 1
        //當count小於等於四碼時
        if count <= 4{
            //enterPassCode加入輸入的數字，因sender.tag為Int，需轉為enterPassCode的型別String
            enterPassCode += "\(sender.tag)"
     
        }
      
        //同步改變imageView
        imageChange()
        //同步檢查密碼
        checkPassCode()
    }
    
    
    @IBAction func restart(_ sender: UIButton) {
        reset()
    }
    
    //清除密碼一位數
    @IBAction func deletnum(_ sender: UIButton) {
        //當密碼數不等於0位時
        if count != 0{
     
            enterPassCode.removeLast()
            //每減一位數，count也需-1
            count -= 1
           
        }
        //同步改變imageview
        imageChange()
    }
    
    
}
