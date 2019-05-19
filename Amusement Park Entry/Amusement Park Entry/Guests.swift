//
//  Guests.swift
//  Amusement Park Entry
//
//  Created by Tom Bastable on 25/04/2019.
//  Copyright © 2019 Tom Bastable. All rights reserved.
//

import Foundation

enum GuestTypes {
    
    case classic
    case vip
    case freeChild
    
    /* written in prep for proj5
    case seasonPass
    case senior
    */
    
}

// All below are laid out as per business matrix. Little explination required.

class classicGuest: Guests {
    
    var areaAccess: [AreaAccess]
    var rideAccess: Bool
    var guestType: GuestTypes
    var foodDiscount: Double
    var merchDiscount: Double
    var uniquePassID: Int
    
    init() {
       
        self.areaAccess = [.amusementAreas]
        self.rideAccess = true
        self.guestType = .classic
        self.foodDiscount = 0.0
        self.merchDiscount = 0.0
        self.uniquePassID = Int.random(in: 0...100000)
    }
}


class vipGuest: VIP {
    
    var queueSkip: Bool
    var foodDiscount: Double
    var merchDiscount: Double
    var areaAccess: [AreaAccess]
    var rideAccess: Bool
    var guestType: GuestTypes
    var uniquePassID: Int
    
    init() {
        
        self.areaAccess = [.amusementAreas]
        self.rideAccess = true
        self.queueSkip = true
        self.foodDiscount = 10.0
        self.merchDiscount = 20.0
        self.guestType = .vip
        self.uniquePassID = Int.random(in: 0...100000)
        
    }
}


class freeChildGuest: FreeChild {
    
    var areaAccess: [AreaAccess]
    var rideAccess: Bool
    var dateOfBirth: Date?
    var guestType: GuestTypes
    var foodDiscount: Double
    var merchDiscount: Double
    var uniquePassID: Int
    
    init(dateOfBirth: Date?) throws {
        
        guard let dateOfBirth = dateOfBirth else{
            print("Date of Birth Required")
            throw PassCreationError.dateOfBirthRequired
        }
        
        self.areaAccess = [.amusementAreas]
        self.rideAccess = true
        self.dateOfBirth = dateOfBirth
        self.guestType = .freeChild
        self.foodDiscount = 0.0
        self.merchDiscount = 0.0
        self.uniquePassID = Int.random(in: 0...100000)
        
    }

}


