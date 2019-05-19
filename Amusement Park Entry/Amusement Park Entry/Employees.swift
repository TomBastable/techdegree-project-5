//
//  Employees.swift
//  Amusement Park Entry
//
//  Created by Tom Bastable on 25/04/2019.
//  Copyright © 2019 Tom Bastable. All rights reserved.
//

import Foundation

enum EmployeeRole {
    
    case foodServices
    case rideServices
    case maintenance
    case manager
    
    /* Written in prep for proj5
    case contract
    */
    
}

// All below are laid out as per business matrix. Little explination required.

class foodServiceEmployee: Employee {
    
    let firstName: String?
    let lastName: String?
    let streetAddress: String?
    let city: String?
    let state: String?
    let zipPostCode: String?
    
    let foodDiscount: Double = 15.0
    let merchDiscount: Double = 25.0
    
    let rideAccess: Bool = true
    let queueSkip: Bool = false
    
    var uniquePassID: Int
    
    let employeeRole: EmployeeRole = .foodServices
    let areaAccess: [AreaAccess] = [.kitchenAreas, .amusementAreas]
    
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
        self.uniquePassID = Int.random(in: 0...100000)
        
    }
    

    
}

class rideServiceEmployee: Employee {
    
    let firstName: String?
    let lastName: String?
    let streetAddress: String?
    let city: String?
    let state: String?
    let zipPostCode: String?
    
    let foodDiscount: Double = 15.0
    let merchDiscount: Double = 25.0
    
    let rideAccess: Bool = true
    let queueSkip: Bool = false
    
    var uniquePassID: Int
    
    let employeeRole: EmployeeRole = .rideServices
    let areaAccess: [AreaAccess] = [.rideControlAreas, .amusementAreas]
    
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
        self.uniquePassID = Int.random(in: 0...100000)
        
    }
    

    
}

class maintenanceEmployee: Employee {
    
    let firstName: String?
    let lastName: String?
    let streetAddress: String?
    let city: String?
    let state: String?
    let zipPostCode: String?
    
    let foodDiscount: Double = 15.0
    let merchDiscount: Double = 25.0
    
    let rideAccess: Bool = true
    let queueSkip: Bool = false
    
    var uniquePassID: Int
    
    let employeeRole: EmployeeRole = .maintenance
    let areaAccess: [AreaAccess] = [.rideControlAreas, .amusementAreas, .kitchenAreas, .maintenanceAreas]
    
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
        self.uniquePassID = Int.random(in: 0...100000)
        
    }
    

    
}

class managerEmployee: Employee {
    
    let firstName: String?
    let lastName: String?
    let streetAddress: String?
    let city: String?
    let state: String?
    let zipPostCode: String?
    
    let foodDiscount: Double = 25.0
    let merchDiscount: Double = 25.0
    
    let rideAccess: Bool = true
    let queueSkip: Bool = false
    
    var uniquePassID: Int
    
    let employeeRole: EmployeeRole = .manager
    let areaAccess: [AreaAccess] = [.rideControlAreas, .amusementAreas, .kitchenAreas, .maintenanceAreas, .officeAreas]
    
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
        self.uniquePassID = Int.random(in: 0...100000)
        
    }

    
}

