//
//  ViewController.swift
//  PHN Technology Machine Test
//
//  Created by Mac on 21/04/23.
//

import UIKit

class ViewController: UIViewController {
    let userManager = UserManager(userDBRepository: UserDBRepository())
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwardTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        emailTextField.text = ""
        passwardTextField.text = ""
    }
    @IBAction func signInButtonTapped(_ sender: Any) {
        let currentUser = userManager.getUser(by: emailTextField.text!)
        if currentUser!.email == emailTextField.text && currentUser!.password == passwardTextField.text{
            let homeVC = storyboard?.instantiateViewController(identifier: "HomeController") as! HomeController
            navigationController?.pushViewController(homeVC, animated: true)
        }else if emailTextField.text == "" || passwardTextField.text == ""{
            Alert.alert(message: "Email-id or Password is empty", viewController: self)
        }
        else if !emailTextField.text!.isEmailId{
            Alert.alert(message: "Email-id is incorrect", viewController: self)
        }
        
        else{
            Alert.alert(message: "User not found check your Email-id and Password", viewController: self)
        }
        
    }
    @IBAction func signUpButtonTapped(_ sender: Any) {
        let signUpVc = storyboard?.instantiateViewController(identifier: "SignUpController") as! SignUpController
        navigationController?.pushViewController(signUpVc, animated: true)
    }
}

