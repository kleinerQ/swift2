//
//  SignUpViewController.swift
//  2018.06.26_1
//
//  Created by admin on 2018/6/27.
//  Copyright © 2018年 Simon Chang. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    let url = "http://simonhost.hopto.org/chatroom/signUp.php"
//    let url = "http://192.168.211.146/chatroom/signUp.php"

    @IBOutlet weak var accountText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var realnameText: UITextField!
    var isShowPassword: Bool = false
    
    @IBAction func signup(_ sender: Any) {
        let acc = accountText.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let pwd = passwordText.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        let rel = realnameText.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if accountText.text == "" {
            
        }else if passwordText.text == "" {
            
        }else if realnameText.text == "" {
            
        }
        
        if accountText.text != "", passwordText.text != "", realnameText.text != "" {
            let signUpURL = URL(string: url)
            var formatter = DateFormatter()
            formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
            
            let now = formatter.string(from: Date())
            
            var request = URLRequest(url: signUpURL!, cachePolicy: .reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 30)
            request.httpBody = "account=\(acc!)&password=\(pwd!)&realName=\(rel!)&now=\(now)" .data(using: .utf8)
            request.httpMethod = "POST"
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            let dataTesk = session.dataTask(with: request) { (data, response, error) in
                
                if let data = data {
                    let html = String(data:data, encoding: .utf8)
                    if html == "1" {
                        DispatchQueue.main.async {
                            self.showAlert(title: "成功", msg: "回到登入頁面", action: { (action) in
                                self.dismiss(animated: true, completion: nil)
                            })
                        }
                    }else if html == "2" {
                        DispatchQueue.main.async {
                            self.showAlert(title: "錯誤", msg: "此帳號已存在", action: nil)
                        }
                        
                    }else if html == "3" {
                        DispatchQueue.main.async {
                            self.showAlert(title: "錯誤", msg: "連線錯誤", action: nil)
                        }
                    }else {
                        DispatchQueue.main.async {
                            self.showAlert(title: "錯誤", msg: "連線錯誤", action: nil)
                        }
                    }
                }
            }
            dataTesk.resume()
            
        }
        
    }
    
    
    @IBAction func showPassword(_ sender: UIButton) {
        isShowPassword = !isShowPassword
        if isShowPassword {
            passwordText.isSecureTextEntry = false
            DispatchQueue.main.async {
                sender.imageView?.image = UIImage(named: "invisible")
                self.passwordText.textContentType = UITextContentType.password
                
            }
        }else {
            passwordText.isSecureTextEntry = true
            DispatchQueue.main.async {
                sender.imageView?.image = UIImage(named: "visible")
                self.passwordText.textContentType = UITextContentType.password
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        accountText.addTarget(self, action: #selector(accountEndEditing(sender:)), for: .editingDidEndOnExit)
        passwordText.addTarget(self, action: #selector(passwordEndEditing(sender:)), for: .editingDidEndOnExit)
        realnameText.addTarget(self, action: #selector(realnameEndEditing(sender:)), for: .editingDidEndOnExit)
        
        realnameText.addTarget(self, action: #selector(textFieldDidEditing(sender:)), for: .editingDidBegin)
        realnameText.addTarget(self, action: #selector(textFieldEndEditing(sender:)), for: .editingDidEnd)
        passwordText.addTarget(self, action: #selector(textFieldDidEditing(sender:)), for: .editingDidBegin)
        passwordText.addTarget(self, action: #selector(textFieldEndEditing(sender:)), for: .editingDidEnd)
        passwordText.isSecureTextEntry = true
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func showAlert(title: String, msg: String , action: ((UIAlertAction) -> Void)?) {
        
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let OK = UIAlertAction(title: "確認", style: .cancel, handler: action)
        alert.addAction(OK)
        self.present(alert,animated: true,completion: nil)
    }
    
    @objc func accountEndEditing(sender: UITextField) {
        sender.endEditing(true)
        passwordText.becomeFirstResponder()
        
    }
    @objc func passwordEndEditing(sender: UITextField) {
        sender.endEditing(true)
        realnameText.becomeFirstResponder()
    }
    @objc func textFieldDidEditing(sender: UITextField) {
        UIView.animate(withDuration: 0.5) {
        switch sender.restorationIdentifier {
        case "password_text":
            self.view.frame.origin.y -= 50
        case "realname_text":
            self.view.frame.origin.y -= 80
        default:
            break
        }
        }
    }
    @objc func textFieldEndEditing(sender: UITextField) {
        UIView.animate(withDuration: 0.5) {
            self.view.frame.origin.y = 0
        }
    }
    @objc func realnameEndEditing(sender: UITextField) {
        sender.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
