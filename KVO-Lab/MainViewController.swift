//
//  ViewController.swift
//  KVO-Lab
//
//  Created by Liubov Kaper  on 4/7/20.
//  Copyright © 2020 Luba Kaper. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    @IBOutlet weak var balanceTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        balanceTextField.delegate = self
        nameTextField.delegate = self
        configureObservation()
    }
    
    private func configureObservation() {
       
        let balance = Int(balanceTextField.text ?? "")
        UserInfo.shared.amount = balance ?? 0
        
            let name = nameTextField.text
            UserInfo.shared.name = name ?? "John"
        let accounts = [UserInfo]()
        Account.shared.users = accounts
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}

extension MainViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let user = UserInfo()
        if let name = nameTextField.text, let balance = balanceTextField.text {
            user.name = name
            user.amount = Int(balance) ?? 0
        }
//        if textField == balanceTextField {
//        let balance = Int(textField.text ?? "")
//            user.amount = balance ?? 0
//        } else if textField == nameTextField {
//            let name = textField.text
//            user.name = name ?? "John"
//            
//        }
        Account.shared.users.append(user)
        return true
    }
}
