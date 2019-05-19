//
//  Protocols.swift
//  Amusement Park Entry
//
//  Created by Tom Bastable on 25/04/2019.
//  Copyright © 2019 Tom Bastable. All rights reserved.
//

import Foundation

protocol Entrant {
    
    var areaAccess: [AreaAccess] {get}
    var uniquePassID: Int {get}
    
}

protocol Guests: Entrant {
    
    
    var rideAccess: Bool {get}
    var guestType: GuestTypes {get}
    var foodDiscount: Double {get}
    var merchDiscount: Double {get}
    
}

protocol VIP: Guests {
    
    var queueSkip: Bool {get}

}

protocol FreeChild: Guests {
    var dateOfBirth: Date? {get}
}


protocol Employee: Entrant {
    
    var firstName: String? {get}
    var lastName: String? {get}
    var streetAddress: String? {get}
    var city: String? {get}
    var state: String? {get}
    var zipPostCode: String? {get}
    var rideAccess: Bool {get}
    var queueSkip: Bool {get}
    var foodDiscount: Double {get}
    var merchDiscount: Double {get}
    var employeeRole: EmployeeRole {get}
    
}
