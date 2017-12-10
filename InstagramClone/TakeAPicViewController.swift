//
//  TakeAPicViewController.swift
//  InstagramClone
//
//  Created by serge kone Dossongui on 12/8/17.
//  Copyright © 2017 serge kone Dossongui. All rights reserved.
//

import UIKit
import Parse

class TakeAPicViewController: UIViewController,UINavigationControllerDelegate,UIImagePickerControllerDelegate  {
    
    @IBOutlet var MainView: UIView!
    @IBOutlet weak var imageToPost: UIImageView!
    var activityIndicator = UIActivityIndicatorView()
    @IBOutlet var message: UITextField!
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
        
        
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayAlert(_ title: String, message: String) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
        
        
        
        
        
    }
    
    @IBAction func unwindToHome(segue: UIStoryboardSegue) {}
    
    @IBAction func chooseImage(_ sender: AnyObject) {
        
        
        
        let optionMenu = UIAlertController(title: nil, message: "Use Camera to take picture of the item", preferredStyle: UIAlertControllerStyle.actionSheet)
        
        
        let cancelHandler = { (action:UIAlertAction!) -> Void in
            
            self.dismiss(animated: true, completion: {});
            
        }
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelHandler)
        optionMenu.addAction(cancelAction)
        
        
        
        
        let TakePictureHandler = { (action:UIAlertAction!) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .camera
                imagePicker.delegate = self
                
                
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        
        let TakeAPicture = UIAlertAction(title: "Take Photo or Video ", style: UIAlertActionStyle.default, handler: TakePictureHandler)
        optionMenu.addAction(TakeAPicture)
        
        
        
        let LoadPictureHandler = { (action:UIAlertAction!) -> Void in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                let imagePicker = UIImagePickerController()
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .photoLibrary
                imagePicker.delegate = self
                
                
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
        
        
        let LoadAPicture = UIAlertAction(title: "Load Photo From Library ", style: UIAlertActionStyle.default, handler: LoadPictureHandler)
        optionMenu.addAction(LoadAPicture)
        
        
        
        
        
        self.present(optionMenu, animated: true, completion: nil)
        
        
        present(imagePicker, animated: true, completion: nil)
        
        
        
        let image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = false
        
        self.present(image, animated: true, completion: nil)
        
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        self.dismiss(animated: true, completion:nil)
        
        imageToPost.image = image
        
        
        
    }
    
    
    
    
    @IBAction func postImage(_ sender: AnyObject) {
        
        activityIndicator = UIActivityIndicatorView(frame: self.view.frame)
        activityIndicator.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        UIApplication.shared.beginIgnoringInteractionEvents()
        
        
        
        let post = Post()
        Post.postUserImage(image: imageToPost.image, withCaption: self.message.text, withCompletion: { (success, error) in
            
            self.activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            
            
            
            if (success) {
                self.displayAlert("Image Posted!", message: "Your image has been posted successfully")
                
                self.performSegue(withIdentifier: "backTohome", sender: self)
                

                
                // The object has been saved.
            } else {
                // There was a problem, check error.description
                self.displayAlert("Could not post image", message: "Please try again later")
                
            }
        })
        
        
        
    }
    
    
    @IBAction func OnTapMainScreen(_ sender: Any) {
        
        MainView.becomeFirstResponder()
        self.message.endEditing(true)
    }
    
    func keyboardWillShow(notification :NSNotification){
    }
    func keyboardWillHide(notification :NSNotification){
        
        print("hiding")
    }
    
    
    @IBAction func goBackToTheHomeView(_ sender: Any) {
        
        self.performSegue(withIdentifier: "backTohome", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "backTohome" {
            
            
            let destinationViewController = segue.destination as! HomeViewController
            
            
            
        }
        
        
    }
    
    
}
