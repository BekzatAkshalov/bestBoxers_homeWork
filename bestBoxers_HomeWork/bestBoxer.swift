//
//  bestBoxer.swift
//  bestBoxers_HomeWork
//
//  Created by Bekzat on 25/11/24.
//

import Foundation
import SwiftyJSON

struct bestBoxer {
    var name = ""
    var birthDate = ""
    var title = ""
    var country = ""
    var photo = ""
    
    init(json: JSON) {
        if let item = json["name"].string {
            name = item
        }
        if let item = json["dateofbirth"].string {
            birthDate = item
        }
        if let item = json["titles"].string {
            title = item
        }
        if let item = json["country"].string {
            country = item
        }
        if let item = json["photo"].string {
            photo = item
        }
    }
    
}
