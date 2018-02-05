//
//  PersonDetails.swift
//  RolodexApp
//
//  Created by Ikjot Kaur on 2/5/18.
//  Copyright © 2018 Ikjot Kaur. All rights reserved.
//

import UIKit

class PersonDetails: UIViewController {
    
    
    var person:Person?

    @IBOutlet weak var bioLbl: UITextView!
    @IBOutlet weak var startLbl: UILabel!
    @IBOutlet weak var companyLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var firstNameLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let fName = person?.firstName else {return}
        guard let sName = person?.lastName else {return}
        title = "\(fName) \(sName)"
        displayData()
    }
    
    
    func displayData() {
        bioLbl.text = person?.bio
        startLbl.text = person?.startDate
        companyLbl.text = person?.company
        emailLbl.text = person?.email
        lastNameLbl.text = person?.lastName
        firstNameLbl.text = person?.firstName
        
    }


}
