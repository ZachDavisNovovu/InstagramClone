//
//  ViewController.swift
//  InstagramClone
//
//  Created by serge kone Dossongui on 12/8/17.
//  Copyright © 2017 serge kone Dossongui. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var credentialView: UIView!
    @IBOutlet weak var emailField: UITextField!
   
  
    @IBOutlet weak var logoTextView: UILabel!
    @IBOutlet weak var LogoBackgroundView: UIView!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var blurEffectView:UIVisualEffectView?
   
    @IBOutlet weak var InstagramLogoLabel: UILabel!
    @IBOutlet weak var viewInstagram: UIView!
 
    @IBOutlet weak var SignUpView: UIView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
  /*
        let shield = Armor()
        shield.displayName = "Wooden Shield"
        shield.fireProof = false
        shield.rupees = 50
        
        
    
        
        shield.saveInBackground(block: { (success, error) in
            if (success) {
                
                print("worke")
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        })*/
    }
    
 
    
    override func viewWillAppear(_ animated: Bool) {
    //    self.credentialView.isHidden = true
        
      let borderColor: UIColor = UIColor.gray
      let color_shadow: CGFloat = 157.0 / 255.0
        
        self.emailField.layer.cornerRadius = 6.0
        self.emailField.layer.borderWidth = 2
        self.emailField.layer.borderColor = borderColor.cgColor
        self.emailField.layer.borderColor = UIColor(red: color_shadow, green: color_shadow, blue: color_shadow, alpha: 0.1).cgColor
        
        self.usernameField.layer.cornerRadius = 6.0
        self.usernameField.layer.borderWidth = 2
        self.usernameField.layer.borderColor = borderColor.cgColor
        self.usernameField.layer.borderColor = UIColor(red: color_shadow, green: color_shadow, blue: color_shadow, alpha: 0.1).cgColor
        
        self.passwordField.layer.cornerRadius = 6.0
        self.passwordField.layer.borderWidth = 2
        self.passwordField.layer.borderColor = borderColor.cgColor
        self.passwordField.layer.borderColor = UIColor(red: color_shadow, green: color_shadow, blue: color_shadow, alpha: 0.1).cgColor
        
        
     //   InstagramLogoLabel.font = UIFont(name: "Cookie-Regular", size: 40
      //  )
        
        
        
       // let  blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
      //  blurEffectView = UIVisualEffectView(effect: blurEffect)
      //  blurEffectView?.frame = view.bounds
     //   LogoBackgroundView.addSubview(blurEffectView!)
        
        
         }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func TapOnSignUp(_ sender: Any) {
        
       // self.credentialView.isHidden = false
        self.emailField.isHidden = false
        
        
        // animate
        UIView.animate(withDuration: 0.7, animations:
            {
                
    
                let newFrame : CGRect = CGRect(x: 0, y: 0, width: self.LogoBackgroundView.frame.width, height: self.LogoBackgroundView.frame.height-self.logoTextView.frame.height)
              
                
                self.LogoBackgroundView.frame = newFrame;
                self.logoTextView.isHidden = true
        
                
        })

        self.credentialView.isHidden = false
        self.SignUpView.isHidden  = true
       
        
        
    }
    
    @IBAction func tapOnLogin(_ sender: Any) {
        
      
       
        
        
        // animate
        UIView.animate(withDuration: 0.7, animations:
            {
                
                
                //logo moving up
                
                let newFrame : CGRect = CGRect(x: 0, y: 0, width: self.LogoBackgroundView.frame.width, height: self.LogoBackgroundView.frame.height-self.logoTextView.frame.height)
                
                
                self.LogoBackgroundView.frame = newFrame;
                self.logoTextView.isHidden = true
                
                
                //username  moving up to emailfield location
               let usernamenewFrame : CGRect = CGRect(x: self.emailField.frame.origin.x, y: self.emailField.frame.origin.y, width: self.emailField.frame.width, height: self.emailField.frame.height)
                
                
         
                let passwordnewFrame : CGRect = CGRect(x: self.usernameField.frame.origin.x, y: self.usernameField.frame.origin.y, width: self.usernameField.frame.width, height: self.usernameField.frame.height)
                
                 
                  self.usernameField.frame = usernamenewFrame;
                  self.passwordField.frame = passwordnewFrame;

          
                
               //password filed moving up to username location
                
                
        })
        
         self.emailField.isHidden = true
        self.credentialView.isHidden = false
        self.SignUpView.isHidden  = true
        

        
    }
    
    @IBAction func login(_ sender: Any) {
        
        
        //used character count because email address is a least 3 character name, . , @
        
        if(self.emailField.isHidden == false){
            
            
            if let email = emailField.text, let pwd = passwordField.text , let username = usernameField.text,(email.characters.count > 3 && pwd.characters.count > 0 && username.characters.count > 0 ){
                
                self.registerUser(username: username ,password: pwd  ,email: email)
                
                
                
            }else {
                
                showErrorAlert("Field missing",msg: "We can't proceed because one of the fields is blank. Please note that all fields are required.")
                return
                
            }
        }else {
            
            
            if let pwd = passwordField.text , let username = usernameField.text,(pwd.characters.count > 0 && username.characters.count > 0 ){
                
                self.loginUser(username: username ,password: pwd)
                
                
            }else {
                
                showErrorAlert("Field missing",msg: "We can't proceed because one of the fields is blank. Please note that all fields are required.")
                return
                
            }
            
            
            
            
        }
        
        
    }
    
    /*   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "loginSegue" {
     
     let destinatinationViewcontroller = segue.destination as! ChatViewController
     
     
     
     }
     }*/
    
    
    @IBAction func TapOnMainView(_ sender: Any) {
    }
    
    @IBAction func OnTapOnswitch(_ sender: Any) {
        
        credentialView.endEditing(true)
        
    }
    
    
    
    
    //register the user
    func registerUser(username: String , password:String, email:String) {
        // initialize a user object
        let newUser = PFUser()
        
        
        
        // set user properties
        newUser.username = username
        newUser.email = email
        newUser.password = password
        
        // call sign up function on the object
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                print(error.localizedDescription)
                self.showErrorAlert("Error ",msg: "\(error.localizedDescription)")
                return
                
                
                
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            }
        }
    }
    
    func showErrorAlert(_ title : String , msg :String) {
        
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func loginUser(username: String , password:String) {
        
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user: PFUser?, error: Error?) in
            if let error = error {
                
                self.showErrorAlert("Error ",msg: "\(error.localizedDescription)")
                return
                
            } else {
                
                // manually segue to logged in view
                self.performSegue(withIdentifier: "LoginSegue", sender: nil)
            }
        }   
    }
    
}

