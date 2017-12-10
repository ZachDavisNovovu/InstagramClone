//
//  ViewDesign.swift
//  InstagramClone
//
//  Created by serge kone Dossongui on 12/9/17.
//  Copyright © 2017 serge kone Dossongui. All rights reserved.
//

import Foundation

//
//  ViewDesign.swift
//  Yelp
//
//  Created by serge kone Dossongui on 12/1/17.
//  Copyright © 2017 Timothy Lee. All rights reserved.
//

import Foundation
import UIKit


private  var materialKey = false

extension UIView {
    
    
    
    @IBInspectable var viewDesign :Bool {
        
        get {
            
            return materialKey
        }
        
        set {
            
            materialKey = newValue
            
            
            if materialKey {
                self.layer.masksToBounds = false
                self.layer.cornerRadius = 3.0
                self.layer.shadowOpacity = 0.8
                self.layer.shadowRadius = 3.0
                self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
                self.layer.shadowColor = UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 1.0).cgColor
            }
            else{
                
                self.layer.cornerRadius = 0
                self.layer.shadowOpacity = 0
                self.layer.shadowRadius = 0.0
                self.layer.shadowColor = nil
            }
            
        }
        
    }
    
}
