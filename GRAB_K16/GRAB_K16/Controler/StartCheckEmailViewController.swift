//
//  StartCheckEmailViewController.swift
//  GRAB_K16
//
//  Created by yenyen on 27/12/2022.
//

import UIKit

class StartCheckEmailViewController: UIViewController {

    @IBOutlet weak var btnSignUp: UIButton!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        txtEmail.layer.borderWidth = 2
        txtEmail.layer.cornerRadius = 17
        txtEmail.layer.borderColor = UIColor.orange.cgColor
        txtEmail.layer.masksToBounds = true

        txtPassword.layer.borderWidth = 2
        txtPassword.layer.cornerRadius = 17
        txtPassword.layer.borderColor = UIColor.orange.cgColor
        txtPassword.layer.masksToBounds = true
        
        btnSignUp.layer.borderWidth = 3
        btnSignUp.layer.cornerRadius = 20
        btnSignUp.layer.borderColor = UIColor.yellow.cgColor
        btnSignUp.layer.backgroundColor = UIColor.orange.cgColor
        btnSignUp.layer.masksToBounds = true
    }
    


}
