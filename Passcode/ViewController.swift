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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        backgroundImageView.layer.cornerRadius=50


    }
    
    //檢查輸入的密碼是否正確，跳出提醒顯示
    func checkPassCode(){
        if enterPassCode == correctPassCode{
            let controller = UIAlertController(title: "正確！", message: "歡迎使用！", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller,animated: true,completion: nil)
        }else{
            let controller = UIAlertController(title: "錯誤！", message: "請重新輸入！", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            controller.addAction(okAction)
            present(controller,animated: true,completion: nil)
        }
    }

    //輸入密碼時imageview改變成實心
    func imageChange(){
        switch enterPassCode.count{
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
            checkPassCode()
        default:
            passcode1ImageView.isHighlighted = false
            passcode2ImageView.isHighlighted = false
            passcode3ImageView.isHighlighted = false
            passcode4ImageView.isHighlighted = false

        }
    }
    
    
    
    @IBAction func check(_ sender: UIButton) {

        if enterPassCode.count != 4{
            if let inputNumber = sender.currentTitle{
                //字串相加
                enterPassCode.append(inputNumber)
            }
        }
        imageChange()
        print(enterPassCode)
}
    
}
