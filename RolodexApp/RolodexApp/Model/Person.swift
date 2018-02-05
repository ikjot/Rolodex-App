//
//  Person.swift
//  RolodexApp
//
//  Created by Ikjot Kaur on 2/5/18.
//  Copyright © 2018 Ikjot Kaur. All rights reserved.
//

import Foundation
import SwiftyJSON

class Person {
    private var _lastName : String!
    private var _firstName : String!
    private var _email : String!
    private var _company : String
    private var _startDate : String!
    private var _bio : String!
    private var _avatar : String!
  
    var lastName : String {
        get {
            return self._lastName
        }
        set {
            self._lastName = newValue
        }
    }
    
    var firstName : String {
        get {
            return self._firstName
        }
        set {
            self._firstName = newValue
        }
    }
    
    var email : String {
        get {
            return self._email
        }
        set {
            self._email = newValue
        }
    }
    
    var company : String {
        get {
            return self._company
        }
        set {
            self._company = newValue
        }
    }
    var startDate : String {
        get {
            return self._startDate
        }
        set {
            self._startDate = newValue
        }
    }
    var bio : String {
        get {
            return self._bio
        }
        set {
            self._bio = newValue
        }
    }
    var avatar : String {
        get {
            return self._avatar
        }
        set {
            self._avatar = newValue
        }
    }
    
    init(lastName : String, firstName : String, email : String, company : String, startDate : String, bio : String, avatar : String) {
        self._lastName = lastName
        self._firstName = firstName
        self._email = email
        self._company = company
        self._startDate = startDate
        self._bio = bio
        self._avatar = avatar
    }
    
    static func getPersonData(completion : @escaping([Person]) -> ()) {
        DataSourceHelper.sharedInstance.getCardData { (data) in
            if(data == nil) {
                return
            }
            else {
                if let dataPerson = data {
                    do {
                    let json = try JSON(data : dataPerson)
                        var personArr : [Person] = []
                        for index in 0...json.count - 1{
                            guard let jlastName = json[index]["lastName"].string else {return}
                            guard let jemail = json[index]["email"].string else {return}
                            guard let jstartDate = json[index]["startDate"].string else {return}
                            guard let javatar = json[index]["avatar"].string else {return}
                            guard let jfirstName = json[index]["firstName"].string else {return}
                            guard let jcompany = json[index]["company"].string else {return}
                            guard let jbio = json[index]["bio"].string else {return}
                            
                            let newPerson = Person(lastName: jlastName, firstName: jfirstName, email: jemail, company: jcompany, startDate: jstartDate, bio: jbio, avatar: javatar)
                            personArr.append(newPerson)
                        
                        }
                        completion(personArr)
                    }
                    catch {
                        
                    }
                }
            }
        }
    
    }
}
