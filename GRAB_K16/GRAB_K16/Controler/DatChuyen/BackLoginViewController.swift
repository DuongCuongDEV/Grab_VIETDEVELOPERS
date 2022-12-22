//
//  BackLoginViewController.swift
//  GRAB_K16
//
//  Created by ChâuNT on 22/12/2022.
//

import UIKit

class BackLoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func BackLogin(_ sender: Any) {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier:"login")
            vc .modalPresentationStyle = .overFullScreen
            present(vc,animated: true)
    }
}
