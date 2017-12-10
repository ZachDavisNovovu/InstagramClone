//
//  ButtonDesign.swift
//  InstagramClone
//
//  Created by serge kone Dossongui on 12/9/17.
//  Copyright © 2017 serge kone Dossongui. All rights reserved.
//



import Foundation
import UIKit


class ButtonDesign: UIButton {
    
    override func awakeFromNib() {
        layer.cornerRadius = 6.0
        
        
        
        //shadow
        
        var color_shadow:CGFloat = 157.0 / 255.0
        layer.shadowColor = UIColor(red: color_shadow, green: color_shadow, blue: color_shadow, alpha: 0.5).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
    }
    
}

