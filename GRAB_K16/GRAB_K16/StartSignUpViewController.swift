//
//  StartSignUpViewController.swift
//  GRAB_K16
//
//  Created by yenyen on 27/12/2022.
//

import UIKit
struct NguoiDung:Codable{
    var tenDangNhap: String = ""
    var matKhau: String = ""
}

class StartSignUpViewController: UIViewController {
    var taiKhoanData: TaiKhoans = []
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtPhoneNumber: UITextField!
    @IBOutlet weak var txtFullName: UITextField!
    
    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var errorEmail: UILabel!
    
    @IBOutlet weak var errorPassword: UILabel!
    
    @IBOutlet weak var errorPhoneNumber: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        getTaiKhoanAPI()
        
        txtEmail.layer.borderWidth = 2
        txtEmail.layer.cornerRadius = 7
        txtEmail.layer.borderColor = UIColor.orange.cgColor
        txtEmail.layer.masksToBounds = true

        txtPassword.layer.borderWidth = 2
        txtPassword.layer.cornerRadius = 7
        txtPassword.layer.borderColor = UIColor.orange.cgColor
        txtPassword.layer.masksToBounds = true

        txtPhoneNumber.layer.borderWidth = 2
        txtPhoneNumber.layer.cornerRadius = 7
        txtPhoneNumber.layer.borderColor = UIColor.orange.cgColor
        txtPhoneNumber.layer.masksToBounds = true

        txtFullName.layer.borderWidth = 2
        txtFullName.layer.cornerRadius = 7
        txtFullName.layer.borderColor = UIColor.orange.cgColor
        txtFullName.layer.masksToBounds = true
        
        btnSignUp.layer.cornerRadius = 10

       
    }
    func getTaiKhoanAPI(){
        
   var nguoiDung = NguoiDung()
        nguoiDung.tenDangNhap = "cuong@gmail.com"
        nguoiDung.matKhau = "vietnam1$"
        print("nhsib2")
        APIGrabHandler.init().getThongTinTaiKhoan(nguoiDung: nguoiDung){
            taiKhoansReponseData in
            self.taiKhoanData = taiKhoansReponseData
//            self.defaults.set(true, forKey: "calledAPI")
            print("Tai khoan\(taiKhoansReponseData)")
//                self.txtProvince.reloadData()
            print(self.taiKhoanData[0])

        }
        
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
    
        if value.isEmpty{
            return "Bắt buộc nhập, k dc để trống!"
        }
        let predicate = NSPredicate(format: "SELF MATCHES %@", reqularExpression)
        if !predicate.evaluate(with: value){
            return "Địa chỉ email không hợp lệ"
        }
        return nil
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
        if value.isEmpty{
            return "Bắt buộc nhập, k dc để trống!"
        }
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
       
        return nil
        
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
                        if value.isEmpty{
                            return "Bắt buộc nhập, k dc để trống!"
                        }
                        if !value.starts(with: "0"){
                            return "Số điện thoại không đúng định dạng, phải có số 0 ở đầu"
                        }
                        if !CharacterSet.decimalDigits.isSuperset(of: set){
                            return "Số điện thoại chỉ chứa có số"
                        }
                        if value.count != 10 {
                            return "Số điện thoại phải dài 10 chữ số"
                        }
                        return nil

                    }
    func checkForValidForm(){
       
           
       }
    
    @IBAction func btnSignUp(_ sender: Any) {
        changedEmail("\(txtEmail.text!)")
        changedPassword("\(txtPassword.text!)")
        changedPhoneNumber("\(txtPhoneNumber.text!)")
        
        if (errorEmail.isHidden && errorPassword.isHidden && errorPhoneNumber.isHidden){
            
            //chuyen qua man hinh tiep theo
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
                        let vc = storyboard.instantiateViewController(withIdentifier:"SignUp2")
                        vc .modalPresentationStyle = .overFullScreen
                        present(vc,animated: true)
        }
    }
    
    @IBAction func changedFullName(_ sender: Any) {
    }
}

