//
//  Guests.swift
//  Amusement Park Entry
//
//  Created by Tom Bastable on 25/04/2019.
//  Copyright © 2019 Tom Bastable. All rights reserved.
//

import Foundation

enum EntrantType {
    
    case classic
    case vip
    case freeChild
    case seasonPass
    case senior
    //Employees
    case foodServices
    case rideServices
    case maintenance
    case manager
    case contract
    case vendor
    
}

// All below are laid out as per business matrix. Little explination required.

class classicGuest: Guests {
    
    var areaAccess: [AreaAccess]
    var rideAccess: Bool
    var entrantType: EntrantType
    var foodDiscount: Double
    var merchDiscount: Double
    var uniquePassID: Int
    var dateOfBirth: Date? = nil
    var queueSkip: Bool = false
    var passTitle: String = "Anonymous Guest"
    var passSubtitle: String = "Classic Guest Pass"
    
    init() {
       
        self.areaAccess = [.amusementAreas, .rideEntry]
        self.rideAccess = true
        self.entrantType = .classic
        self.foodDiscount = 0.0
        self.merchDiscount = 0.0
        self.uniquePassID = Int.random(in: 0...100000)
        
    }
    
    func swipe(atLocation location: AreaAccess) throws -> Bool{
        
        return try checkAccess(swipeLocation: location, pass: self)
        
    }
    
}


class vipGuest: VIP {
    
    var queueSkip: Bool
    var foodDiscount: Double
    var merchDiscount: Double
    var areaAccess: [AreaAccess]
    var rideAccess: Bool
    var entrantType: EntrantType
    var uniquePassID: Int
    var dateOfBirth: Date? = nil
    var passTitle: String = "Anonymous Guest"
    var passSubtitle: String = "VIP Guest Pass"
    
    init() {
        
        self.areaAccess = [.amusementAreas, .rideEntry, .foodDiscount, .shopDiscount]
        self.rideAccess = true
        self.queueSkip = true
        self.foodDiscount = 10.0
        self.merchDiscount = 20.0
        self.entrantType = .vip
        self.uniquePassID = Int.random(in: 0...100000)
        
    }
    
    func swipe(atLocation location: AreaAccess) throws -> Bool{
        
        return try checkAccess(swipeLocation: location, pass: self)
        
    }
    
}


class freeChildGuest: FreeChild {
    
    var areaAccess: [AreaAccess]
    var rideAccess: Bool
    var dateOfBirth: Date?
    var entrantType: EntrantType
    var foodDiscount: Double
    var merchDiscount: Double
    var uniquePassID: Int
    var queueSkip: Bool = false
    var passTitle: String = "Anonymous Guest"
    var passSubtitle: String = "Free Child Guest Pass"
    
    init(dateOfBirth: Date?) throws {
        
        guard let dateOfBirth = dateOfBirth else{
            print("Date of Birth Required")
            throw PassCreationError.dateOfBirthRequired
        }
        
        self.areaAccess = [.amusementAreas, .rideEntry]
        self.rideAccess = true
        self.dateOfBirth = dateOfBirth
        self.entrantType = .freeChild
        self.foodDiscount = 0.0
        self.merchDiscount = 0.0
        self.uniquePassID = Int.random(in: 0...100000)
        
    }
    
    func swipe(atLocation location: AreaAccess) throws -> Bool{
        
        return try checkAccess(swipeLocation: location, pass: self)
        
    }

}


class seniorGuest: SeniorGuest {
    
    let firstName: String
    let lastName: String
    var dateOfBirth: Date?
    
    let foodDiscount: Double = 10.0
    let merchDiscount: Double = 10.0
    
    let rideAccess: Bool = true
    let queueSkip: Bool = true
    
    var uniquePassID: Int
    
    var entrantType: EntrantType
    let areaAccess: [AreaAccess] = [.amusementAreas, .rideEntry, .foodDiscount, .shopDiscount]
    
    var passTitle: String
    var passSubtitle: String = "Senior Guest Pass"
    
    init(firstName: String?, lastName: String?, dateOfBirth: Date?) throws {
        
        guard let firstName = firstName, !firstName.isEmpty else{
            print("First Name Required")
            throw PassCreationError.firstNameRequired
        }
        
        guard let lastName = lastName, !lastName.isEmpty else{
            print("Last Name Required")
            throw PassCreationError.lastNameRequired
        }
        
        if let dateOfBirth = dateOfBirth{
            self.dateOfBirth = dateOfBirth
        }
        else{
            print("Date of Birth Required")
            throw PassCreationError.dateOfBirthRequired
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.passTitle = "\(firstName) \(lastName)"
        self.entrantType = .senior
        self.uniquePassID = Int.random(in: 0...100000)
        
    }
    
    func swipe(atLocation location: AreaAccess) throws -> Bool{
        
        return try checkAccess(swipeLocation: location, pass: self)
        
    }
    
}


class seasonPassGuest: SeasonPassHolder {
    
    let firstName: String
    let lastName: String
    let streetAddress: String?
    let city: String?
    let state: String?
    let zipPostCode: String?
    var dateOfBirth: Date? = nil
    
    let foodDiscount: Double = 10.0
    let merchDiscount: Double = 20.0
    
    let rideAccess: Bool = true
    let queueSkip: Bool = true
    
    var uniquePassID: Int
    
    var entrantType: EntrantType
    let areaAccess: [AreaAccess] = [.amusementAreas, .rideEntry, .foodDiscount, .shopDiscount]
    
    var passTitle: String
    var passSubtitle: String = "Season Pass Holder"
    
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipPostCode: String?) throws {
        
        guard let firstName = firstName, !firstName.isEmpty else{
            print("First Name Required")
            throw PassCreationError.firstNameRequired
        }
        
        guard let lastName = lastName, !lastName.isEmpty else{
            print("Last Name Required")
            throw PassCreationError.lastNameRequired
        }
        
        guard let streetAddress = streetAddress, !streetAddress.isEmpty else{
            print("Street Address Required")
            throw PassCreationError.streetAddressRequired
        }
        
        guard let city = city, !city.isEmpty else{
            print("City is Required")
            throw PassCreationError.cityRequired
        }
        
        guard let state = state, !state.isEmpty else{
            print("State is Required")
            throw PassCreationError.stateRequired
        }
        
        guard let zipPostCode = zipPostCode, !zipPostCode.isEmpty else{
            print("Zip / Postcode Required")
            throw PassCreationError.zipRequired
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipPostCode = zipPostCode
        self.entrantType = .seasonPass
        self.passTitle = "\(firstName) \(lastName)"
        self.uniquePassID = Int.random(in: 0...100000)
        
    }
    
    func swipe(atLocation location: AreaAccess) throws -> Bool{
        
        return try checkAccess(swipeLocation: location, pass: self)
        
    }
    
}
