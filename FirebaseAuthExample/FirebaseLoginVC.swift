//
//  FirebaseLoginVC.swift
//  FirebaseAuthExample
//
//  Created by Sean Goldsborough on 6/20/18.
//  Copyright © 2018 Sean Goldsborough. All rights reserved.
//

import Foundation
import UIKit
import Firebase

class FirebaseLoginVC: UIViewController {
    
    
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBAction func signInButton(_ sender: Any) {
        Auth.auth().createUser(withEmail: emailTF.text!, password: passwordTF.text!) { user, error in
            if error == nil {
                // 3
                Auth.auth().signIn(withEmail: self.emailTF.text!,
                                   password: self.passwordTF.text!)
                let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "NextVC") as! ViewController
                self.navigationController?.pushViewController(nextVC, animated: true)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
//            // ...
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
