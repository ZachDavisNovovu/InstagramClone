//
//  HomeViewController.swift
//  InstagramClone
//
//  Created by serge kone Dossongui on 12/8/17.
//  Copyright © 2017 serge kone Dossongui. All rights reserved.
//

import UIKit
import Parse

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    var PostArray:[PFObject]!
    var messages = [String]()
    var usernames = [String]()
    var imageFiles = [PFFile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self ;
        self.tableView.dataSource = self

        // Do any additional setup after loading the view.
         Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.onTimer), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view.
        
        // Auto size row height based on cell autolayout constraints
        tableView.rowHeight = UITableViewAutomaticDimension
       
        // Provide an estimated row height. Used for calculating scroll indicator
        tableView.estimatedRowHeight = 50
        
        tableView.separatorStyle = .none
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! postTableViewCell
        
        
        let post = PostArray[indexPath.row]
        cell.postComment.text = post["caption"] as! String
        
        imageFiles[indexPath.row].getDataInBackground { (data, error) -> Void in
            
            if let downloadedImage = UIImage(data: data!) {
                
               cell.postImage.image = downloadedImage
                
                
                
            }
        
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if  PostArray != nil   {
            return PostArray.count
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func OnTapToLogOut(_ sender: Any) {
        
        PFUser.logOutInBackground { (error) in
            // PFUser.current() will now be nil
            self.performSegue(withIdentifier: "LogOutSegue", sender: self)
            
       
            
        }
        
        
    }
    
    
    
    @IBAction func OnTapTakePic(_ sender: Any) {
        
          self.performSegue(withIdentifier: "TakeAPicSegue", sender: self)
    }
    
  /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "TakeAPicSegue" {
     
                let destinationViewController = segue.destination as! TakeAPicViewController
 
        }
    }*/
    

    
    
    //user Defined Function
    func onTimer() {
        
       fetchMessage() 
    }
    
    
    func fetchMessage() {
        
        
        
        var query  = PFQuery(className: "Post")
        
        //sort result
        query.addDescendingOrder("createdAt")
        // add user to query
       // query.includeKey("user")
        query.includeKey("author")
        query.limit = 20
        
        
        /*  query.getObjectInBackground(withId: self.projectID, block: {(object,error) -> Void in
         
         if error == nil  {
         print(object)
         } else {
         print(error)
         }
         })*/
        
        
        
   
        query.findObjectsInBackground { (object, error) in
            if error == nil  {
                print(object)
                
                self.PostArray = object
                
                if let objects = object {
                    
                    for object in objects {
                        
                        self.messages.append(object["caption"] as! String)
                        
                        self.imageFiles.append(object["media"] as! PFFile)
                        
                       // self.usernames.append(self.users[object["author"] as! String]!)
                        
                        self.tableView.reloadData()
                        
                    }

                }
                
            } else {
                print(error)
            }
        }
    }

 
}
