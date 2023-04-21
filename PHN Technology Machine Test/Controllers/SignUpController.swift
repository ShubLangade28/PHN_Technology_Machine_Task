//
//  SignUpController.swift
//  PHN Technology Machine Test
//
//  Created by Mac on 21/04/23.
//

import UIKit

class SignUpController: UIViewController {
    let userManager = UserManager(userDBRepository: UserDBRepository())
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        debugPrint(path[0])
        // Do any additional setup after loading the view.
    }
    @IBAction func signUpButtonTapped(_ sender: Any) {

        if usernameTextField.text! == "" || emailTextField.text == "" || passwordTextField.text == "" || confirmPasswordTextField.text == ""{
            Alert.alert(message: "Something went wrong check all field", viewController: self)
        }
        else if passwordTextField.text != confirmPasswordTextField.text{
            Alert.alert(message: "Password is not matching", viewController: self)
        }
        else if emailTextField.text!.count > 0{
            if !emailTextField.text!.isEmailId{
                Alert.alert(message: "Email-id is incorrect", viewController: self)
            }
            else{
                userManager.create(user: User(username: usernameTextField.text, email: emailTextField.text, password: passwordTextField.text))
                navigationController?.popToRootViewController(animated: true)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
