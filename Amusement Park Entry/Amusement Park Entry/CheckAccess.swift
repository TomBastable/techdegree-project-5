//
//  Swipe.swift
//  Amusement Park Entry
//
//  Created by Tom Bastable on 26/04/2019.
//  Copyright © 2019 Tom Bastable. All rights reserved.
//

import Foundation
import UIKit

var fiveSecondBlockedEntrants: [blockedPass] = []

func checkAccess(swipeLocation: AreaAccess, pass: Entrant) throws -> Bool {
    
    var entrantDoesHaveAccess: Bool = false
    let entrantDateOfBirth: Date? = pass.dateOfBirth
    let entrantAreaAccess: [AreaAccess] = pass.areaAccess
    let comparisonPass = blockedPass(passId: pass.uniquePassID, location: swipeLocation)
    //check for double swipe
    
    if fiveSecondBlockedEntrants.contains(comparisonPass){
        
        print("Access Denied - pass was swiped too recently.")
        throw PassSwipeError.swipedTooRecently
        
    }
    else {
    
    // Check if the pass has access to the location it has been swiped at
        
    for location in entrantAreaAccess {
        if swipeLocation == location{
            entrantDoesHaveAccess = true
        }
    }
    
    }
    
    // Deal with the access / denial appropriately
    
    if entrantDoesHaveAccess {
        
        print("Access Granted - they have access to this area.")
        
        // Play access granted sound
        
        // Check for Birthday, if it's their birthday say Happy Birthday!
        
        if entrantDateOfBirth != nil {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM"
            
            let date: Date? = entrantDateOfBirth
            print(dateFormatter.string(from: date!))
            
            let todaysDate: Date? = Date()
            
            print(dateFormatter.string(from: todaysDate!))
            
            if dateFormatter.string(from: date!) == dateFormatter.string(from: todaysDate!){
                
                NotificationCenter.default.post(name: Notification.Name("BirthdayAlert"), object: nil)
                print("Happy Birthday! Two Candy Canes for you Glen Coco. You go Glen Coco.")
                
            }
            
        }
        
        // Apply a timed block for the pass
        applyTimedPassBlock(toPass: comparisonPass)
        
        return true
        
    }
    else{
        
        print("Access Failure - Entrant does not have access to this area")
        
        // Play failure sound
        
        //Applied timed block for the pass
        
        applyTimedPassBlock(toPass: comparisonPass)
        
        return false
        
    }

}

func applyTimedPassBlock(toPass pass: blockedPass){
    
    // Add unique pass ID to a stack of blocked ID's that are blocked for 5 seconds.
    
    fiveSecondBlockedEntrants.append(pass)
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 5.0, execute: {
        
        let index = fiveSecondBlockedEntrants.firstIndex(where: { (item) -> Bool in
            item == pass
        })
        
        fiveSecondBlockedEntrants.remove(at: index!)
        
        print("Pass is now unblocked \(pass)")
        
    })
    
}

class blockedPass: Equatable {
    
    static func == (lhs: blockedPass, rhs: blockedPass) -> Bool {
        return lhs.location == rhs.location && lhs.passId == rhs.passId
    }
    
    
    let passId: Int
    let location: AreaAccess
    
    init(passId: Int, location: AreaAccess) {
        
        self.passId = passId
        self.location = location
        
    }
    
}
