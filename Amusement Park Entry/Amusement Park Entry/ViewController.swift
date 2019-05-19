//
//  ViewController.swift
//  Amusement Park Entry
//
//  Created by Tom Bastable on 25/04/2019.
//  Copyright © 2019 Tom Bastable. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
@IBOutlet weak var testLabel: UITextField!
    
// Test Passes - complete passes.
    
 //Setting the date of birth to today, so that it's easy to test the birthday scan acknowledgement
    
let completeChildFree = try! freeChildGuest(dateOfBirth: Date())
    
    
let completeClassicGuest = classicGuest()
let completeVipGuest = vipGuest()
let completeFoodService = try! foodServiceEmployee(firstName: "Tom", lastName: "Bastable", streetAddress: "123 Planet Hoth", city: "Cloud City", state: "Bespin", zipPostCode: "12Parsecs")
let completeRideService = try! rideServiceEmployee(firstName: "Tom", lastName: "Bastable", streetAddress: "123 Planet Hoth", city: "Cloud City", state: "Bespin", zipPostCode: "12Parsecs")
let completeMaintenance = try! maintenanceEmployee(firstName: "Tom", lastName: "Bastable", streetAddress: "123 Planet Hoth", city: "Cloud City", state: "Bespin", zipPostCode: "12Parsecs")
let completeManager = try! managerEmployee(firstName: "Tom", lastName: "Bastable", streetAddress: "123 Planet Hoth", city: "Cloud City", state: "Bespin", zipPostCode: "12Parsecs")
    
    

    // Test Passes - incomplete, error ridden passes that will throw upon creation.
    
    /*
     
let incompleteChildFree = try! freeChildGuest(dateOfBirth: Date())
let incompleteFoodService = try! foodServiceEmployee(firstName: "Tom", lastName: "Bastable", streetAddress: "123 Planet Hoth", city: "Cloud City", state: "Bespin", zipPostCode: "")
let incompleteRideService = try! rideServiceEmployee(firstName: "", lastName: "Bastable", streetAddress: "123 Planet Hoth", city: "Cloud City", state: "Bespin", zipPostCode: "12Parsecs")
let incompleteMaintenance = try! maintenanceEmployee(firstName: "Tom", lastName: "Bastable", streetAddress: "123 Planet Hoth", city: "Cloud City", state: "", zipPostCode: "12Parsecs")
let incompleteManager = try! managerEmployee(firstName: "Tom", lastName: "", streetAddress: "123 Planet Hoth Rd", city: "Cloud City", state: "Bespin", zipPostCode: "12Parsecs")
     
     */
    
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        /*
        // Swipes - each type of entrant. Full, acceptable passes.
        // passSwipe is polymorphic, so it can handle any type of entrant.
        
        passSwipe(swipeLocation: .amusementAreas, pass: completeVipGuest)
        passSwipe(swipeLocation: .foodDiscount, pass: completeVipGuest)
        passSwipe(swipeLocation: .shopDiscount, pass: completeVipGuest)
        
        passSwipe(swipeLocation: .amusementAreas, pass: completeClassicGuest)
        passSwipe(swipeLocation: .shopDiscount, pass: completeClassicGuest)
        passSwipe(swipeLocation: .foodDiscount, pass: completeClassicGuest)
        
        passSwipe(swipeLocation: .maintenanceAreas, pass: completeMaintenance)
        passSwipe(swipeLocation: .shopDiscount, pass: completeMaintenance)
        passSwipe(swipeLocation: .foodDiscount, pass: completeMaintenance)
        
        passSwipe(swipeLocation: .rideControlAreas, pass: completeRideService)
        passSwipe(swipeLocation: .shopDiscount, pass: completeRideService)
        passSwipe(swipeLocation: .foodDiscount, pass: completeRideService)
        
        passSwipe(swipeLocation: .amusementAreas, pass: completeFoodService)
        passSwipe(swipeLocation: .shopDiscount, pass: completeFoodService)
        passSwipe(swipeLocation: .foodDiscount, pass: completeFoodService)
        
        passSwipe(swipeLocation: .officeAreas, pass: completeManager)
        passSwipe(swipeLocation: .shopDiscount, pass: completeManager)
        passSwipe(swipeLocation: .foodDiscount, pass: completeManager)
        
        // Example of passSwipe acknowledging a birthday. completeChildFree is setup to have todays date as their birthday for easy testing.
        
        passSwipe(swipeLocation: .amusementAreas, pass: completeChildFree)
        passSwipe(swipeLocation: .shopDiscount, pass: completeChildFree)
        passSwipe(swipeLocation: .foodDiscount, pass: completeChildFree)
        
        // Swipes - access denied.
        
        passSwipe(swipeLocation: .officeAreas, pass: completeClassicGuest)
        
        // Swiping two passes within 5 seconds.
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0, execute: {
            
            passSwipe(swipeLocation: .amusementAreas, pass: self.completeChildFree)
            
        })
        
        // Swiping two passes, second after 5 seconds, to show that the pass re-swipes ok.
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0, execute: {
            
            passSwipe(swipeLocation: .amusementAreas, pass: self.completeChildFree)
            
        })
        */
    }
    

}

