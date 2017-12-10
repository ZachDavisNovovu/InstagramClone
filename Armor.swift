//
//  Armor.swift
//  InstagramClone
//
//  Created by serge kone Dossongui on 12/8/17.
//  Copyright © 2017 serge kone Dossongui. All rights reserved.
//

import Foundation
// needs to be imported
import Parse

// subclassing PFObject will automatically register with Parse SDK now
// See https://github.com/parse-community/Parse-SDK-iOS-OSX/pull/967
class Armor: PFObject, PFSubclassing {
    // properties/fields must be declared here
    // @NSManaged to tell compiler these are dynamic properties
    // See https://stackoverflow.com/questions/31357564/what-does-nsmanaged-do
    @NSManaged var displayName: String?
    // Objective C has no concept of optionals
    @NSManaged var fireProof: Bool
    @NSManaged var rupees: Int
    
    // returns the Parse name that should be used
    class func parseClassName() -> String {
        return "Armor"
    }
}
