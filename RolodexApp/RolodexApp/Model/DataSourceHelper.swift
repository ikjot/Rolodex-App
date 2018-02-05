//
//  DataSourceHelper.swift
//  RolodexApp
//
//  Created by Ikjot Kaur on 2/5/18.
//  Copyright © 2018 Ikjot Kaur. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataSourceHelper {
    let API = "https://s3-us-west-2.amazonaws.com/udacity-mobile-interview/CardData.json"
    private init() {}
    static let sharedInstance = DataSourceHelper()

    func getCardData(completion:@escaping (Data?)->()) {
        guard let apiLink = URL(string: API) else {return }
        Alamofire.request(apiLink).responseJSON { (response) in
            if(response.error != nil) {
                print("Request failed")
                return
            }
            else {
                 completion(response.data)
            }
        }
    }
    
    
}
