//
//  Errors.swift
//  Amusement Park Entry
//
//  Created by Tom Bastable on 25/04/2019.
//  Copyright © 2019 Tom Bastable. All rights reserved.
//

import Foundation

enum PassCreationError: Error {
    
    //List of possible errors encountered during pass creation going by the project mockups.
    case dateOfBirthRequired
    case firstNameRequired
    case lastNameRequired
    case companyNameRequired
    case streetAddressRequired
    case cityRequired
    case stateRequired
    case zipRequired
    
}
