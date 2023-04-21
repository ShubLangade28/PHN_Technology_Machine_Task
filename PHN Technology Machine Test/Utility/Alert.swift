//
//  Alert.swift
//  PHN Technology Machine Test
//
//  Created by Mac on 21/04/23.
//

import UIKit
class Alert{
    static func alert(message : String, viewController : UIViewController){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
