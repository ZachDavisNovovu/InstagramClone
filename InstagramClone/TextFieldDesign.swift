//
//  TextFieldDesign.swift
//  InstagramClone
//
//  Created by serge kone Dossongui on 12/9/17.
//  Copyright © 2017 serge kone Dossongui. All rights reserved.
//

import Foundation
import UIKit



class TextFieldDesign : UITextView {
    
    override func awakeFromNib() {
        layer.cornerRadius = 10
        layer.borderWidth = 0
        layer.borderColor = UIColor.lightGray as! CGColor
        
    }
    
    
}
