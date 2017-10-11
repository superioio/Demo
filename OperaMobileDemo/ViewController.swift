//
//  ViewController.swift
//  OperaMobileDemo
//
//  Created by ZhangJun on 2017/9/24.
//  Copyright © 2017年 ZhangJun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        viewDark.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        btnSign.layer.cornerRadius = 3

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //var cj:CJCalendarViewController!
    @IBOutlet var txtName : UITextField!
    @IBOutlet var txtPhone : UITextField!
    @IBOutlet var txtPwd : UITextField!
    @IBOutlet var btnLogIn: UIButton!
    @IBOutlet var btnSign: UIButton!
    @IBOutlet var btnSkip: UIButton!
    @IBOutlet var viewDark: UIView!
    @IBOutlet var lbldiv: UILabel!

    var isLogin = false
    static var isFirstSkip = true
    
  
    @IBAction func LoginPressed(){
        if isLogin{
            showSignUpView()
        }
        else{
            showLoginView()
        }

    }
    
    @IBAction func SkipPressed(){
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let cv = sb.instantiateViewController(withIdentifier: "CheckView") as! CheckViewConroller
//        cv.user = "UserName"
//        cv.email = "Email"
        cv.user = "User"
        cv.email = "Email"
        //  cv.delegate = self
        //self.navigationController?.pushViewController(cv, animated: true)
        self.present(cv, animated: true, completion: nil)
        if  ViewController.isFirstSkip{
         
            ViewController.isFirstSkip = false
        }
            NavigationDrawer.sharedInstance.initialize(forViewController: cv,isFirstSkip: ViewController.isFirstSkip)
       
    }
    @IBAction func SignPressed(){
        if isLogin && !checkInput(){
            return
        }
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let cv = sb.instantiateViewController(withIdentifier: "CheckView") as! CheckViewConroller
        cv.user = "Zhang.Jun"
        cv.email = "jun.ju.zhang@oracle.com"
        //  cv.delegate = self
        self.present(cv, animated: true, completion: nil)
        if ViewController.isFirstSkip {
            ViewController.isFirstSkip = false
        }
            NavigationDrawer.sharedInstance.initialize(forViewController: cv,isFirstSkip: ViewController.isFirstSkip)
    }
    
    var alert = UcAlert()
    func checkInput() -> Bool {
        if (txtPhone?.text?.isEmpty)! || (txtPwd?.text?.isEmpty)!{
            NSLog("Phone和密码不能为空")
            alert.Error(info: "The user or pwd can not be empty", level: 1, view: self)
            return false
            
        }
        else if txtPhone?.text != "13800001111"{
            NSLog("不存在的用户名")
            alert.Error(info: "The user dose not exist", level: 1, view: self)
            return false
        }
        if txtPwd?.text != "123"{
            NSLog("密码错误")
            alert.Error(info: "The user dose not exist", level: 1, view: self)
            return false
        }
        return true
    }
    
    func showLoginView() {
        btnSign.setTitle("LOGIN", for: .normal)
        btnLogIn.setTitle("SignUp", for: .normal)
        isLogin = true
        btnLogIn.frame.origin.y -= 40
        btnSign.frame.origin.y -= 40
        btnSkip.frame.origin.y -= 40
        txtPwd.frame.origin.y -= 40
        txtPhone.frame.origin.y -= 40
        lbldiv.frame.origin.y -= 40
        txtName.isHidden = true
        clearTxt()
        txtPhone.becomeFirstResponder()
    }
    
    func showSignUpView() {
        btnSign.setTitle("SIGNUP", for: .normal)
        btnLogIn.setTitle("Login", for: .normal)
        isLogin = false
        btnLogIn.frame.origin.y += 40
        btnSign.frame.origin.y += 40
        btnSkip.frame.origin.y += 40
        txtPwd.frame.origin.y += 40
        txtPhone.frame.origin.y += 40
        lbldiv.frame.origin.y += 40
        txtName.isHidden = false
        clearTxt()
        txtName.becomeFirstResponder()
    }
    
    func clearTxt() {
        txtPhone.text = nil
        txtPwd.text = nil
        txtName.text = nil
    }

}

