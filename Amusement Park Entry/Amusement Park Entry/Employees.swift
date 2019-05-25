//
//  Employees.swift
//  Amusement Park Entry
//
//  Created by Tom Bastable on 25/04/2019.
//  Copyright © 2019 Tom Bastable. All rights reserved.
//

import Foundation

enum ContractProjects {
    
    case proj1001
    case proj1002
    case proj1003
    case proj2001
    case proj2002
    
}

enum VendorCompany {
    
    case acme
    case orkin
    case fedex
    case nwElectrical
    
}

// All below are laid out as per business matrix. Little explination required.

class foodServiceEmployee: Employee {
    
    let firstName: String
    let lastName: String
    let streetAddress: String?
    let city: String?
    let state: String?
    let zipPostCode: String?
    var dateOfBirth: Date? = nil
    
    let foodDiscount: Double = 15.0
    let merchDiscount: Double = 25.0
    
    let rideAccess: Bool = true
    let queueSkip: Bool = false
    
    var uniquePassID: Int
    
    let entrantType: EntrantType = .foodServices
    let areaAccess: [AreaAccess] = [.kitchenAreas, .amusementAreas, .rideEntry, .foodDiscount, .shopDiscount]
    
    var passTitle: String
    var passSubtitle: String = "Food Service Staff"
    
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
        self.passTitle = "\(firstName) \(lastName)"
        self.zipPostCode = zipPostCode
        self.uniquePassID = Int.random(in: 0...100000)
        
    }
    
    func swipe(atLocation location: AreaAccess) throws -> Bool{
        
        return try checkAccess(swipeLocation: location, pass: self)
        
    }
    
}

class rideServiceEmployee: Employee {
    
    let firstName: String
    let lastName: String
    let streetAddress: String?
    let city: String?
    let state: String?
    let zipPostCode: String?
    var dateOfBirth: Date? = nil
    
    let foodDiscount: Double = 15.0
    let merchDiscount: Double = 25.0
    
    let rideAccess: Bool = true
    let queueSkip: Bool = false
    
    var uniquePassID: Int
    
    let entrantType: EntrantType = .rideServices
    let areaAccess: [AreaAccess] = [.rideControlAreas, .amusementAreas, .rideEntry, .foodDiscount, .shopDiscount]
    
    var passTitle: String
    var passSubtitle: String = "Ride Service Staff"
    
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
        self.passTitle = "\(firstName) \(lastName)"
        self.zipPostCode = zipPostCode
        self.uniquePassID = Int.random(in: 0...100000)
        
    }
    
    func swipe(atLocation location: AreaAccess) throws -> Bool{
        
        return try checkAccess(swipeLocation: location, pass: self)
        
    }
    
}

class maintenanceEmployee: Employee {
    
    let firstName: String
    let lastName: String
    let streetAddress: String?
    let city: String?
    let state: String?
    let zipPostCode: String?
    var dateOfBirth: Date? = nil
    
    let foodDiscount: Double = 15.0
    let merchDiscount: Double = 25.0
    
    let rideAccess: Bool = true
    let queueSkip: Bool = false
    
    var uniquePassID: Int
    
    let entrantType: EntrantType = .maintenance
    let areaAccess: [AreaAccess] = [.rideControlAreas, .amusementAreas, .kitchenAreas, .maintenanceAreas, .rideEntry, .foodDiscount, .shopDiscount]
    
    var passTitle: String
    var passSubtitle: String = "Maintenance Staff"
    
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
        self.passTitle = "\(firstName) \(lastName)"
        self.zipPostCode = zipPostCode
        self.uniquePassID = Int.random(in: 0...100000)
        
    }
    
    func swipe(atLocation location: AreaAccess) throws -> Bool{
        
        return try checkAccess(swipeLocation: location, pass: self)
        
    }
    
}

class managerEmployee: Employee {
    
    let firstName: String
    let lastName: String
    let streetAddress: String?
    let city: String?
    let state: String?
    let zipPostCode: String?
    var dateOfBirth: Date? = nil
    
    let foodDiscount: Double = 25.0
    let merchDiscount: Double = 25.0
    
    let rideAccess: Bool = true
    let queueSkip: Bool = false
    
    var uniquePassID: Int
    
    let entrantType: EntrantType = .manager
    let areaAccess: [AreaAccess] = [.rideControlAreas, .amusementAreas, .kitchenAreas, .maintenanceAreas, .officeAreas, .rideEntry, .foodDiscount, .shopDiscount]
    
    var passTitle: String
    var passSubtitle: String = "Manager"
    
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
        self.passTitle = "\(firstName) \(lastName)"
        self.zipPostCode = zipPostCode
        self.uniquePassID = Int.random(in: 0...100000)
        
    }

    func swipe(atLocation location: AreaAccess) throws -> Bool{
        
        return try checkAccess(swipeLocation: location, pass: self)
        
    }
    
}

class contractEmployee: ContractEmployee {
    
    let firstName: String
    let lastName: String
    let streetAddress: String?
    let city: String?
    let state: String?
    let zipPostCode: String?
    var dateOfBirth: Date? = nil
    
    let foodDiscount: Double = 0.0
    let merchDiscount: Double = 0.0
    
    let rideAccess: Bool = false
    let queueSkip: Bool = false
    
    var uniquePassID: Int
    
    let entrantType: EntrantType = .contract
    let areaAccess: [AreaAccess]
    let projectId: ContractProjects
    
    var passTitle: String
    var passSubtitle: String
    
    init(firstName: String?, lastName: String?, streetAddress: String?, city: String?, state: String?, zipPostCode: String?, project: ContractProjects?) throws {
        
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
        
        guard let projectId = project else{
            print("project id is required")
            throw PassCreationError.projectIdRequired
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.zipPostCode = zipPostCode
        self.uniquePassID = Int.random(in: 0...100000)
        self.projectId = projectId
        self.passTitle = "\(firstName) \(lastName)"
        self.passSubtitle = "Contractor on \(projectString(projectId))"
        self.areaAccess = contractEmployeeAccess(forProject: projectId)
    }
    
    func swipe(atLocation location: AreaAccess) throws -> Bool{
        
        return try checkAccess(swipeLocation: location, pass: self)
        
    }
    
}

class vendor: Vendor {
    
    let firstName: String
    let lastName: String
    let streetAddress: String? = nil
    let city: String? = nil
    let state: String? = nil
    let zipPostCode: String? = nil
    var dateOfBirth: Date?
    var dateOfVisit: Date?
    var vendorCompany: VendorCompany
    
    let foodDiscount: Double = 0.0
    let merchDiscount: Double = 0.0
    
    let rideAccess: Bool = false
    let queueSkip: Bool = false
    
    var uniquePassID: Int
    
    let entrantType: EntrantType = .vendor
    let areaAccess: [AreaAccess]
    
    var passTitle: String
    var passSubtitle: String
    
    init(firstName: String?, lastName: String?, vendorCompany: VendorCompany?, dateOfBirth: Date?, dateOfVisit: Date?) throws {
        
        guard let firstName = firstName, !firstName.isEmpty else{
            print("First Name Required")
            throw PassCreationError.firstNameRequired
        }
        
        guard let lastName = lastName, !lastName.isEmpty else{
            print("Last Name Required")
            throw PassCreationError.lastNameRequired
        }
        
        guard let vendorCompany = vendorCompany else{
            print("Vendor Company Required")
            throw PassCreationError.vendorCompanyRequired
        }
        
        guard let dateOfBirth = dateOfBirth else{
            print("Date of Birth Required")
            throw PassCreationError.dateOfBirthRequired
        }
        
        guard let dateOfVisit = dateOfVisit else{
            print("Date of Birth Required")
            throw PassCreationError.dateofVisitRequired
        }
        
        self.firstName = firstName
        self.lastName = lastName
        self.dateOfBirth = dateOfBirth
        self.dateOfVisit = dateOfVisit
        self.uniquePassID = Int.random(in: 0...100000)
        self.areaAccess = vendorAccess(forCompany: vendorCompany)
        self.vendorCompany = vendorCompany
        self.passTitle = "\(firstName) \(lastName)"
        self.passSubtitle = "Vendor from \(vendorString(vendorCompany))"
    }
    
    func swipe(atLocation location: AreaAccess) throws -> Bool{
        
        return try checkAccess(swipeLocation: location, pass: self)
        
    }
    
}

func contractEmployeeAccess(forProject project: ContractProjects) -> [AreaAccess]{
    
    switch project {
        
    case .proj1001:
        let project1001: [AreaAccess] = [.amusementAreas, .rideControlAreas]
        return project1001
    case .proj1002:
        let project1002: [AreaAccess] = [.amusementAreas, .rideControlAreas, .maintenanceAreas]
        return project1002
    case .proj1003:
        let project1003: [AreaAccess] = [.amusementAreas, .rideControlAreas, .kitchenAreas, .maintenanceAreas, .officeAreas]
        return project1003
    case .proj2001:
        let project2001: [AreaAccess] = [.officeAreas]
        return project2001
    case .proj2002:
        let project2002: [AreaAccess] = [.kitchenAreas, .maintenanceAreas, .officeAreas]
        return project2002
    }
    
}

func vendorAccess(forCompany company: VendorCompany) -> [AreaAccess]{
    
    switch company{
    case .acme:
        let acmeAccess: [AreaAccess] = [.kitchenAreas]
        return acmeAccess
    case .orkin:
        let orkinAccess: [AreaAccess] = [.amusementAreas, .rideControlAreas, .kitchenAreas]
        return orkinAccess
    case .fedex:
        let fedexAccess: [AreaAccess] = [.maintenanceAreas, .officeAreas]
        return fedexAccess
    case .nwElectrical:
        let nwElectricalAccess: [AreaAccess] = [.amusementAreas, .rideControlAreas, .kitchenAreas, .maintenanceAreas, .officeAreas]
        return nwElectricalAccess
    }

}

func vendorString(_ vendor: VendorCompany) -> String{
    
    switch vendor{
    case .acme:
        let acmeAccess: String = "Acme"
        return acmeAccess
    case .orkin:
        let orkinAccess: String = "Orkin"
        return orkinAccess
    case .fedex:
        let fedexAccess: String = "Fedex"
        return fedexAccess
    case .nwElectrical:
        let nwElectricalAccess: String = "NW Electrical"
        return nwElectricalAccess
    }
    
}

func projectString(_ project: ContractProjects) -> String{
    
    switch project {
        
    case .proj1001:
        let project1001: String = "Project 1001"
        return project1001
    case .proj1002:
        let project1002: String = "Project 1002"
        return project1002
    case .proj1003:
        let project1003: String = "Project 1003"
        return project1003
    case .proj2001:
        let project2001: String = "Project 2001"
        return project2001
    case .proj2002:
        let project2002: String = "Project 2002"
        return project2002
    }
    
}
