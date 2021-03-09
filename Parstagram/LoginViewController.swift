//
//  LoginViewController.swift
//  Parstagram
//
//  Created by sunhyeok on 2021/03/08.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernamefield: UITextField!
    @IBOutlet weak var passwordfield: UITextField!
    
    
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernamefield.text
        let password = passwordfield.text
        
        PFUser.logInWithUsername(inBackground: username!, password: password!) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
    }
    
    
    @IBAction func OnSignUp(_ sender: Any) {
        var user = PFUser(className: "_User")
        user.username = usernamefield.text
        user.password = passwordfield.text
        
        user.signUpInBackground { (success, error) in
            if success{
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else{
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
