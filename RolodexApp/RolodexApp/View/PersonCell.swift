//
//  PersonCell.swift
//  RolodexApp
//
//  Created by Ikjot Kaur on 2/5/18.
//  Copyright © 2018 Ikjot Kaur. All rights reserved.
//

import UIKit

class PersonCell: UICollectionViewCell {
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var personImageView: UIImageView!
    @IBOutlet weak var fullNameLbl: UILabel!
    
    
    
    func configureCell(person:Person,image:UIImage?) {
        if let image = image{
            self.personImageView.image = image
            spinner.stopAnimating()
        }
        let fullName = person.firstName + " " + person.lastName
        self.fullNameLbl.text = fullName
        
    }
    
    
    
    
    
    
}
