//
//  LoginViewController.swift
//  Bell
//
//  Created by Neha Magan Pal Singh on 17/08/2017.
//  Copyright © 2017 Punskyy, Roman. All rights reserved.
//

import UIKit
import LocalAuthentication

class LoginViewController: UIViewController, UITextFieldDelegate
{
    
    
    
    
    let reason = NSLocalizedString("Please Touch your home button to Authenticate", comment: "authReason")
    var errorPointer:NSError?
    @IBOutlet var login: UIButton!

    @IBOutlet var password: UITextField!
    @IBOutlet var username: UITextField!
    @IBAction func login(_ sender: Any) {
        
        
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Scan")
//        self.navigationController?.pushViewController(vc!, animated: true)
        
        
        
       if(self.username.text == "demo" && self.password.text == "demo" ){
            
            
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "pageview")
            self.navigationController?.pushViewController(vc!, animated: true)                      }
        
        
        
        else if (self.username.text == "" || self.password.text == "" )
        {
            
            let alertController = UIAlertController(title: "Alert", message: "Please enter your credentials.", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style:UIAlertActionStyle.default, handler: nil)
            alertController.addAction(okButton)
            self.present(alertController,animated: true,completion: nil)
            
            
            
            
            
            
//            let alertController = UIAlertController(title: "Alert", message: "Please enter your credentials.", preferredStyle: .alert)
//            let okButton = UIAlertAction(title: "Ok", style:UIAlertActionStyle.default, handler: nil)
//            alertController.addAction(okButton)
//            self.present(alertController,animated: true,completion: nil)
//
        }
       
        else{
            let alertController = UIAlertController(title: "Alert", message: "Username/Password is not correct.", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "Ok", style:UIAlertActionStyle.default, handler: nil)
            alertController.addAction(okButton)
            self.present(alertController,animated: true,completion: nil)

    }
   
    

    
           
        func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "blue-background (1).png")!)
        login.layer.borderWidth = 1
        login.layer.borderColor = UIColor.white.cgColor
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        
        view.addGestureRecognizer(tap)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        touchIDAuthentication()
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    
    func dismissKeyboard()
    {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    func touchIDAuthentication()
    {
        let context = LAContext() //1
        
        //2
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &errorPointer)
        {
            //3
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason, reply:
                { (success, error) in
                if success
                {
                    DispatchQueue.main.async
                        {
                        let vc = self.storyboard?.instantiateViewController(withIdentifier: "pageview")
                        self.navigationController?.pushViewController(vc!, animated: true)
                    }
                    
                }
                else
                {
                    DispatchQueue.main.async
                        {
                        //Authentication failed. Show alert indicating what error occurred
                        self.displayErrorMessage(error: error as! LAError )
                    }
                    
                }
            })
        }else {
            //Touch ID is not available on Device, use password.
            self.showAlertWith(title: "Error", message: (errorPointer?.localizedDescription)!)
            
        }
    }
    
    func displayErrorMessage(error:LAError) {
        var message = ""
        switch error.code {
        case LAError.authenticationFailed:
            message = "Authentication was not successful because the user failed to provide valid credentials."
            break
        case LAError.userCancel:
            message = "Authentication was canceled by the user"
            break
        case LAError.userFallback:
            message = "Authentication was canceled because the user tapped the fallback button"
            break
        case LAError.touchIDNotEnrolled:
            message = "Authentication could not start because Touch ID has no enrolled fingers."
        case LAError.passcodeNotSet:
            message = "Passcode is not set on the device."
            break
        case LAError.systemCancel:
            message = "Authentication was canceled by system"
            break
        default:
            message = error.localizedDescription
        }
        
        self.showAlertWith(title: "Authentication Failed", message: message)
    }
    
}




extension UIViewController {
    func showAlertWith(title:String, message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(actionButton)
        self.present(alertController, animated: true, completion: nil)
    }
}



