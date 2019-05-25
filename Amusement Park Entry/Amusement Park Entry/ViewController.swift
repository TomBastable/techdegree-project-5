//
//  ViewController.swift
//  Amusement Park Entry
//
//  Created by Tom Bastable on 25/04/2019.
//  Copyright © 2019 Tom Bastable. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //UI Properties
    
    // passView Properties
    @IBOutlet weak var passView: UIView!
    @IBOutlet weak var passName: UILabel!
    @IBOutlet weak var typeOfPass: UILabel!
    @IBOutlet weak var rideStatus: UILabel!
    @IBOutlet weak var foodDiscountLabel: UILabel!
    @IBOutlet weak var merchDiscountLabel: UILabel!
    @IBOutlet weak var resultsField: UITextField!
    @IBOutlet weak var rideEntryButton: UIButton!
    @IBOutlet weak var amusementAreaButton: UIButton!
    @IBOutlet weak var kitchenAreaButton: UIButton!
    @IBOutlet weak var rideControlButton: UIButton!
    @IBOutlet weak var maintenanceAreaButton: UIButton!
    @IBOutlet weak var officeAreaButton: UIButton!
    @IBOutlet weak var merchDiscount: UIButton!
    @IBOutlet weak var foodDiscountButton: UIButton!
    @IBOutlet weak var createNewPass: UIButton!
    
    
    //Text Fields with Date pickers and pickerviews
    @IBOutlet weak var dateOfBirth: UITextField!
    @IBOutlet weak var dateOfVisit: UITextField!
    @IBOutlet weak var vendorCompany: UITextField!
    @IBOutlet weak var projectSelection: UITextField!
    
    // Remaining Fields
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var streetAddressTextField: UITextField!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    
    //Labels
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var dovLabel: UILabel!
    @IBOutlet weak var vendorLabel: UILabel!
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var projectLabel: UILabel!
    @IBOutlet weak var streetAddress: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var zipLabel: UILabel!
    
    
    // Generate and Populate buttons
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var populateButton: UIButton!
    
    
    //Primary Menu Buttons
    @IBOutlet weak var guestMenuButton: UIButton!
    @IBOutlet weak var employeeMenuButton: UIButton!
    @IBOutlet weak var vendorMenuButton: UIButton!
    
    
    // Guest Sub Menu buttons
    @IBOutlet weak var childSelectionButton: UIButton!
    @IBOutlet weak var adultSelectionButton: UIButton!
    @IBOutlet weak var seniorSelectionButton: UIButton!
    @IBOutlet weak var vipSelectionButton: UIButton!
    @IBOutlet weak var seasonPassSelectionButton: UIButton!
    
    // Employee Sub Menu Buttons
    @IBOutlet weak var foodServicesSelectionButton: UIButton!
    @IBOutlet weak var rideServicesSelectionButton: UIButton!
    @IBOutlet weak var maintenanceSelectionButton: UIButton!
    @IBOutlet weak var managerSelectionButton: UIButton!
    @IBOutlet weak var contractSelectionButton: UIButton!
    
    
    // Picker / data properties
    let datePickerView:UIDatePicker = UIDatePicker()
    let vendorArray: [String] = ["Acme", "Orkin", "Fedex", "NW Electrical"]
    let projectList: [String] = ["1001", "1002", "1003", "2001", "2002"]
    let pickerViewVendors = UIPickerView()
    let pickerViewProjects = UIPickerView()
    var currentPass: Entrant? = nil
    
    //Sounds
    var accessGrantedSound: SystemSoundID = 0
    var AccessDeniedSound: SystemSoundID = 0
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        topMenuPressed(guestMenuButton)
        loadGameStartSound()
        
        self.passView.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(sender:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(sender:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.birthdayAlert), name: Notification.Name("BirthdayAlert"), object: nil)

        
        dateOfBirth.inputView = datePickerView
        dateOfVisit.inputView = datePickerView
        
        //Picker view init
        datePickerView.datePickerMode = UIDatePicker.Mode.date
        datePickerView.maximumDate = Date()
        datePickerView.addTarget(self, action: #selector(ViewController.datePickerValueChanged), for: UIControl.Event.valueChanged)
        pickerViewVendors.delegate = self
        pickerViewVendors.dataSource = self
        pickerViewProjects.dataSource = self
        pickerViewProjects.delegate = self
        vendorCompany.inputView = pickerViewVendors
        projectSelection.inputView = pickerViewProjects

        
        // datepicker toolbar setup
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        let space = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(ViewController.doneDatePickerPressed))
        
        // if you remove the space element, the "done" button will be left aligned
        // you can add more items if you want
        toolBar.setItems([space, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        
        dateOfBirth.inputAccessoryView = toolBar
        dateOfVisit.inputAccessoryView = toolBar
        vendorCompany.inputAccessoryView = toolBar
        projectSelection.inputAccessoryView = toolBar
        
    }
    
    //Picker functions
    
    @objc func doneDatePickerPressed(){
        
        self.view.endEditing(true)
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        if dateOfVisit.isFirstResponder {
            dateOfVisit.text = dateFormatter.string(from: sender.date)
        }
        else if dateOfBirth.isFirstResponder {
            dateOfBirth.text = dateFormatter.string(from: sender.date)
        }
        
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView == pickerViewVendors {
        return vendorArray.count
        } else if pickerView == pickerViewProjects {
            return projectList.count
        }
        else{
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerViewVendors {
            
        return vendorArray[row]
        } else if pickerView == pickerViewProjects {
            
            return projectList[row]
        }else{
            return ""
        }
    }
    
    func pickerView( _ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickerViewVendors {
            
            vendorCompany.text = vendorArray[row]
            
        }else if pickerView == pickerViewProjects {
            projectSelection.text = projectList[row]
        }
        
    }
    
    //Observers for the keyboard - to move the screen so editing is visible
    
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
    }
    
    @IBAction func topMenuPressed(_ sender: UIButton) {
        
        //setup UI depending on the selected pass
        
        dateOfVisit.text = ""
        dateOfBirth.text = ""
        vendorCompany.text = ""
        projectSelection.text = ""
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        streetAddressTextField.text = ""
        cityTextField.text = ""
        stateTextField.text = ""
        zipTextField.text = ""
        
        if sender == vendorMenuButton {
            
            // setup sub menu
            childSelectionButton.isHidden = true
            adultSelectionButton.isHidden = true
            seniorSelectionButton.isHidden = true
            vipSelectionButton.isHidden = true
            seasonPassSelectionButton.isHidden = true
            foodServicesSelectionButton.isHidden = true
            rideServicesSelectionButton.isHidden = true
            maintenanceSelectionButton.isHidden = true
            managerSelectionButton.isHidden = true
            contractSelectionButton.isHidden = true
            
            // dim other top level buttons to display selection
            vendorMenuButton.alpha = 1.0
            employeeMenuButton.alpha = 0.5
            guestMenuButton.alpha = 0.5
            
            // Vendor has no sub menu, so deal with field relevancy here
            disableAllFields()
            dateOfBirth.isEnabled = true
            dateOfBirth.alpha = 1.0
            dobLabel.alpha = 1.0
            dateOfBirth.text = "Apr 21, 2019"
            firstNameTextField.isEnabled = true
            firstNameTextField.alpha = 1.0
            firstnameLabel.alpha = 1.0
            lastNameTextField.isEnabled = true
            lastNameTextField.alpha = 1.0
            lastNameLabel.alpha = 1.0
            dateOfVisit.isEnabled = true
            dateOfVisit.alpha = 1.0
            dovLabel.alpha = 1.0
            dateOfVisit.text = "Apr 21, 2019"
            vendorCompany.isEnabled = true
            vendorCompany.text = "Acme"
            vendorCompany.alpha = 1.0
            vendorLabel.alpha = 1.0
            
            
        } else if sender == employeeMenuButton{
            // setup sub menu
            childSelectionButton.isHidden = true
            adultSelectionButton.isHidden = true
            seniorSelectionButton.isHidden = true
            vipSelectionButton.isHidden = true
            seasonPassSelectionButton.isHidden = true
            foodServicesSelectionButton.isHidden = false
            rideServicesSelectionButton.isHidden = false
            maintenanceSelectionButton.isHidden = false
            managerSelectionButton.isHidden = false
            contractSelectionButton.isHidden = false
            
            // dim other top level buttons to display selection
            vendorMenuButton.alpha = 0.5
            employeeMenuButton.alpha = 1.0
            guestMenuButton.alpha = 0.5
            
            subMenuPressed(foodServicesSelectionButton)
            
        } else if sender == guestMenuButton {
            // setup sub menu
            childSelectionButton.isHidden = false
            adultSelectionButton.isHidden = false
            seniorSelectionButton.isHidden = false
            vipSelectionButton.isHidden = false
            seasonPassSelectionButton.isHidden = false
            foodServicesSelectionButton.isHidden = true
            rideServicesSelectionButton.isHidden = true
            maintenanceSelectionButton.isHidden = true
            managerSelectionButton.isHidden = true
            contractSelectionButton.isHidden = true
            
            // dim other top level buttons to display selection
            vendorMenuButton.alpha = 0.5
            employeeMenuButton.alpha = 0.5
            guestMenuButton.alpha = 1.0
            
            // As Default Select first sub menu selection
            subMenuPressed(childSelectionButton)
            
        }
        
    }
    
    @IBAction func subMenuPressed(_ sender: UIButton) {
        
        dateOfVisit.text = ""
        dateOfBirth.text = ""
        vendorCompany.text = ""
        projectSelection.text = ""
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        streetAddressTextField.text = ""
        cityTextField.text = ""
        stateTextField.text = ""
        zipTextField.text = ""
        
        if sender == childSelectionButton {
            
            // dim other sub menu buttons
            childSelectionButton.alpha = 1.0
            adultSelectionButton.alpha = 0.5
            seniorSelectionButton.alpha = 0.5
            vipSelectionButton.alpha = 0.5
            seasonPassSelectionButton.alpha = 0.5
            
            //enable relevant fields and disable irrelevant fields
            disableAllFields()
            dateOfBirth.isEnabled = true
            dateOfBirth.alpha = 1.0
            dobLabel.alpha = 1.0
            dateOfBirth.text = "Apr 21, 2019"
            
            
        }else if sender == adultSelectionButton {
            
            childSelectionButton.alpha = 0.5
            adultSelectionButton.alpha = 1.0
            seniorSelectionButton.alpha = 0.5
            vipSelectionButton.alpha = 0.5
            seasonPassSelectionButton.alpha = 0.5
            
            //enable relevant fields and disable irrelevant fields
            disableAllFields()
            
        }else if sender == seniorSelectionButton {
            
            childSelectionButton.alpha = 0.5
            adultSelectionButton.alpha = 0.5
            seniorSelectionButton.alpha = 1.0
            vipSelectionButton.alpha = 0.5
            seasonPassSelectionButton.alpha = 0.5
            
            //enable relevant fields and disable irrelevant fields
            disableAllFields()
            dateOfBirth.isEnabled = true
            dateOfBirth.alpha = 1.0
            dobLabel.alpha = 1.0
            dateOfBirth.text = "Apr 21, 2019"
            firstNameTextField.isEnabled = true
            firstNameTextField.alpha = 1.0
            firstnameLabel.alpha = 1.0
            lastNameTextField.isEnabled = true
            lastNameTextField.alpha = 1.0
            lastNameLabel.alpha = 1.0
            
        }else if sender == vipSelectionButton {
            
            childSelectionButton.alpha = 0.5
            adultSelectionButton.alpha = 0.5
            seniorSelectionButton.alpha = 0.5
            vipSelectionButton.alpha = 1.0
            seasonPassSelectionButton.alpha = 0.5
            
            //enable relevant fields and disable irrelevant fields
            disableAllFields()
            
        }else if sender == seasonPassSelectionButton {
            
            childSelectionButton.alpha = 0.5
            adultSelectionButton.alpha = 0.5
            seniorSelectionButton.alpha = 0.5
            vipSelectionButton.alpha = 0.5
            seasonPassSelectionButton.alpha = 1.0
            
            //enable relevant fields and disable irrelevant fields
            disableAllFields()
            firstNameTextField.isEnabled = true
            firstNameTextField.alpha = 1.0
            firstnameLabel.alpha = 1.0
            lastNameTextField.isEnabled = true
            lastNameTextField.alpha = 1.0
            lastNameLabel.alpha = 1.0
            
            streetAddressTextField.isEnabled = true
            streetAddressTextField.alpha = 1.0
            streetAddress.alpha = 1.0
            cityTextField.isEnabled = true
            cityTextField.alpha = 1.0
            cityLabel.alpha = 1.0
            stateTextField.isEnabled = true
            stateTextField.alpha = 1.0
            stateLabel.alpha = 1.0
            zipTextField.isEnabled = true
            zipTextField.alpha = 1.0
            zipLabel.alpha = 1.0
            
        }else if sender == foodServicesSelectionButton || sender == rideServicesSelectionButton || sender == maintenanceSelectionButton || sender == managerSelectionButton || sender == contractSelectionButton {
            
            foodServicesSelectionButton.alpha = 0.5
            rideServicesSelectionButton.alpha = 0.5
            maintenanceSelectionButton.alpha = 0.5
            managerSelectionButton.alpha = 0.5
            contractSelectionButton.alpha = 0.5
            
            if sender == foodServicesSelectionButton {
                foodServicesSelectionButton.alpha = 1.0
            }else if sender == rideServicesSelectionButton{
                rideServicesSelectionButton.alpha = 1.0
            }else if sender == maintenanceSelectionButton{
                maintenanceSelectionButton.alpha = 1.0
            }else if sender == managerSelectionButton{
                managerSelectionButton.alpha = 1.0
            }else if sender == contractSelectionButton{
                contractSelectionButton.alpha = 1.0
            }
            
            disableAllFields()
            firstNameTextField.isEnabled = true
            firstNameTextField.alpha = 1.0
            firstnameLabel.alpha = 1.0
            lastNameTextField.isEnabled = true
            lastNameTextField.alpha = 1.0
            lastNameLabel.alpha = 1.0
            
            streetAddressTextField.isEnabled = true
            streetAddressTextField.alpha = 1.0
            streetAddress.alpha = 1.0
            cityTextField.isEnabled = true
            cityTextField.alpha = 1.0
            cityLabel.alpha = 1.0
            stateTextField.isEnabled = true
            stateTextField.alpha = 1.0
            stateLabel.alpha = 1.0
            zipTextField.isEnabled = true
            zipTextField.alpha = 1.0
            zipLabel.alpha = 1.0
            
            if sender == contractSelectionButton{
                
                projectLabel.alpha = 1.0
                projectSelection.alpha = 1.0
                projectSelection.isEnabled = true
                projectSelection.text = "1001"
                
            }
            
        }
        
    }
    
    @IBAction func populateFields(_ sender: Any) {
        //populate fields, depending on if they're enabled
        if dateOfBirth.isEnabled { dateOfBirth.text = "Apr 21, 2019"}
        if dateOfVisit.isEnabled { dateOfVisit.text = "Apr 21, 2019"}
        if vendorCompany.isEnabled { vendorCompany.text = "Acme"}
        if firstNameTextField.isEnabled { firstNameTextField.text = "Han" }
        if lastNameTextField.isEnabled { lastNameTextField.text = "Solo" }
        if projectSelection.isEnabled {projectSelection.text = "1001"}
        if streetAddressTextField.isEnabled { streetAddressTextField.text = "221b Baker Street"}
        if cityTextField.isEnabled { cityTextField.text = "London"}
        if stateTextField.isEnabled { stateTextField.text = "Bespin"}
        if zipTextField.isEnabled { zipTextField.text = "90120"}
        
    }
    
    
    func disableAllFields(){
        //disable all fields, so that each case just enables the relevant fields - reducing code slightly
        dateOfBirth.isEnabled = false
        dateOfBirth.alpha = 0.5
        dobLabel.alpha = 0.5
        dateOfVisit.isEnabled = false
        dateOfVisit.alpha = 0.5
        dovLabel.alpha = 0.5
        vendorCompany.isEnabled = false
        vendorCompany.text = ""
        vendorCompany.alpha = 0.5
        vendorLabel.alpha = 0.5
        firstNameTextField.isEnabled = false
        firstNameTextField.alpha = 0.5
        firstnameLabel.alpha = 0.5
        lastNameTextField.isEnabled = false
        lastNameTextField.alpha = 0.5
        lastNameLabel.alpha = 0.5
        projectSelection.isEnabled = false
        projectSelection.text = ""
        projectSelection.alpha = 0.5
        projectLabel.alpha = 0.5
        streetAddressTextField.isEnabled = false
        streetAddressTextField.alpha = 0.5
        streetAddress.alpha = 0.5
        cityTextField.isEnabled = false
        cityTextField.alpha = 0.5
        cityLabel.alpha = 0.5
        stateTextField.isEnabled = false
        stateTextField.alpha = 0.5
        stateLabel.alpha = 0.5
        zipTextField.isEnabled = false
        zipTextField.alpha = 0.5
        zipLabel.alpha = 0.5
        
    }
    
    @IBAction func generatePass(_ sender: Any)  {
        
        // determine which pass needs creating
        
        if guestMenuButton.alpha == 1.0{
            
            
            if childSelectionButton.alpha == 1.0{
                
                do{
                    if let dateString = dateOfBirth.text, dateOfBirth.text != "" {
                        
                        guard let date = try dateFromString(dateString) else{
                            throw PassCreationError.stringToDateConversionError
                        }
                        
                        let pass = try freeChildGuest(dateOfBirth: date)
                        
                        print(pass, "pass")
                        currentPass = pass
                        presentPassView()
                        
                    } else {displayAlertWith(error: PassCreationError.stringToDateConversionError)}
                    
                } catch {
                    displayAlertWith(error: error)
                }
            
            }else if adultSelectionButton.alpha == 1.0{
                
                // no data required, create pass
                let pass = classicGuest()
                currentPass = pass
                presentPassView()
                print(pass)
                
            }else if seniorSelectionButton.alpha == 1.0{
                
                do{
                    if let dateString = dateOfBirth.text, dateOfBirth.text != "" {
                        
                        guard let date = try dateFromString(dateString) else{
                            throw PassCreationError.stringToDateConversionError
                        }
                        
                        guard let firstName: String = firstNameTextField.text, firstNameTextField.text != "" else{
                            throw PassCreationError.firstNameRequired
                        }
                        
                        guard let lastName: String = lastNameTextField.text, lastNameTextField.text != "" else{
                            throw PassCreationError.lastNameRequired
                        }
                        
                        if lastName.count < 2{
                            throw PassCreationError.lastNameRequired
                        } else if firstName.count < 2{
                            throw PassCreationError.firstNameRequired
                        }
                        
                        let pass = try seniorGuest(firstName: firstName, lastName: lastName, dateOfBirth: date)
                        
                        currentPass = pass
                        presentPassView()
                        print(pass, "pass")
                        
                    } else {print("date field error")}
                    
                } catch {
                    displayAlertWith(error: error)
                }
                
            }else if vipSelectionButton.alpha == 1.0{
                
                let pass = vipGuest()
                currentPass = pass
                presentPassView()
                print(pass)
                
            }else if seasonPassSelectionButton.alpha == 1.0{
                
                do{
                    
                    guard let firstName: String = firstNameTextField.text, firstNameTextField.text != "" else{
                        throw PassCreationError.firstNameRequired
                    }
                    
                    guard let lastName: String = lastNameTextField.text, lastNameTextField.text != "" else{
                        throw PassCreationError.lastNameRequired
                    }
                    
                    guard let streetAddress: String = streetAddressTextField.text, streetAddressTextField.text != nil else{
                        throw PassCreationError.streetAddressRequired
                    }
                    
                    guard let city: String = cityTextField.text, cityTextField.text != "" else {
                        throw PassCreationError.cityRequired
                    }
                    
                    guard let state: String = stateTextField.text, stateTextField.text != "" else{
                        throw PassCreationError.stateRequired
                    }
                    
                    guard let zip: String = zipTextField.text, zipTextField.text != "" else {
                        throw PassCreationError.zipRequired
                    }
                    
                    if lastName.count < 2{
                        throw PassCreationError.lastNameRequired
                    }
                    if firstName.count < 2{
                        throw PassCreationError.firstNameRequired
                    }
                    if streetAddress.count < 5{
                        throw PassCreationError.streetAddressRequired
                    }
                    if city.count < 2{
                        throw PassCreationError.cityRequired
                    }
                    if state.count < 2{
                        throw PassCreationError.stateRequired
                    }
                    if zip.count < 2 || !zip.isNumeric {
                        throw PassCreationError.zipRequired
                    }
                    
                    let pass = try seasonPassGuest(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipPostCode: zip)
                    
                    currentPass = pass
                    presentPassView()
                    print(pass)
                    
                }catch{
                    
                    displayAlertWith(error: error)
                    
                }
                
            }
            
            
        }else if employeeMenuButton.alpha == 1.0{
            
            do{
                
                guard let firstName: String = firstNameTextField.text, firstNameTextField.text != "" else{
                    throw PassCreationError.firstNameRequired
                }
                
                guard let lastName: String = lastNameTextField.text, lastNameTextField.text != "" else{
                    throw PassCreationError.lastNameRequired
                }
                
                guard let streetAddress: String = streetAddressTextField.text, streetAddressTextField.text != nil else{
                    throw PassCreationError.streetAddressRequired
                }
                
                guard let city: String = cityTextField.text, cityTextField.text != "" else {
                    throw PassCreationError.cityRequired
                }
                
                guard let state: String = stateTextField.text, stateTextField.text != "" else{
                    throw PassCreationError.stateRequired
                }
                
                guard let zip: String = zipTextField.text, zipTextField.text != "" else {
                    throw PassCreationError.zipRequired
                }
                
                print(zip.isNumeric)
                
                if lastName.count < 2{
                    throw PassCreationError.lastNameRequired
                }
                if firstName.count < 2{
                    throw PassCreationError.firstNameRequired
                }
                if streetAddress.count < 5{
                    throw PassCreationError.streetAddressRequired
                }
                if city.count < 2{
                    throw PassCreationError.cityRequired
                }
                if state.count < 2{
                    throw PassCreationError.stateRequired
                }
                if zip.count < 2 || !zip.isNumeric {
                    throw PassCreationError.zipRequired
                }
                
                var pass: Entrant? = nil
                
                if foodServicesSelectionButton.alpha == 1.0{
                    pass = try foodServiceEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipPostCode: zip)
                } else if rideServicesSelectionButton.alpha == 1.0{
                    pass = try rideServiceEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipPostCode: zip)
                } else if maintenanceSelectionButton.alpha == 1.0 {
                    pass = try maintenanceEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipPostCode: zip)
                } else if managerSelectionButton.alpha == 1.0{
                    pass = try managerEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipPostCode: zip)
                } else if contractSelectionButton.alpha == 1.0{
                    
                    guard let projectNumber = projectSelection.text, projectSelection.text != nil else{
                        throw PassCreationError.projectIdRequired
                    }
                    
                    var project: ContractProjects? = nil
                    
                    switch projectNumber {
                        
                    case "1001":
                        project = .proj1001
                    case "1002":
                        project = .proj1002
                    case "1003":
                        project = .proj1003
                    case "2001":
                        project = .proj2001
                    case "2002":
                        project = .proj2002
                    default:
                        print("wrong data for project number")
                        
                    }
                    
                    guard let projId = project else {
                        throw PassCreationError.projectIdRequired
                    }
                    
                    pass = try contractEmployee(firstName: firstName, lastName: lastName, streetAddress: streetAddress, city: city, state: state, zipPostCode: zip, project: projId)
                    
                }
                
                currentPass = pass
                presentPassView()
                
                print(pass!)
                
            }catch{
                
                displayAlertWith(error: error)
                
            }
            
        }else if vendorMenuButton.alpha == 1.0{
            
            do{
                if let dateString = dateOfBirth.text, dateOfBirth.text != "" {
                    
                if let dateStringVisit = dateOfVisit.text, dateOfVisit.text != "" {
                            
                    guard let date = try dateFromString(dateString) else{
                        throw PassCreationError.stringToDateConversionError
                    }
                    
                    guard let dateVisit = try dateFromString(dateStringVisit) else{
                        throw PassCreationError.stringToDateConversionError
                    }
                    
                    guard let vendorCompany = vendorCompany.text else{
                        throw PassCreationError.vendorCompanyRequired
                    }
                    
                    guard let firstName: String = firstNameTextField.text, firstNameTextField.text != "" else{
                        throw PassCreationError.firstNameRequired
                    }
                    
                    guard let lastName: String = lastNameTextField.text, lastNameTextField.text != "" else{
                        throw PassCreationError.lastNameRequired
                    }
                    
                    if lastName.count < 2{
                        throw PassCreationError.lastNameRequired
                    } else if firstName.count < 2{
                        throw PassCreationError.firstNameRequired
                    }
                    
                    var vndrCompany: VendorCompany? = nil
                    
                    switch vendorCompany {
                        
                    case "Acme":
                        vndrCompany = .acme
                    case "Orkin":
                        vndrCompany = .orkin
                    case "Fedex":
                        vndrCompany = .fedex
                    case "NW Electrical":
                        vndrCompany = .nwElectrical
                    default:
                        print("wrong data for project number")
                        
                    }
                    
                    guard let vndr = vndrCompany else{
                        throw PassCreationError.vendorCompanyRequired
                    }
                    
                    let pass = try vendor(firstName: firstName, lastName: lastName, vendorCompany: vndr, dateOfBirth: date, dateOfVisit: dateVisit)
                    
                    currentPass = pass
                    
                    presentPassView()
                    
                    print(pass, "pass")
                            
                } else {displayAlertWith(error: PassCreationError.dateofVisitRequired)}
                    
                } else {displayAlertWith(error: PassCreationError.dateOfBirthRequired)}
                
            } catch {
                
                displayAlertWith(error: error)
                
            }
            
        }
        
        // init with required fields
        
        // present pass view
        
    }
    
    // Display the pass details in passview
    func presentPassView(){
        
        
        guard let pass = currentPass else{
            return
        }
        
        if pass.areaAccess.contains(.rideEntry){
            
            rideStatus.text = "Unlimited Ride Access"
            
        }else {
            
            rideStatus.text = "No Ride Access"
            
        }
        
        if pass.foodDiscount != 0.0 {
            foodDiscountLabel.text = "\(pass.foodDiscount)% Food Discount"
        }else {
            foodDiscountLabel.text = "No Food Discount"
        }
        
        if pass.merchDiscount != 0.0 {
            merchDiscountLabel.text = "\(pass.merchDiscount)% Merch Discount"
        }else {
            merchDiscountLabel.text = "No Merch Discount"
        }
            
        passName.text = pass.passTitle
        typeOfPass.text = pass.passSubtitle
        
        self.passView.isHidden = false
        
    }
    
    @IBAction func closePassScreen(_ sender: Any) {
        
        //Hide passview and touch guestMenu, which in turn touches the free child option
        self.passView.isHidden = true
        
        topMenuPressed(guestMenuButton)
        
        currentPass = nil
        
        //result resultsfield appearance
        resultsField.backgroundColor = .clear
        
        resultsField.text = "Test Results"
        
        resultsField.textColor = .lightGray
        
    }
    
    // Test Swipe Button
    
    @IBAction func testSwipes(_ sender: UIButton) {
        //Determine the swipe location
        let swipeLocation: AreaAccess
        
        switch sender {
        case rideEntryButton:
            swipeLocation = .rideEntry
        case amusementAreaButton:
            swipeLocation = .amusementAreas
        case kitchenAreaButton:
            swipeLocation = .kitchenAreas
        case rideControlButton:
            swipeLocation = .rideControlAreas
        case maintenanceAreaButton:
            swipeLocation = .maintenanceAreas
        case officeAreaButton:
            swipeLocation = .officeAreas
        case merchDiscount:
            swipeLocation = .shopDiscount
        case foodDiscountButton:
            swipeLocation = .foodDiscount
        default:
            swipeLocation = .rideEntry
        }
        
        var hasAccess: Bool? = false
        
        do{
        
        hasAccess = try currentPass?.swipe(atLocation: swipeLocation)
            
        }catch PassSwipeError.swipedTooRecently{
            //Catch swiped too recently error, display alert based on the error
            displayAlertWith(error: PassSwipeError.swipedTooRecently)
            
        }catch{
                print(error)
        }
        
        //Unwrap Bool
        guard let doesHaveAccess = hasAccess else{
            
            return
            
        }
            //Dealth the access bool value
            if doesHaveAccess{
                
            resultsField.backgroundColor = .green
            resultsField.text = "ACCESS GRANTED"
                // If it's a shop that has swiped the pass, display relevant discount
                if swipeLocation == .foodDiscount {resultsField.text = foodDiscountLabel.text}
                if swipeLocation == .shopDiscount {resultsField.text = merchDiscountLabel.text}
                
            resultsField.textColor = .white
            //play sound
            playGrantedSound()
                
            }else if !doesHaveAccess {
            displayAlertWith(error: PassSwipeError.accessDenied)
            resultsField.backgroundColor = .red
            resultsField.text = "ACCESS DENIED"
            resultsField.textColor = .white
            //play sound
            playDeniedSound()
                
        }
        
    }
    
    func displayAlertWith(error: Error){
        
        // I didnt want Pasan to tie me up in his basement for repeating alerts for the same error in code, so I made this function which displays alerts based on the error.
        
        let title: String
        let subTitle: String
        let buttonTitle: String
        
        switch error {
        case PassCreationError.dateOfBirthRequired:
            title = "Date of Birth Required"
            subTitle = "Please ensure you select a date of birth"
            buttonTitle = "OK"
        case PassCreationError.firstNameRequired:
            title = "First name required"
            subTitle = "Please ensure you enter a first name of at least 2 characters"
            buttonTitle = "OK"
        case PassCreationError.lastNameRequired:
            title = "Last Name Required"
            subTitle = "Please ensure you enter a last name of at least 2 characters"
            buttonTitle = "OK"
        case PassCreationError.companyNameRequired:
            title = "Company Name Required"
            subTitle = "Please ensure you select a company name"
            buttonTitle = "OK"
        case PassCreationError.streetAddressRequired:
            title = "Street Address Required"
            subTitle = "Please ensure you enter a street address of at least 5 characters"
            buttonTitle = "OK"
        case PassCreationError.cityRequired:
            title = "City Required"
            subTitle = "Please ensure you enter a city of at least 2 characters"
            buttonTitle = "OK"
        case PassCreationError.stateRequired:
            title = "State Required"
            subTitle = "Please ensure you select a state of at least 2 characters"
            buttonTitle = "OK"
        case PassCreationError.zipRequired:
            title = "Zip Required"
            subTitle = "Please ensure you select a zip that is numerical"
            buttonTitle = "OK"
        case PassCreationError.projectIdRequired:
            title = "Project ID Required"
            subTitle = "Please ensure you select a Project ID"
            buttonTitle = "OK"
        case PassCreationError.vendorCompanyRequired:
            title = "Vendor Company Required"
            subTitle = "Please ensure you select a company"
            buttonTitle = "OK"
        case PassCreationError.dateofVisitRequired:
            title = "Date of Visit Required"
            subTitle = "Please ensure you select a visit date"
            buttonTitle = "OK"
        case PassCreationError.stringToDateConversionError:
            title = "Date format error"
            subTitle = "Please ensure you enter a date in the following format: Apr 21, 2019. MMM DD, YYYY"
            buttonTitle = "OK"
        case PassSwipeError.swipedTooRecently:
            title = "Pass Swiped Too Recently"
            subTitle = "Please allow 5 seconds between swipes"
            buttonTitle = "OK"
        case PassSwipeError.accessDenied:
            title = "No Access To This Location"
            subTitle = "Access Denied"
            buttonTitle = "OK"
        default:
            title = "Error"
            subTitle = "\(error)"
            buttonTitle = "OK"
        }
        
        let alert = UIAlertController(title: title, message: subTitle, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        
        self.present(alert, animated: true)
        
    }
    
    // Another function to stop repeat code
    
    func dateFromString(_ string: String) throws -> Date?  {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        print(string)
        
        if string == ""{
            
            print("error")
            throw PassCreationError.stringToDateConversionError
            
        }
        
        guard let date = dateFormatter.date(from: string) else{
            
            throw PassCreationError.stringToDateConversionError
            
        }
        
        return date
        
    }
    
    // Sound init code
    
    func loadGameStartSound() {
        
        let pathToCorrectSoundFile = Bundle.main.path(forResource: "AccessGranted", ofType: "wav")
        let correctGameURL = URL(fileURLWithPath: pathToCorrectSoundFile!)
        AudioServicesCreateSystemSoundID(correctGameURL as CFURL, &accessGrantedSound)
        
        let pathToIncorrectSoundFile = Bundle.main.path(forResource: "AccessDenied", ofType: "wav")
        
        let soundIncorrectURL = URL(fileURLWithPath: pathToIncorrectSoundFile!)
        AudioServicesCreateSystemSoundID(soundIncorrectURL as CFURL, &AccessDeniedSound)
        
    }
    
    ///Function that plays a sound when an answer is incorrect
    func playDeniedSound() {
        AudioServicesPlaySystemSound(AccessDeniedSound)
    }
    ///Function that plays a sound when an answer is correct
    func playGrantedSound() {
        AudioServicesPlaySystemSound(accessGrantedSound)
    }
    
    //Observer function for the Birthday Alert
    
    @objc func birthdayAlert(){
        
        let alert = UIAlertController(title: "Happy Birthday!!", message: "Have a 1337 Birthday!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true)
        
        print("birthday alert")
    }
    
}

//String extension for zip code auth

extension String {
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
}
