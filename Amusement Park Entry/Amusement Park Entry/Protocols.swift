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
    var rideAccess: Bool {get}
    var uniquePassID: Int {get}
    var dateOfBirth: Date? {get}
    var queueSkip: Bool {get}
    func swipe(atLocation location: AreaAccess) throws -> Bool
    var entrantType: EntrantType {get}
    var foodDiscount: Double {get}
    var merchDiscount: Double {get}
    var passTitle: String {get}
    var passSubtitle: String {get}
    
}

protocol Guests: Entrant {
    
}

protocol VIP: Guests {

}

protocol FreeChild: Guests {
    
}

protocol SeniorGuest: Guests {
    
    var firstName: String {get}
    var lastName: String {get}

}

protocol SeasonPassHolder: Guests {
    
    var firstName: String {get}
    var lastName: String {get}
    var streetAddress: String? {get}
    var city: String? {get}
    var state: String? {get}
    var zipPostCode: String? {get}
    
}


protocol Employee: Entrant {
    
    var firstName: String {get}
    var lastName: String {get}
    var streetAddress: String? {get}
    var city: String? {get}
    var state: String? {get}
    var zipPostCode: String? {get}
    
}

protocol ContractEmployee: Employee {
    
}

protocol Vendor: Employee {
    
    var dateOfVisit: Date? {get}
    var vendorCompany: VendorCompany {get}
    
}
