//
//  Api.swift
//  Parcerias Barclays Moçambique
//
//  Created by Isidoro Pedro Da Silva Junior on 12/19/18.
//  Copyright © 2018 Alex K. All rights reserved.
//

import Foundation
class Aliance {
    var key: String
    var Title: String
    var Rating: String
    var Description: String
    var photo: String
    var email: String
    var location: String
    var telefone: String
    var linkdetalhes: String
    
    init(dictionary: [String: AnyObject], key: String) {
        self.key = key
        self.Title = dictionary["Title"] as! String
        self.Description = dictionary["Description"] as! String
        self.photo = dictionary["photo"] as! String
        self.Rating = dictionary["Rating"] as! String
        self.email = dictionary["email"] as! String
        self.location = dictionary["location"] as! String
        self.telefone = dictionary["telefone"] as! String
        self.linkdetalhes = dictionary["linkdetalhes"] as! String
    }
}
