//
//  Sign_UpViewController.swift
//  GRAB_K16
//
//  Created by yenyen on 20/12/2022.
//

import UIKit
import Kingfisher
import SwiftUI

class Sign_UpViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var txtCommune: UITextField!
    @IBOutlet weak var txtDistrict: UITextField!
    @IBOutlet weak var txtProvince: UITextField!
    @IBOutlet weak var txtFullName: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var errorEmail: UILabel!
    
    @IBOutlet weak var errorPhoneNumber: UILabel!
    @IBOutlet weak var errorPassword: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        resetForm()
        
        txtEmail.layer.borderWidth = 2
        txtEmail.layer.cornerRadius = 5
        txtEmail.layer.borderColor = UIColor.orange.cgColor
        txtEmail.layer.masksToBounds = true

        txtPassword.layer.borderWidth = 2
        txtPassword.layer.cornerRadius = 5
        txtPassword.layer.borderColor = UIColor.orange.cgColor
        txtPassword.layer.masksToBounds = true

        txtPhoneNumber.layer.borderWidth = 2
        txtPhoneNumber.layer.cornerRadius = 5
        txtPhoneNumber.layer.borderColor = UIColor.orange.cgColor
        txtPhoneNumber.layer.masksToBounds = true

        txtFullName.layer.borderWidth = 2
        txtFullName.layer.cornerRadius = 5
        txtFullName.layer.borderColor = UIColor.orange.cgColor
        txtFullName.layer.masksToBounds = true

        txtProvince.layer.borderWidth = 2
        txtProvince.layer.cornerRadius = 5
        txtProvince.layer.borderColor = UIColor.orange.cgColor
        txtProvince.layer.masksToBounds = true

        txtDistrict.layer.borderWidth = 2
        txtDistrict.layer.cornerRadius = 5
        txtDistrict.layer.borderColor = UIColor.orange.cgColor
        txtDistrict.layer.masksToBounds = true

        txtCommune.layer.borderWidth = 2
        txtCommune.layer.cornerRadius = 5
        txtCommune.layer.borderColor = UIColor.orange.cgColor
        txtDistrict.layer.masksToBounds = true
        
     
    }
    func resetForm(){
//        btnSignUp.isEnabled = false
        
        errorEmail.isHidden = false
        errorPassword.isHidden = false
        errorPhoneNumber.isHidden = false
        
        errorEmail.text = "Required"
        errorPassword.text = "Required"
        errorPhoneNumber.text = "Required"
        
        txtEmail.text = ""
        txtPassword.text = ""
        txtPhoneNumber.text = ""
    }
    
    
    @IBAction func changedEmail(_ sender: Any) {
        
        if let email = txtEmail.text{
               if let errorMessage = invalidEmail(email){
                   errorEmail.text = errorMessage
                   errorEmail.isHidden = false
               }
               else{
                   errorEmail.isHidden = true
               }
           }
           checkForValidForm()
       }
       func invalidEmail(_ value: String) -> String?{
           let reqularExpression = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
           let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
           if !predicate.evaluate(with: value){
               return "Địa chỉ email không hợp lệ"
           }
           return ""
    }
    
    
    @IBAction func changedPassword(_ sender: Any) {
        
        if let password = txtPassword.text{
            if let errorMessage = invalidPassword(password){
                errorPassword.text = errorMessage
                errorPassword.isHidden = false
            }
            else{
                errorPassword.isHidden = true
            }
        }
        checkForValidForm()
        
    }
    func invalidPassword(_ value: String) -> String?{
        if  containsUpperCase(value){
            return "Mật khẩu phải chứa ít nhất 1 ký tự viết Hoa"
        }
        if value.count < 8{
            return "Mật khẩu phải ít nhất có 8 ký tự"
        }
        if containsDigit(value){
            return "Mật khẩu phải chứa ít nhất 1 chữ số"
        }
        if containsLowerCase(value){
            return "Mật khẩu phải chứa ít nhất 1 ký tự Chữ Thường"
        }
       
        return ""
        
    }
    func containsDigit(_ value: String) -> Bool{
        let reqularExpression = ".*[0-9]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
           
    }
    func containsLowerCase(_ value: String) -> Bool{
        let reqularExpression = ".*[a-z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }

    func containsUpperCase(_ value: String) -> Bool{
        let reqularExpression = ".*[A-Z]+.*"
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        return !predicate.evaluate(with: value)
    }
    
   
        
    @IBAction func changedPhoneNumber(_ sender: Any) {
        
        if let phoneNumber = txtPhoneNumber.text{
                                if let errorMessage = invalidPhoneNumber(phoneNumber){
                                    errorPhoneNumber.text = errorMessage
                                    errorPhoneNumber.isHidden = false
                                }else{
                                    errorPhoneNumber.isHidden = true
                                }
                            }
                    checkForValidForm()
        }
    func invalidPhoneNumber(_ value: String) -> String?
                    {
                        let set = CharacterSet(charactersIn: value)
                        if !CharacterSet.decimalDigits.isSuperset(of: set){
                            return "Số điện thoại chỉ được chứa số"
                        }
                        if value.count != 10 {
                            return "Số điện thoại phải dài 10 chữ số"
                        }
                        return nil

                    }
    func checkForValidForm(){
           if (errorEmail.isHidden && errorPassword.isHidden && errorPhoneNumber.isHidden){
               btnSignUp.isEnabled = true
           }else{
               btnSignUp.isEnabled = false
           }
       }
    
    @IBAction func changedSignUp(_ sender: Any) {
        resetForm()
        
//        _replDebugPrintln("vo")
//             NSLog("%0.4f", CGFloat.pi)
//             let url = URL(string: "http://www.stackoverflow.com")!
//
//             let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
//                 guard let data = data else { return }
//                 print(String(data: data, encoding: .utf8)!)
//             }
//
//             task.resume()
//             resetForm()
             
    }
}
